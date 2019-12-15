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

#VHD links
variable "ubuntu1604accVHD" {
    default = ""
}

variable "ubuntu1804accVHD" {
    default = ""
}

variable "ubuntu1804NonSGXVHD" {
    default = ""
}

variable "win2016accVHD" {
    default = ""
}

variable "win2016SGXVHD" {
    default = ""
}

variable "win2016NonSGXVHD" {
    default = ""
}