# CloudUploader-CLI

This is a bash-based CLI tool that allows you to quickly upload files to Azure Blob Storage, giving you a simple and seamless upload experience. It aims to offer a user-friendly experience similar to popular storage services and guides users through the process of creating resource groups, storage accounts, containers, and uploading files to Azure cloud.

## Pre-requisites

1. Bash environment
2. Ensure Azure CLI must be installed
3. Ensure your Azure account is logged in (az login)

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/czhaoyiii/CloudUploader-CLI
   ```
2. **Navigate to the Project Directory**:
   ```bash
   cd CloudUploader-CLI
   ```

## Usage 

To upload a file to Azure Blob Storage, use the following command:

```bash
./upload.sh /path/to/file
```
To upload multiple files to Azure Blob Storage, use the following command:

```bash
./upload.sh /path/to/file1 /path/to/file2 ...
```
Follow the prompts to log in to Azure CLI and select or create resource groups, storage accounts, and containers.

## Features

- **Resource Group Management:** Users can create a new resource group or select from pre-existing ones.
- **Storage Account Management:** Users can create a new storage account or select from pre-existing ones.
- **Container Management:** Users can create a new container or select from pre-existing ones.
- **File Upload:** Users can upload files to the selected container in Azure cloud.
- **Multiple File Uploads:** Allows users to upload multiple files in a single session.
  
## Notes

- This script simplifies the process of uploading files to Azure cloud storage, making it suitable for users who prefer command-line interfaces.
- Users need to have appropriate permissions and access to Azure resources for successful execution.
