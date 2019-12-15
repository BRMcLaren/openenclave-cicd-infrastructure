# Create virtual machine
resource "azurerm_virtual_machine" "JenkinsMaster" {
    name                  = "JenkinsMaster"
    location              = "eastus"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.JenkinsMaster.id}"]
    vm_size               = "Standard_DS1_v2"

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
        admin_username = "azureuser"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHgGBI68diMhO1v0Uz961KAiP4KR1W7EUTqtLOxR0qhsOzfnKZDuxbgsRXvZOYhqReBtig8zZrW6nUbBeo9wTKkw4B1/uFyFf4EShLlXMZSMYAtEa0JsLPjGBrcHY39BTVIlG/PtSG0yiTTgqcdnACZ40MvUrr65Vx7M0a3PVZLQJMh7vVhdem9XoUAFnOFGkHoO3OJo6PQ1m7z+x7+saGLEzT5h+Z6oScYCgjTAkzcuWU2SIuKWL5LvRa6NUIpuQ1eBUz94GrWZgCG29i6vt6cARUXUzPaW0TpJdvYgrmu4Ymb+NZQ1U8klYGvrJPhdBEqSHD2aJ5Bk9VbLV7om488J6P3hUW1OceUfO/6OZ+ls1486JaRJ0g2QVcc5zBo+QM6FK1ZovlCHYYiYLu2gTXuyol4JqZsRtyzvI1kZAXGvwAb1CThtFHT8FhMuHX/s7hQuUFcU+xc0G3YrodttfjcRsDwS5zpXaB0zovchedgCsORsyAnR9STBR0V2+/y14GXgKG82+KzCpdE1o8r3fsPXK2VHzeafu+YmwQiUJ/yQnUJXoL2Vg3TbuICnqX6axB3iceZketXBfuCYgmPPzB3SWVvTytl7qN6lEb6ZeBEM4wugQqRskko5xkhFDf2Qcbfr62QQEhrE6dmBzaEq4rJKivOJVVc2UthfjNUFIPOw== brmclare@microsoft.com"
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
    location              = "eastus"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.Jenkins1604ACC.id}"]
    vm_size               = "Standard_DC2s"

    storage_os_disk {
        name              = "Jenkins1604ACC-1"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "confidential-compute-preview"
        sku       = "16.04-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "1604ACCUbuntu"
        admin_username = "azureuser"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHgGBI68diMhO1v0Uz961KAiP4KR1W7EUTqtLOxR0qhsOzfnKZDuxbgsRXvZOYhqReBtig8zZrW6nUbBeo9wTKkw4B1/uFyFf4EShLlXMZSMYAtEa0JsLPjGBrcHY39BTVIlG/PtSG0yiTTgqcdnACZ40MvUrr65Vx7M0a3PVZLQJMh7vVhdem9XoUAFnOFGkHoO3OJo6PQ1m7z+x7+saGLEzT5h+Z6oScYCgjTAkzcuWU2SIuKWL5LvRa6NUIpuQ1eBUz94GrWZgCG29i6vt6cARUXUzPaW0TpJdvYgrmu4Ymb+NZQ1U8klYGvrJPhdBEqSHD2aJ5Bk9VbLV7om488J6P3hUW1OceUfO/6OZ+ls1486JaRJ0g2QVcc5zBo+QM6FK1ZovlCHYYiYLu2gTXuyol4JqZsRtyzvI1kZAXGvwAb1CThtFHT8FhMuHX/s7hQuUFcU+xc0G3YrodttfjcRsDwS5zpXaB0zovchedgCsORsyAnR9STBR0V2+/y14GXgKG82+KzCpdE1o8r3fsPXK2VHzeafu+YmwQiUJ/yQnUJXoL2Vg3TbuICnqX6axB3iceZketXBfuCYgmPPzB3SWVvTytl7qN6lEb6ZeBEM4wugQqRskko5xkhFDf2Qcbfr62QQEhrE6dmBzaEq4rJKivOJVVc2UthfjNUFIPOw== brmclare@microsoft.com"
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
    location              = "eastus"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.Jenkins1804ACC.id}"]
    vm_size               = "Standard_DC2s"

    storage_os_disk {
        name              = "Jenkins1804ACC-1"
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
        computer_name  = "1804ACCUbuntu"
        admin_username = "azureuser"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHgGBI68diMhO1v0Uz961KAiP4KR1W7EUTqtLOxR0qhsOzfnKZDuxbgsRXvZOYhqReBtig8zZrW6nUbBeo9wTKkw4B1/uFyFf4EShLlXMZSMYAtEa0JsLPjGBrcHY39BTVIlG/PtSG0yiTTgqcdnACZ40MvUrr65Vx7M0a3PVZLQJMh7vVhdem9XoUAFnOFGkHoO3OJo6PQ1m7z+x7+saGLEzT5h+Z6oScYCgjTAkzcuWU2SIuKWL5LvRa6NUIpuQ1eBUz94GrWZgCG29i6vt6cARUXUzPaW0TpJdvYgrmu4Ymb+NZQ1U8klYGvrJPhdBEqSHD2aJ5Bk9VbLV7om488J6P3hUW1OceUfO/6OZ+ls1486JaRJ0g2QVcc5zBo+QM6FK1ZovlCHYYiYLu2gTXuyol4JqZsRtyzvI1kZAXGvwAb1CThtFHT8FhMuHX/s7hQuUFcU+xc0G3YrodttfjcRsDwS5zpXaB0zovchedgCsORsyAnR9STBR0V2+/y14GXgKG82+KzCpdE1o8r3fsPXK2VHzeafu+YmwQiUJ/yQnUJXoL2Vg3TbuICnqX6axB3iceZketXBfuCYgmPPzB3SWVvTytl7qN6lEb6ZeBEM4wugQqRskko5xkhFDf2Qcbfr62QQEhrE6dmBzaEq4rJKivOJVVc2UthfjNUFIPOw== brmclare@microsoft.com"
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
    location              = "eastus"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.Jenkins1804NonSGX.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "Jenkins1804NonSGX-1"
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
        computer_name  = "1804UbuntuNonSGX"
        admin_username = "azureuser"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHgGBI68diMhO1v0Uz961KAiP4KR1W7EUTqtLOxR0qhsOzfnKZDuxbgsRXvZOYhqReBtig8zZrW6nUbBeo9wTKkw4B1/uFyFf4EShLlXMZSMYAtEa0JsLPjGBrcHY39BTVIlG/PtSG0yiTTgqcdnACZ40MvUrr65Vx7M0a3PVZLQJMh7vVhdem9XoUAFnOFGkHoO3OJo6PQ1m7z+x7+saGLEzT5h+Z6oScYCgjTAkzcuWU2SIuKWL5LvRa6NUIpuQ1eBUz94GrWZgCG29i6vt6cARUXUzPaW0TpJdvYgrmu4Ymb+NZQ1U8klYGvrJPhdBEqSHD2aJ5Bk9VbLV7om488J6P3hUW1OceUfO/6OZ+ls1486JaRJ0g2QVcc5zBo+QM6FK1ZovlCHYYiYLu2gTXuyol4JqZsRtyzvI1kZAXGvwAb1CThtFHT8FhMuHX/s7hQuUFcU+xc0G3YrodttfjcRsDwS5zpXaB0zovchedgCsORsyAnR9STBR0V2+/y14GXgKG82+KzCpdE1o8r3fsPXK2VHzeafu+YmwQiUJ/yQnUJXoL2Vg3TbuICnqX6axB3iceZketXBfuCYgmPPzB3SWVvTytl7qN6lEb6ZeBEM4wugQqRskko5xkhFDf2Qcbfr62QQEhrE6dmBzaEq4rJKivOJVVc2UthfjNUFIPOw== brmclare@microsoft.com"
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


#resource "azurerm_virtual_machine" "JenkinsWin16ACC-1" {
#    name                  = "JenkinsWin16ACC-1"
#    location              = "eastus"
#    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
#    network_interface_ids = ["${azurerm_network_interface.myterraformnic.id}"]
#    vm_size               = "Standard_DC2s"
#
#    storage_os_disk {
#        name              = "JenkinsWin16ACC-1"
#        caching           = "ReadWrite"
#        create_option     = "FromImage"
#        managed_disk_type = "Premium_LRS"
#    }
#
#    storage_image_reference {
#        publisher = "MicrosoftWindowsServer"
#        offer     = "confidential-compute-preview"
#        sku       = "acc-windows-server-2016-datacenter"
#        version   = "latest"
#    }
#
#    os_profile {
#        computer_name  = "JenkinsWin16ACC"
#        admin_username = "azureuser"
#        #enableWinRM    = false
#    }
#
#    os_profile_windows_config {
#        enable_automatic_upgrades = false
#        provision_vm_agent = true
#        #winrm = {
#        #    protocol = "https"
#        #    certificate_url = "https://econ-test-infrastructure.vault.azure.net/secrets/azure-nightly-test/ed0b413c72884e8684a7f5920e77565f"
#        #}
#    }
#    
#    boot_diagnostics {
#        enabled = "true"
#        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
#    }
#
#    tags = {
#        environment = "Jenkins Terraform Demo"
#    }
#}