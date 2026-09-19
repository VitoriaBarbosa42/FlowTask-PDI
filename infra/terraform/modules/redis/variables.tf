variable "host_port" {
    description = "Porta externa no computador host"
    type = number
    default = 6379
}

variable "network_id" {
    description = "Nome da rede bridge (flowtask-network)."
    type = string
}

