nfs = {
    nodes = "1"
    vcpu = "4"
    memory = "8192"
    thin_provisioned = "true"
}
master = {
    nodes = "3"
    vcpu = "8"
    memory = "16384"
    thin_provisioned = "true"
}
proxy = {
    nodes = "2"
    vcpu = "4"
    memory = "8192"
    thin_provisioned = "true"
}
worker = {
    nodes = "4"
    vcpu = "20"
    memory = "32768"
    thin_provisioned = "true"
}
# nodes with 'x' on them.
management = {
    nodes = "3"
    vcpu = "8"
    memory = "16384"
    thin_provisioned = "true"
}
va = {
    nodes = "1"
    vcpu = "8"
    memory = "16384"
    thin_provisioned = "true"
}
