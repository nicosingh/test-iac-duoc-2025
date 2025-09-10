# Archivo principal de infraestructura como codigo
# Implementa la infraestructura completa de Azure usando el modulo personalizado

# Modulo principal de infraestructura Azure
# Crea todos los recursos necesarios para el ambiente especificado
# Utiliza terraform.workspace para determinar automaticamente el ambiente
module "infraestructura_azure" {
  source = "git::https://github.com/nicosingh/terraform-azurerm-duoc-iac-sep-25.git?ref=03c55adb6449b915a92db38491a1878b5e58ff65"

  # Configuracion basica del proyecto
  nombre_proyecto = "clase-8"
  ubicacion       = "eastus2"

  # Ambiente dinamico basado en el workspace activo de Terraform
  # Permite deployment multi-ambiente (desarrollo/produccion)
  ambiente = terraform.workspace

  # Grupo de recursos existente donde se crearan todos los recursos
  nombre_grupo_recursos = "AreaInfraestructura"

  # Habilitacion de recursos opcionales
  # Crea cuenta de almacenamiento con contenedor para archivos
  crear_cuenta_almacenamiento = true

  # Crea maquina virtual Ubuntu 22.04 LTS en la red virtual
  crear_maquina_virtual = true

  # Configuracion de red virtual con bloque CIDR
  # Permite hasta 65,534 direcciones IP (10.0.0.1 - 10.0.255.254)
  bloque_red = "10.0.0.0/16"
}
