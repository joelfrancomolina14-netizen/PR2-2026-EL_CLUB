# Política de Seguridad - EL CLUB

## Manejo de Credenciales y Datos Sensibles
- **Prohibido** subir contraseñas reales, cadenas de conexión con credenciales personales, tokens o claves API al repositorio.
- Los archivos de configuración (`App.config` o `appsettings.json`) deben incluir únicamente cadenas de conexión locales de ejemplo (ej. `Server=localhost;Database=ElClubDB;Trusted_Connection=True;`).
- Cualquier archivo con credenciales locales debe estar excluido en `.gitignore`.

## Reporte de Vulnerabilidades
Si detectas algún problema de seguridad (como inyección SQL, exposición de datos de socios o credenciales en el historial):
1. No lo publiques como un Issue público si expone datos reales.
2. Notifica directamente al equipo de desarrollo mediante los canales internos del grupo.
