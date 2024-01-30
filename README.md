# kubectl-helper [![GitHub](https://img.shields.io/github/license/anveshmuppeda/kubectl-helper?color=blue)](https://github.com/anveshmuppeda/kubectl-helper/blob/main/LICENSE)

## Kubernetes Helper Script
**Say goodbye to the complexity of Kubernetes commands!** 🚀 Introducing the Kubernetes Helper Script – your intelligent assistant for effortless cluster management. Whether you're a beginner or seasoned pro, let this script remember on behalf of you, making Kubernetes operations a breeze. Explore detailed resource management, streamlined log retrieval, node operations, and more, all with a user-friendly interface. Experience Kubernetes like never before! ⚙️✨  

Simplify your Kubernetes cluster management with the Kubernetes Helper Script – a powerful yet user-friendly Bash script that puts the control of your Kubernetes environment at your fingertips.  
The Kubernetes Helper Script is a Bash script designed to simplify the management of a Kubernetes cluster through a user-friendly, menu-driven interface. It leverages the `kubectl` command-line tool to interact with a Kubernetes cluster and perform various operations, catering to both beginners and experienced users.  

## Table of Contents
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Menu Options](#menu-options)
- [Excel Report](#excel-report)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites
- [kubectl](https://github.com/anveshmuppeda/kubectl-helper/tree/main/installation/kubectl) installed and configured to connect to your Kubernetes cluster.
- [jq](https://stedolan.github.io/jq/) installed for JSON parsing.
- [xlsxwriter](https://xlsxwriter.readthedocs.io/) Python library for Excel report generation.

## Usage
1. Clone the repository:  
  ```bash
  git clone https://github.com/anveshmuppeda/kubectl-helper.git
  cd kubectl-helper
  ```
2. Ensure the prerequisites are installed.  
3. Run the script:  
  ```bash
  ./kubectl_helper.sh 
  ```  
## Menu Options  
1. **Get Resources**: 
  - Retrieve information about Kubernetes resources.
  - View pods, deployments, services, replica sets, stateful sets, config maps, secrets, and more.
  - Option to filter resources by namespace.
2. **Describe Resources**:
  - Get detailed descriptions of Kubernetes resources.
  - Describe pods, deployments, services, daemonsets, stateful sets, config maps, secrets, and more.
  - Option to select resources interactively.
3. **Get Logs for a Pod**: 
  - Fetch logs for a specific pod.
  - Choose the namespace and pod interactively.
4. **Delete Resources**:
  - Delete various Kubernetes resources.
  - Interactive selection of resource type and specific resources.
5. **Nodes**:
  - Perform operations related to Kubernetes nodes.
  - Get node information, view status, configuration, and events.
  - Drain or cordon nodes for maintenance.
6. **Contexts**:
  - Manage Kubernetes contexts.
  - Display the current context, list available contexts, switch to a specific context, and delete a context.
7. **Patch**:
  - Apply patches to Kubernetes resources.
  - Choose resource type and provide a patch file.
8. **Adding Annotations**:
  - Add or update annotations for Kubernetes resources.
  - Interactive selection of resource type and specific resource.
9. **Adding Labels**:
  - Add or update labels for Kubernetes resources.
  - Interactive selection of resource type and specific resource.
10. **Create Resources**:
  - Apply new Kubernetes resources from YAML manifests.
  - Input the path to the YAML file.
11. **Debug Pods**:
  - Create a debug pod for troubleshooting.
  - Interactive selection of the pod to debug.
12. **Create Excel Report**:
  - Generate an Excel report containing information about pods, namespaces, and their statuses.
  - Utilizes the xlsxwriter Python library.
13. **Exit**: Gracefully exit the script.

### Main menu display:    
```
+-------------------------------------+
|      Welcome to kubectl Helper      |
+-------------------------------------+
| 1. Get Resources                    |
| 2. Describe Resources               |
| 3. Get logs for a pod               |
| 4. Delete Resources                 |
| 5. Nodes                            |
| 6. Contexts                         |
| 7. Patch                            |
| 8. Adding Annotations               |
| 9. Adding lables                    |
| 10. Create Resources                |
| 11. Debug Pods                      |
| 12. Create excel report             |
| 13. Exit                            |
+-------------------------------------+
Enter your choice (1-13):
```  

## Excel Report
The script can generate an Excel report containing information about pods, namespaces, and their statuses. The report is created using the xlsxwriter Python library.  

To generate the report, select option 12 from the menu.  


## Project Maintainers & Contributors  
<table>
  <tr>
    <td align="center"><a href="https://anveshmuppeda.github.io/profile/"><img src="https://avatars.githubusercontent.com/u/115966808?v=4" width="100px;" alt=""/><br /><sub><b>Anvesh Muppeda</b></sub></a></td>
    <td align="center"><a href="https://github.com/saimanasak"><img src="https://avatars.githubusercontent.com/u/47205414?v=4" width="100px;" alt=""/><br /><sub><b>Sai Manasa Kota</b></sub></a></td>
  </tr>
</table>  

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/anveshmuppeda/kubectl-helper/blob/main/LICENSE) file for details.
