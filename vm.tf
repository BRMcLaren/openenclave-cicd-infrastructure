# Create virtual machine
resource "azurerm_virtual_machine" "JenkinsMaster" {
    name                  = "JenkinsMaster"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.JenkinsMaster.id}"]
    vm_size               = "${var.vmsize_nonacc}"

    storage_os_disk {
        name              = "JenkinsMaster"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "JenkinsMaster"
        admin_username = "${var.azureuser}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "${var.credentials_ssh_public_key}"
        }
    }

    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags = {
        environment = "Jenkins Terraform Demo"
    }
}

resource "azurerm_virtual_machine" "Jenkins1604ACC-1" {
    name                  = "Jenkins1604ACC-1"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.Jenkins1604ACC.id}"]
    vm_size               = "${var.vmsize_acc}"

    storage_os_disk {
        name              = "Jenkins1604ACC-1"
        vhd_uri           = "${var.ubuntu1604accVHD}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "confidential-compute-preview"
        sku       = "16.04-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "1604ACCUbuntu"
        admin_username = "${var.azureuser}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "${var.credentials_ssh_public_key}"
        }
    }

    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags = {
        environment = "Jenkins Terraform Demo"
    }
}

resource "azurerm_virtual_machine" "Jenkins1804ACC-1" {
    name                  = "Jenkins1804ACC-1"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.Jenkins1804ACC.id}"]
    vm_size               = "${var.vmsize_acc}"

    storage_os_disk {
        name              = "Jenkins1804ACC-1"
        vhd_uri           = "${var.ubuntu1804accVHD}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "1804ACCUbuntu"
        admin_username = "${var.azureuser}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "${var.credentials_ssh_public_key}"
        }
    }

    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags = {
        environment = "Jenkins Terraform Demo"
    }
}


resource "azurerm_virtual_machine" "Jenkins1804NonSGX-1" {
    name                  = "Jenkins1804NonSGX-1"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.Jenkins1804NonSGX.id}"]
    vm_size               = "${var.vmsize_nonacc}"

    storage_os_disk {
        name              = "Jenkins1804NonSGX-1"
        vhd_uri           = "${var.ubuntu1804NonSGXVHD}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "1804UbuntuNonSGX"
        admin_username = "${var.azureuser}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "${var.credentials_ssh_public_key}"
        }
    }

    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags = {
        environment = "Jenkins Terraform Demo"
    }
}


resource "azurerm_virtual_machine" "JenkinsWin2016ACC-1" {
    name                  = "JenkinsWin2016ACC-1"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.JenkinsWin2016ACC.id}"]
    vm_size               = "${var.vmsize_acc}"

    storage_os_disk {
        name              = "Win2016ACC-1"
        vhd_uri           = "${var.win2016accVHD}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
    }

    storage_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "confidential-compute-preview"
        sku       = "acc-windows-server-2016-datacenter"
        version   = "latest"
    }

    os_profile {
        computer_name  = "Win2016ACC"
        admin_username = "${var.azureuser}"
        admin_password = "InsertPasswordHere1!"
        #enableWinRM    = false
    }

    os_profile_windows_config {
        enable_automatic_upgrades = false
        provision_vm_agent = true
    }
    
    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags = {
        environment = "Jenkins Terraform Demo"
    }
}

resource "azurerm_virtual_machine" "Win2016SGX-1" {
    name                  = "JenkinsWin2016SGX-1"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.JenkinsWin2016SGX.id}"]
    vm_size               = "${var.vmsize_acc}"

    storage_os_disk {
        name              = "JenkinsWin2016SGX-1"
        vhd_uri           = "${var.win2016SGXVHD}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
    }

    storage_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "confidential-compute-preview"
        sku       = "acc-windows-server-2016-datacenter"
        version   = "latest"
    }

    os_profile {
        computer_name  = "Win2016SGX"
        admin_username = "${var.azureuser}"
        admin_password = "InsertPasswordHere1!"
        #enableWinRM    = false
    }

    os_profile_windows_config {
        enable_automatic_upgrades = false
        provision_vm_agent = true
    }
    
    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags = {
        environment = "Jenkins Terraform Demo"
    }
}

resource "azurerm_virtual_machine" "JenkinsWin2016NonSGX-1" {
    name                  = "JenkinsWin2016NonSGX-1"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.JenkinsWin2016NonSGX.id}"]
    vm_size               = "${var.vmsize_nonacc}"

    storage_os_disk {
        name              = "JenkinsWin2016NonSGX-1"
        vhd_uri           = "${var.win2016NonSGXVHD}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
    }

    storage_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "confidential-compute-preview"
        sku       = "acc-windows-server-2016-datacenter"
        version   = "latest"
    }

    os_profile {
        computer_name  = "Win2016NonSGX"
        admin_username = "${var.azureuser}"
        admin_password = "InsertPasswordHere1!"
        #enableWinRM    = false
    }

    os_profile_windows_config {
        enable_automatic_upgrades = false
        provision_vm_agent = true
    }
    
    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags = {
        environment = "Jenkins Terraform Demo"
    }
}