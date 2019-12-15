# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "myterraformgroup" {
    name     = "JenkinsTerraform"
    location = "${var.location}"

    tags = {
        environment = "Terraform Demo"
    }
}