# Test IAC DUOC 2025

Este es un proyecto de implementación de infraestructura como código (IAC) usando Terraform en Azure. El proyecto utiliza el módulo `terraform-azurerm-duoc-iac-sep-25` que implementa una arquitectura completa basada en Azure Verified Modules (AVM).

## Características del Proyecto

- **Implementación modular**: Utiliza un módulo externo para crear infraestructura completa en Azure
- **Multi-ambiente**: Soporta deployment en diferentes ambientes usando Terraform workspaces
- **Backend remoto**: Configurado para usar Azure Storage como backend de estado
- **Infraestructura configurable**: Permite activar/desactivar componentes mediante variables
- **Basado en mejores prácticas**: Implementa Azure Verified Modules para garantizar estándares de la industria

## Prerequisitos

- Terraform
- Azure CLI instalado y configurado
- Credenciales de Azure configuradas
- Acceso al grupo de recursos correspondiente
- Acceso a la cuenta de almacenamiento para el backend

## Configuración del Backend

El proyecto utiliza Azure Storage como backend remoto. Hay dos opciones para inicializar:

### Opción 1: Usando flags de línea de comandos

```bash
terraform init \
    -backend-config="resource_group_name=<RESOURCE_GROUP_NAME>" \
    -backend-config="storage_account_name=<STORAGE_ACCOUNT_NAME>" \
    -backend-config="container_name=<CONTAINER_NAME>" \
    -backend-config="key=<STATE_FILE_KEY>"
```

### Opción 2: Usando archivo de configuración

```bash
terraform init -backend-config=backend.tfvars
```

## Uso

### Inicializar Terraform

```bash
# Inicializar con backend remoto
terraform init -backend-config=backend.tfvars
```

### Gestión de Workspaces

Para trabajar con diferentes ambientes:

```bash
# Crear workspace de desarrollo
terraform workspace new dev

# Crear workspace de producción
terraform workspace new prod

# Listar workspaces
terraform workspace list

# Cambiar workspace
terraform workspace select dev
```

### Planificar deployment

```bash
terraform plan
```

### Aplicar cambios

```bash
terraform apply
```

### Destruir infraestructura

```bash
terraform destroy
```

## Integración Continua (CI/CD)

El proyecto incluye workflows de GitHub Actions para automatizar el deployment:

**Pipeline de Aplicación** (`terraform-apply.yml`):
- Automatiza el proceso de aplicación de la infraestructura
- Se puede ejecutar manualmente o mediante triggers específicos

**Pipeline de Destrucción** (`terraform-destroy.yml`):
- Automatiza el proceso de destrucción de la infraestructura
- Útil para limpiar recursos en ambientes de prueba

## Seguridad y Mejores Prácticas

- **Estado remoto**: El estado de Terraform se almacena de forma segura en Azure Storage
- **Versionado de providers**: Versiones fijadas para garantizar reproducibilidad
- **Módulos verificados**: Utiliza Azure Verified Modules (AVM)
- **Gestión de secretos**: Los secretos se manejan a través de Azure Key Vault (si está configurado en el módulo)

## Contribuciones

¡Las contribuciones son bienvenidas! Si encuentras errores o tienes sugerencias de mejora:

1. Fork del repositorio
2. Crea una rama con nombre descriptivo (`feature/nueva-funcionalidad` o `fix/correccion-problema`)
3. Implementa tus cambios siguiendo las mejores prácticas de Terraform
4. Envía un pull request con descripción clara de los cambios

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.13.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.41.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_infraestructura_azure"></a> [infraestructura\_azure](#module\_infraestructura\_azure) | git::https://github.com/nicosingh/terraform-azurerm-duoc-iac-sep-25.git | 03c55adb6449b915a92db38491a1878b5e58ff65 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Licencia

Este proyecto está bajo la licencia especificada en el archivo `LICENSE`.
