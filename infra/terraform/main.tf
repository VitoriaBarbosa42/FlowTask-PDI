# ==============================================================================
# REDE PRIVADA DOCKER (BRIDGE)
# ==============================================================================
# Cria a rede dedicada onde todos os containers de banco de dados, mensageria,
# cache e simulação AWS se comunicarão via DNS interno do Docker.
# ==============================================================================

resource "docker_network" "flowtask_net" {
  name   = "flowtask-network"
  driver = "bridge"

  # Garante que a rede seja recriada de forma limpa se necessário
  check_duplicate = true
}