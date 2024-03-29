#!/bin/bash
# If you're relatively new to Kubernetes, you can use this script to manage the K8s cluster. You can run the different Kubectl commands with the assistance of this script.
# Feel free to make any necessary updates to the script.

# Function to check if kubectl is installed
check_kubectl() {
    command -v kubectl >/dev/null 2>&1 || { echo >&2 "kubectl is required but not installed. Aborting."; exit 1; }
}

# Function to check if jq is installed
check_jq(){ 
    if ! command -v jq &> /dev/null; then
        echo "jq not found. Please install jq first."
    fi
}

# Function to check if xlsxwriter is installed
check_xlsxwriter(){
    if ! python3 -c "import xlsxwriter" &> /dev/null; then
        echo "xlsxwriter not found. Please install xlsxwriter first."
    fi
}

# Function to print a centered string with padding
centered() {
  local width=$1
  local text=$2
  local padding=$((($width - ${#text}) / 2))
  printf "%*s%s%*s" $padding "" "$text" $padding ""
}

# Function to print the header
display_header() {
    printf "+-------------------------------------+\n"
    printf "| %s |\n" "$(centered "$1" "$2")"
    printf "+-------------------------------------+\n"
}

# Function to display the main menu
display_main_menu() {
    display_header 35 "Welcome to kubectl Helper"
    # Printing the Available Options
    printf "| %-35s |\n" "1. Get Resources"
    printf "| %-35s |\n" "2. Describe Resources"
    printf "| %-35s |\n" "3. Get logs for a pod"
    printf "| %-35s |\n" "4. Delete Resources"
    printf "| %-35s |\n" "5. Nodes"
    printf "| %-35s |\n" "6. Contexts"
    printf "| %-35s |\n" "7. Patch"
    printf "| %-35s |\n" "8. Adding Annotations"
    printf "| %-35s |\n" "9. Adding lables"
    printf "| %-35s |\n" "10. Create Resources"
    printf "| %-35s |\n" "11. Debug Pods"
    printf "| %-35s |\n" "12. Create excel report"
    printf "| %-35s |\n" "13. Exit"
    printf "+-------------------------------------+\n"
    read -p "Enter your choice (1-13): " choice
}

exit_function()
{
    echo "Exiting the kubectl helper. See you soon!"
    exit 0
}
# Function to select the namespace
get_namespace(){
    kubectl get namespace | awk '{print $1}'
    read -p "Enter the namespace name from the above list: " namespace
}

# Function to list Kubernetes resources based on user selection
get_k8s_resource() {
        case $1 in
            1)  while true; do
                    echo "Select an option from below:"
                    echo "1. Get pods from all namespaces"
                    echo "2. Get pods from specific namespace"
                    echo "3. Go back"
                    echo "4. Main Menu"
                    echo "5. Exit"
                    read -p "Enter your choice (1-5): " podchoice
                    case $podchoice in
                        1)  echo "Getting pods in all namespaces:"
                                kubectl get pods --all-namespaces ;;
                        2)  echo "Getting pods from specific namespace:"
                                get_namespace
                                kubectl get pods -n $namespace ;;
                        3)  select_resources ;;
                        4)  main ;;
                        5)  exit_function ;;
                        *) echo "Invalid choice. Please enter a number between 1 and 5." ;;
                    esac
                done ;;
            2)  kubectl get deployments ;;
            3)  kubectl get services ;;
            4)  kubectl get replicasets ;;
            5)  kubectl get statefulsets ;;
            6)  kubectl get configmaps ;;
            7)  kubectl get secrets ;;
            8)  kubectl get persistentvolumes ;;
            9)  kubectl get persistentvolumeclaims ;;
            10) kubectl api-resources | awk '{print $1}'  
                read -p "Please enter the resource name to be listed from the above list: " resource_name
                kubectl get $resource_name --all-namespaces;;
            11) main ;;
            12) exit_function ;;
            *)  echo "Invalid option. Please enter a number between 1 and 12." ;;
        esac
}

