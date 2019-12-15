# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "publicIp"
    location                     = "eastus"
    resource_group_name          = "${azurerm_resource_group.myterraformgroup.name}"
    allocation_method            = "Dynamic"
    domain_name_label            = "oe-jenkins-automation"

    tags = {
        environment = "Terraform Demo"
    }
}