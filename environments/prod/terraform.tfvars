
resource_groups = {
  rg1 = {
    name     = "rg-keyvault1"
    location = "India South Central"
  }
}

virtual_networks = {
  vnet1 = {
    name                = "vnet-keyvault"
    address_space       = ["10.0.0.0/16"]
    location            = "India South Central"
    resource_group_name = "rg-keyvault1"
  }
}

subnets = {
  subnet1 = {
    name                 = "subnet-keyvault"
    resource_group_name  = "rg-keyvault1"
    virtual_network_name = "vnet-keyvault"
    address_prefixes     = ["10.0.0.0/24"]
  }

  subnet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-keyvault1"
    virtual_network_name = "vnet-keyvault"
    address_prefixes     = ["10.0.1.0/26"]
  }
}

virtual_machines = {
  vm1 = {
    vm_name              = "vm1"
    resource_group_name  = "rg-keyvault1"
    location             = "India South Central"
    nic_name             = "nic-vm1"
    vm_size              = "Standard_B2s"
    admin_username       = "adminuser"
    admin_password       = "ApnaStrongPass@2026"
    subnet_name          = "subnet-keyvault"
    virtual_network_name = "vnet-keyvault"
  }
}

bastions = {
  bastion1 = {
    name                 = "bas-keyvault"
    public_ip_name       = "pip-bastion"
    location             = "India South Central"
    resource_group_name  = "rg-keyvault1"
    virtual_network_name = "vnet-keyvault"
  }
}