# Function to List Resources
select_resources() {
    while true; do
        display_header 35 "Select the Resource to be listed"
        options=("Pods" "Deployments" "Services" "ReplicaSets" "StatefulSets" "ConfigMaps" "Secrets" "PersistentVolumes" "PersistentVolumeClaims" "Other" "Main Menu" "Exit")

        select option in "${options[@]}"; do
                case $option in
                    *) get_k8s_resource $REPLY ;;
                esac
                break
        done
    done

}

# Function to get logs for a pod
get_pod_logs() {
    echo "select a namespace of the pod to get the logs"
    get_namespace
    kubectl get pod -n $namespace | awk '{print $1}'
    read -p "Enter the name of the pod from the above list to view the logs: " pod_name

    #calculate the containers count
    container_count=$(kubectl get pod "$pod_name" -o=jsonpath='{.spec.containers[*].name}' | tr -cd ' ' | wc -c)
    # Add 1 to account for the fact that container names are space-separated
    ((container_count++))

    if [ $container_count -eq 1 ]; then
        echo "Fetching logs for pod $pod_name in namespace $namespace:"
        kubectl logs -n $namespace $pod_name
    else
        kubectl get pod "$pod_name" -o=jsonpath='{.spec.containers[*].name}'
        echo -e "\nPod $pod_name has morethan two containers, please select the one of the container from above to view the logs:"
        read container_name
        echo "Fetching logs for pod $pod_name container $container_name in namespace $namespace:"
        kubectl logs -n $namespace $pod_name -c $container_name
    fi
}

# Function to describe Kubernetes resources based on user selection
describe_k8s_resource(){
    get_namespace
    kubectl get $1 -n $namespace | awk '{print $1}'
    read -p "Enter a $1 name from above list to describe: " describe_workload
    kubectl describe $1 $describe_workload -n $namespace
}

# Function to trigger describe function based on user selection
describe_k8s_resources() {
        case $1 in
            1)  describe_k8s_resource Pod ;;
            2)  describe_k8s_resource Deployment ;;
            3)  describe_k8s_resource Service ;;
            4)  describe_k8s_resource Daemonset ;;
            5)  describe_k8s_resource Statefulset ;;
            6)  describe_k8s_resource Configmap ;;
            7)  describe_k8s_resource Secret ;;
            8)  kubectl api-resources | awk '{print $1}'  
                read -p "Please enter the resource name to be described from the above list: " resource_name_to_describe
                describe_k8s_resource $resource_name_to_describe ;;
            9)  main ;;
            10) exit_function ;;
            *)  echo "Invalid option. Please enter a number between 1 and 12." ;;
        esac
}

# Function to choose an option to describe a Resource
describe_resources() {
    while true; do
        display_header 35 "Select the Resource to be described"

        options=("Pods" "Deployments" "Services" "Daemonsets" "StatefulSets" "ConfigMaps" "Secrets" "Other" "Main Menu" "Exit")

        select option in "${options[@]}"; do
                case $option in
                    *) describe_k8s_resources $REPLY ;;
                esac
                break
        done
    done
}

# Function to delete the k8's resource
delete_k8s_resource(){
    get_namespace
    kubectl get $1 -n $namespace | awk '{print $1}'
    read -p "Enter the name of the $1 from above list to delete, you can enter multiple resources like (pod1 pod2): " deleting_resource_name
    while true; do
        read -p "Do you want to proceed with Deleting $1 $deleting_resource_name in namespace $namespace...? (yes/no): " response
        # Convert the response to lowercase for case-insensitive comparison
        response_lower=$(echo "$response" | tr '[:upper:]' '[:lower:]')
        if [[ "$response_lower" == "yes" || "$response_lower" == "y" ]]; then
            echo "Deleting $1 $deleting_resource_name in namespace $namespace..."
            kubectl delete $1 -n $namespace $deleting_resource_name
            exit 0 ;
        elif [[ "$response_lower" == "no" || "$response_lower" == "n" ]]; then
            echo "Deleting $1 $deleting_resource_name in namespace $namespace is cancelled"
            exit 0 ;
        else
            echo "Invalid response. Please enter 'yes', 'no', 'y', or 'n'."
        fi  
    done
}

