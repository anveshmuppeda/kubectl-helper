# kubectl-helper [![GitHub](https://img.shields.io/github/license/anveshmuppeda/kubectl-helper?color=blue)](https://github.com/anveshmuppeda/kubectl-helper/blob/main/LICENSE)

## Kubernetes Helper Script

This Bash script provides a menu-driven interface for managing a Kubernetes cluster using kubectl. It includes various operations such as retrieving information about resources, describing resources, deleting resources, managing nodes, working with contexts, and more.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Menu Options](#menu-options)
- [Excel Report](#excel-report)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed and configured to connect to your Kubernetes cluster.
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
1. **Get Resources**: Retrieve information about Kubernetes resources.  
2. **Describe Resources**: Describe details about Kubernetes resources.  
3. **Get Logs for a Pod**: Retrieve logs for a specific pod.  
4. **Delete Resources**: Delete Kubernetes resources.  
5. **Nodes**: Perform operations related to Kubernetes nodes.  
6. **Contexts**: Manage Kubernetes contexts.  
7. **Patch**: Patch Kubernetes resources.  
8. **Adding Annotations**: Add or update annotations for resources.  
9. **Adding Labels**: Add or update labels for resources.  
10. **Create Resources**: Apply new Kubernetes resources.  
11. **Debug Pods**: Create a debug pod for troubleshooting.  
12. **Create Excel Report**: Generate an Excel report of Kubernetes resources.  
13. **Exit**: Exit the script.  

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

```csharp
You can customize this template based on your specific script details and add additional sections as needed. Once you have the README ready, you can use it as a basis for your blog post. Feel free to expand on specific sections in your blog post to provide more details about the script and its usage.
```  

## TODO  
1. debug flow chart
2. --help