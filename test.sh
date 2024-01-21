#!/bin/bash

list_pod() {

    case $1 in
        1)  #echo "enter the namespace to list the pods"
            kubectl get namespace | awk '{print $1}'
            read -p "Enter the namespace name from the above list: " namespace
            kubectl get pods -n $namespace;;
        2) kubectl get pods -A ;;
        3) echo "Exiting the kubectl helper. See you soon!"; exit 0 ;;
    esac
}

# Function to list Kubernetes resources based on user selection
list_k8s_resource() {
    
        case $1 in
            1) echo "Select a Kubernetes resource to list:"
            options=("Namespace Pods" "All pods" "Exit")
            select option in "${options[@]}"; do
                    case $option in
                        *) list_pod $REPLY ;;
                    esac
                    #break
                done ;;
            2) kubectl get deployments ;;
            3) kubectl get services ;;
            4) kubectl get replicasets ;;
            5) kubectl get statefulsets ;;
            6) kubectl get configmaps ;;
            7) kubectl get secrets ;;
            8) kubectl get persistentvolumes ;;
            9) kubectl get persistentvolumeclaims ;;
            10) echo "Exiting the kubectl helper. See you soon!"; exit 0 ;;
            *) echo "Invalid option" ;;
        esac
}

# Display menu
while true; do
    echo "Select a Kubernetes resource to list:"
    options=("Pods" "Deployments" "Services" "ReplicaSets" "StatefulSets" "ConfigMaps" "Secrets" "PersistentVolumes" "PersistentVolumeClaims" "Exit")

    select option in "${options[@]}"; do
        
            case $option in
                *) list_k8s_resource $REPLY ;;
            esac
            break
    done
done