# Function to trigger delete function based on user selection
delete_k8s_resources() {
        case $1 in
            1)  delete_k8s_resource Pod ;;
            2)  delete_k8s_resource Deployment ;;
            3)  delete_k8s_resource Service ;;
            4)  delete_k8s_resource Daemonset ;;
            5)  delete_k8s_resource Statefulset ;;
            6)  delete_k8s_resource Configmap ;;
            7)  delete_k8s_resource Secret ;;
            8)  kubectl api-resources | awk '{print $1}'  
                read -p "Please enter the resource name to be deleted from the above list: " resource_name_to_delete
                delete_k8s_resource $resource_name_to_delete ;;
            9)  main ;;
            10) exit_function ;;
            *)  echo "Invalid option. Please enter a number between 1 and 12." ;;
        esac
}

# Function to delete a pod
delete_resources() {
    while true; do
        display_header 35 "Select the Resource to be deleted"
        options=("Pods" "Deployments" "Services" "Daemonsets" "StatefulSets" "ConfigMaps" "Secrets" "Other" "Main Menu" "Exit")

        select option in "${options[@]}"; do
                case $option in
                    *) delete_k8s_resources $REPLY ;;
                esac
                break
        done
    done 
}

# Function to get node names
get_node_name()
{
    kubectl get nodes | awk '{print $1}'
    read -p "Enter the name of the node from above list: " node_name
}

# Function to get node status
get_node_status() {
    get_node_name
    check_jq
    echo "Getting status for node $node_name:"
    kubectl get node $node_name -o json | jq '.status.conditions'
}

# Function to get node configuration
get_node_config() {
    get_node_name
    check_jq
    echo "Getting configuration for node $node_name:"
    kubectl get node $node_name -o json | jq '.metadata'
}

# Function to get nodes commands
nodes_commands() {
    while true; do
        display_header 35 "kubectl Worker Node Commands"
        printf "| %-35s |\n" " 1. Get nodes"
        printf "| %-35s |\n" " 2. Describe a node"
        printf "| %-35s |\n" " 3. Get node status"
        printf "| %-35s |\n" " 4. Get node configuration"
        printf "| %-35s |\n" " 5. Get node events"
        printf "| %-35s |\n" " 6. Drain a node (evicting pods)"
        printf "| %-35s |\n" " 7. Cordon node(make unschedulable)"
        printf "| %-35s |\n" " 8. Uncordon node(make schedulable)"
        printf "| %-35s |\n" " 9. View system logs for a node"
        printf "| %-35s |\n" "10. View kubelet logs for a node"
        printf "| %-35s |\n" "11. Get node metrics"
        printf "| %-35s |\n" "12. Get node components(kubelet..)"
        printf "| %-35s |\n" "13. Get node resource usage"
        printf "| %-35s |\n" "14. Main Menu"
        printf "| %-35s |\n" "15. Exit"
        printf "+-------------------------------------+\n"
        read -p "Enter your choice (1-15): " choice

            case $choice in
                1)  echo "Getting nodes:"
                    kubectl get nodes ;;
                2)  get_node_name
                    echo "Describing node $node_name:"
                    kubectl describe node $node_name ;;
                3)  get_node_status ;;
                4)  get_node_config ;;
                5)  get_node_name
                    echo "Getting events for node $node_name:"
                    kubectl get events --field-selector involvedObject.name=$node_name --sort-by=.metadata.creationTimestamp ;;
                6)  get_node_name
                    echo "Draining node $node_name (evicting pods):"
                    kubectl drain $node_name --ignore-daemonsets ;;
                7)  get_node_name
                    echo "Cordoning (making unschedulable) node $node_name:"
                    kubectl cordon $node_name ;;
                8)  get_node_name
                    echo "Uncordoning (making schedulable) node $node_name:"
                    kubectl uncordon $node_name ;;
                9)  get_node_name
                    echo "Viewing system logs for node $node_name:"
                    kubectl logs -n kube-system $(kubectl get pods -n kube-system --field-selector spec.nodeName=$node_name -o jsonpath='{.items[0].metadata.name}') ;;
                10) get_node_name
                    echo "Viewing kubelet logs for node $node_name:"
                    kubectl logs -n kube-system $(kubectl get pods -n kube-system --field-selector spec.nodeName=$node_name -o jsonpath='{.items[0].metadata.name}') ;;
                11) echo "Node metrics:"
                    kubectl top node ;;
                12) get_node_name
                    echo "Getting components for node $node_name:"
                    kubectl get pods --all-namespaces --field-selector spec.nodeName=$node_name ;;
                13) get_node_name
                    echo "Getting resource usage for node $node_name:"
                    kubectl describe node $node_name | grep -E '(Allocatable|Capacity|Conditions|Addresses|System Info|Non-terminated Pods|Container Runtime Version)' ;;
                14) main ;;
                15) exit_function ;;
                *)  echo "Invalid choice. Please enter a number between 1 and 13." ;;
            esac
    done
}

