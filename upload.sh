#!/bin/bash

resource_group_decision() {
    read -p "Do you want to create a new Resource Group? (Y/N): " choice
    case "$choice" in
        y|Y )
            create_rg
            ;;
        n|N )
            storage_account_decision
            ;;
        * )
            echo "Invalid choice. Please enter Y or N"
            exit 1
            ;;
    esac
}

create_rg() {
    read -p "Enter a name for the Resource Group: " rg_name
    read -p "Enter the location for the Resource Group: " rg_loc
    az group create -n $rg_name -l $rg_loc
    if [ $? -eq 0 ]; then
        echo "Resource Group $rg_name successfully created"
        storage_account_decision
    else
        echo "Fail to create Resource Group $rg_name, please try again"
        exit 1
    fi
}

storage_account_decision() {
    read -p "Do you want to create a new Storage Account? (Y/N): " choice
    case "$choice" in
        y|Y )
            create_sa
            ;;
        n|N )
            container_decision
            ;;
        * )
            echo "Invalid choice. Please enter Y or N"
            exit 1
            ;;
    esac
}

create_sa() {
    read -p "Enter the name of the Resource Group that you want your Storage Account to be in: " rg_name
    read -p "Enter the name for the Storage Account: " sa_name
    read -p "Enter the location for your Storage Account: " sa_loc
    az storage account create --name $sa_name --resource-group $rg_name --location $sa_loc --sku Standard_LRS
    if [ $? -eq 0 ]; then
        echo "Storage Account $sa_name successfully created"
        container_decision
    else
        echo "Fail to create Storage Account $sa_name, please try again"
        exit 1
    fi
}

container_decision() {
    read -p "Do you want to create a new Container? (Y/N): " choice
    case "$choice" in
        y|Y )
            create_container
            ;;
        n|N )
            ;;
        * )
            echo "Invalid choice. Please enter Y or N"
            exit 1
            ;;
    esac
}

create_container() {
    read -p "Enter the name of the Storage account that you want your container to be in: " sa_name
    read -p "Enter the name for the container: " con_name
    az storage container create -n $con_name --account-name $sa_name --auth-mode login
    if [ $? -eq 0 ]; then
        echo "Container $con_name successfully created"
    else
        echo "Fail to create Container $con_name, please try again"
        exit 1
    fi
}

# Setting up
resource_group_decision

#Upload of file
read -p "Enter the name of the Storage Account: " sa_name
read -p "Enter the name of the Container: " con_name

for file in "$@"; do
    if [ -f "$file" ]; then
        az storage blob upload --account-name "$sa_name" -c "$con_name" -f "$file"
        if [ $? -eq 0 ]; then
            echo "File $file successfully uploaded to Container $con_name"
        else
            echo "Fail to upload File $file, please try again"
        fi
    else
        echo "File $file does not exist"
    fi
done