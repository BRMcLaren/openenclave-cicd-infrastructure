# VM User
variable "azureuser"{
    default = "azureuser"
}

#VM Naming
variable "JenkinsMaster"{
    default = "JenkinsMaster"
}

#VM Sizes
variable "vmsize_acc"{
    default = "Standard_DC2s"
}

variable "vmsize_nonacc" {
    default = "Standard_DS1_v2"
}

#VHD links.
variable "ubuntu1604accVHD" {
    default = "https://oejenkins.blob.core.windows.net/disks/2019-November-21-jenkins-agent-ubuntu-16.04.vhd"
}

variable "ubuntu1804accVHD" {
    default = "https://oejenkins.blob.core.windows.net/disks/2019-November-21-jenkins-agent-ubuntu-18.04.vhd"
}

## This is wrong, I think only git and docker need to be installed but unknown
variable "ubuntu1804NonSGXVHD" {
    default = "https://oejenkins.blob.core.windows.net/disks/2019-November-21-jenkins-agent-ubuntu-18.04.vhd"
}

variable "win2016accVHD" {
    default = "https://oejenkins.blob.core.windows.net/disks/2019-November-21-jenkins-agent-win-dcap.vhd"
}

variable "win2016SGXVHD" {
    default = "https://oejenkins.blob.core.windows.net/disks/2019-November-21-jenkins-agent-win-2016.vhd"
}

variable "win2016NonSGXVHD" {
    default = "https://oejenkins.blob.core.windows.net/disks/2019-November-21-jenkins-agent-win-2016.vhd"
}