# Function to list available contexts
list_contexts() {
    kubectl config get-contexts
}

# Function to switch to a specific context
switch_context() {
    list_contexts
    read -p "Select a context to switch from above list:: " context_name
    # Check if the context exists in kubeconfig
    if kubectl config get-contexts | grep -q "$context_name"; then
        kubectl config use-context "$context_name"
        echo "Switched to context: $context_name"
    else
        echo "Context '$context_name' not found in kubeconfig."
    fi
}

# Function to delete a context
delete_context() {
    list_contexts
    read -p "Select a context to delete from above list:: " context_name
    # Check if the context exists in kubeconfig
    if kubectl config get-contexts | grep -q "$context_name"; then
        kubectl config delete-context "$context_name"
        echo "Context '$context_name' deleted."
    else
        echo "Context '$context_name' not found in kubeconfig."
    fi
}

# Context Function
context_commands(){
    while true; do
        display_header 35 "Kubernetes Context Management"
        printf "| %-35s |\n" " 1. Display current context"
        printf "| %-35s |\n" " 2. List available contexts"
        printf "| %-35s |\n" " 3. Switch to a specific context"
        printf "| %-35s |\n" " 4. Delete a context"
        printf "| %-35s |\n" " 5. Main Menu"
        printf "| %-35s |\n" " 6. Exit"
        printf "+-------------------------------------+\n"
        read -p "Enter your choice (1-6): " choice
        case $choice in
            1) kubectl config current-context ;;
            2) list_contexts ;;
            3) switch_context ;;
            4) delete_context ;;
            5) main ;;
            6) exit_function ;;
            *) echo "Invalid option" ;;
        esac
    done
}

patch_k8s_resource(){
    get_namespace
    kubectl get $1 -n $namespace | awk '{print $1}'
    read -p "Enter the name of the $1 from above list to patch: " patching_resource_name 
    read -p "Enter the patching file:" patching_file 
    echo "Patching $1 $patching_resource_name in namespace $namespace..."
    kubectl patch $1 -n $namespace $patching_resource_name -p "$(cat $patching_file)"
}

