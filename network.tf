# Create network interface
resource "azurerm_network_interface" "JenkinsMaster" {
    name                      = "JenkinsMaster"
    location                  = "eastus"
    resource_group_name       = "${azurerm_resource_group.myterraformgroup.name}"
    network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

    ip_configuration {
        name                          = "nicConfiguration"
        subnet_id                     = "${azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.1.4"
        public_ip_address_id          = "${azurerm_public_ip.myterraformpublicip.id}"
    }

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_network_interface" "Jenkins1604ACC" {
    name                      = "Jenkins1604ACC"
    location                  = "eastus"
    resource_group_name       = "${azurerm_resource_group.myterraformgroup.name}"
    network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

    ip_configuration {
        name                          = "nicConfiguration"
        subnet_id                     = "${azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.1.5"
    }

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_network_interface" "Jenkins1804ACC" {
    name                      = "Jenkins1804ACC"
    location                  = "eastus"
    resource_group_name       = "${azurerm_resource_group.myterraformgroup.name}"
    network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

    ip_configuration {
        name                          = "nicConfiguration"
        subnet_id                     = "${azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.1.6"
    }

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_network_interface" "Jenkins1804NonSGX" {
    name                      = "Jenkins1804NonSGX"
    location                  = "eastus"
    resource_group_name       = "${azurerm_resource_group.myterraformgroup.name}"
    network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

    ip_configuration {
        name                          = "nicConfiguration"
        subnet_id                     = "${azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.1.7"
    }

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_network_interface" "JenkinsWin2016ACC" {
    name                      = "JenkinsWin2016ACC"
    location                  = "eastus"
    resource_group_name       = "${azurerm_resource_group.myterraformgroup.name}"
    network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

    ip_configuration {
        name                          = "nicConfiguration"
        subnet_id                     = "${azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.1.8"
    }

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_network_interface" "JenkinsWin2016SGX" {
    name                      = "JenkinsWin2016SGX"
    location                  = "eastus"
    resource_group_name       = "${azurerm_resource_group.myterraformgroup.name}"
    network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

    ip_configuration {
        name                          = "nicConfiguration"
        subnet_id                     = "${azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.1.9"
    }

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_network_interface" "JenkinsWin2016NonSGX" {
    name                      = "JenkinsWin2016NonSGX"
    location                  = "eastus"
    resource_group_name       = "${azurerm_resource_group.myterraformgroup.name}"
    network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

    ip_configuration {
        name                          = "nicConfiguration"
        subnet_id                     = "${azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.1.10"
    }

    tags = {
        environment = "Terraform Demo"
    }
}