# Function to trigger patch function based on user selection
patch_k8s_resources() {
        case $1 in
            1)  patch_k8s_resource Pod ;;
            2)  patch_k8s_resource Deployment ;;
            3)  patch_k8s_resource Service ;;
            4)  patch_k8s_resource Daemonset ;;
            5)  patch_k8s_resource Statefulset ;;
            6)  patch_k8s_resource Configmap ;;
            7)  patch_k8s_resource Secret ;;
            8)  kubectl api-resources | awk '{print $1}'  
                read -p "Please enter the resource name to be patched from the above list: " resource_name_to_patch
                patch_k8s_resource $resource_name_to_patch ;;
            9)  main ;;
            10) exit_function ;;
            *)  echo "Invalid option. Please enter a number between 1 and 12." ;;
        esac
}

# Function to patch a kubernetes resource
patch_resources() {
    while true; do
        display_header 35 "Select the Resource to be patched"
        options=("Pods" "Deployments" "Services" "Daemonsets" "StatefulSets" "ConfigMaps" "Secrets" "Other" "Main Menu" "Exit")

        select option in "${options[@]}"; do
                case $option in
                    *) patch_k8s_resources $REPLY ;;
                esac
                break
        done
    done 
}

annotate_k8s_resource(){
    get_namespace
    kubectl get $1 -n $namespace | awk '{print $1}'
    read -p "Enter the name of the $1 from above list to annotate: " annotatting_resource_name 
    read -p "Enter the Annotating key name:" annotating_key_name
    read -p "Enter the Annotating key value:" annotating_key_value
    echo "Update/overwrite the annotation for $1 $annotatting_resource_name in namespace $namespace..."
    kubectl annotate $1 -n $namespace $annotatting_resource_name --overwrite $annotating_key_name="$annotating_key_value"
}

# Function to trigger patch function based on user selection
annotate_k8s_resources() {
        case $1 in
            1)  annotate_k8s_resource Pod ;;
            2)  annotate_k8s_resource Deployment ;;
            3)  annotate_k8s_resource Service ;;
            4)  annotate_k8s_resource Daemonset ;;
            5)  annotate_k8s_resource Statefulset ;;
            6)  annotate_k8s_resource Configmap ;;
            7)  annotate_k8s_resource Secret ;;
            8)  kubectl api-resources | awk '{print $1}'  
                read -p "Please enter the resource name to be annotated from the above list: " resource_name_to_annotate
                annotate_k8s_resource $resource_name_to_annotate ;;
            9)  main ;;
            10) exit_function ;;
            *)  echo "Invalid option. Please enter a number between 1 and 12." ;;
        esac
}

# Function to annotate a kubernetes resource
annotate_resources() {
    while true; do
        display_header 35 "Select the Resource to be Annotated"
        options=("Pods" "Deployments" "Services" "Daemonsets" "StatefulSets" "ConfigMaps" "Secrets" "Other" "Main Menu" "Exit")

        select option in "${options[@]}"; do
                case $option in
                    *) annotate_k8s_resources $REPLY ;;
                esac
                break
        done
    done 
}


label_k8s_resource(){
    get_namespace
    kubectl get $1 -n $namespace | awk '{print $1}'
    read -p "Enter the name of the $1 from above list to be labeled: " lebeling_resource_name 
    read -p "Enter the Label key name:" labeling_key_name
    read -p "Enter the Label key value:" labeling_key_name
    echo "Update/overwrite the annotation for $1 $lebeling_resource_name in namespace $namespace..."
    kubectl annotate $1 -n $namespace $lebeling_resource_name --overwrite $labeling_key_name="$labeling_key_name"
}

# Function to trigger patch function based on user selection
labeling_k8s_resources() {
        case $1 in
            1)  label_k8s_resource Pod ;;
            2)  label_k8s_resource Deployment ;;
            3)  label_k8s_resource Service ;;
            4)  label_k8s_resource Daemonset ;;
            5)  label_k8s_resource Statefulset ;;
            6)  label_k8s_resource Configmap ;;
            7)  label_k8s_resource Secret ;;
            8)  kubectl api-resources | awk '{print $1}'  
                read -p "Please enter the resource name to be labeled from the above list: " resource_name_to_annotate
                label_k8s_resource $resource_name_to_annotate ;;
            9)  main ;;
            10) exit_function ;;
            *)  echo "Invalid option. Please enter a number between 1 and 12." ;;
        esac
}

# Function to annotate a kubernetes resource
labeling_resources() {
    while true; do
        display_header 35 "Select the Resource to be Labeled"
        options=("Pods" "Deployments" "Services" "Daemonsets" "StatefulSets" "ConfigMaps" "Secrets" "Other" "Main Menu" "Exit")

        select option in "${options[@]}"; do
                case $option in
                    *) labeling_k8s_resources $REPLY ;;
                esac
                break
        done
    done 
}

create_resources(){
    read -p "Please enter the manifest file name with complete path (like /path/to/nginx-service.yaml) to create the respective resource: " resource_manifest
    echo "Creating kubernetes resource using $resource_manifest"
    kubectl apply -f $resource_manifest
}

debug_pods(){
    get_namespace
    kubectl get pod -n $namespace | awk '{print $1}'
    read -p "Please enter the pod name from above list to create a debug pod: " debug_pod_name
    echo "Creating  debug_pod/$debug_pod_name in $namespace:"
    kubectl debug $debug_pod_name -it --image=busybox --share-processes --copy-to="${debug_pod_name}-$(date +"%H%M%S")-debug"
}

# Set the output Excel file name
excel_file="k8's_data_$(date +'%Y-%m-%d_%H-%M-%S').xlsx"

# Function to fetch and process Kubernetes data
fetch_k8s_data() {
    check_jq
    check_xlsxwriter

    # Fetch pods data
    pods_data=$(kubectl get pods -A -o json)

    # Extract relevant information using jq
    pod_names=$(echo "$pods_data" | jq -r '.items[].metadata.name')
    pod_namespace=$(echo "$pods_data" | jq -r '.items[].metadata.namespace')
    pod_statuses=$(echo "$pods_data" | jq -r '.items[].status.phase')

    # Create Excel file
    python3 <<EOF
import xlsxwriter

# Create a new Excel workbook and add a worksheet.
workbook = xlsxwriter.Workbook("$excel_file")
worksheet = workbook.add_worksheet()

# Add a bold format to use to highlight cells.
bold = workbook.add_format({'bold': True})

# Write some data headers with the bold format.
worksheet.write('A1', 'Pod Name', bold)
worksheet.write('B1', 'Namespace', bold)
worksheet.write('C1', 'Status', bold)

# Write data from Kubernetes Cluster.
pod_names = """$pod_names""".splitlines()
pod_namespace = """$pod_namespace""".splitlines()
pod_statuses = """$pod_statuses""".splitlines()

for row_num, (pod_name, pod_namespace, pod_status) in enumerate(zip(pod_names, pod_namespace, pod_statuses), start=1):
    worksheet.write(row_num, 0, pod_name)
    worksheet.write(row_num, 1, pod_namespace)
    worksheet.write(row_num, 2, pod_status)

# Close the Excel workbook.
workbook.close()
EOF
    display_header 35 "Excel File Creation Status"
    printf "| %-35s |\n" "The excel file has been created"
    printf "| %-35s |\n" "succesfully with the following name" 
    printf "| %-35s |\n" "$excel_file"
    printf "+-------------------------------------+\n"
}

# Main function
main() {
   while true; do
       check_kubectl
       display_main_menu
       case $choice in
           1) select_resources ;;
           2) describe_resources ;;
           3) get_pod_logs ;;
           4) delete_resources ;;
           5) nodes_commands ;;
           6) context_commands ;;
           7) patch_resources ;;
           8) annotate_resources ;;
           9) labeling_resources ;;
           10) create_resources ;;
           11) debug_pods ;;
           12) fetch_k8s_data ;;
           13) exit_function ;;
           *) echo "Invalid choice. Please enter a number between 1 and 9." ;;
       esac
   done
}

# Execute the main function
main