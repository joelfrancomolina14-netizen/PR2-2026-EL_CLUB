# Acuerdos de Trabajo — Equipo EL CLUB

## 1. Flujo de Trabajo en Git y GitHub
- **Rama principal (`main`):** Protegida. Ningún integrante realiza cambios directos sin revisión cuando se trata de código o scripts de base de datos.
- **Ramas por tarea:** Cada funcionalidad, corrección o documento se desarrolla en una rama independiente siguiendo la convención:
  - `feat/<descripcion>` para nuevas funcionalidades.
  - `fix/<descripcion>` para corrección de errores.
  - `docs/<descripcion>` para documentación.
- **Pull Requests (PR):** Todo PR debe utilizar la plantilla oficial (`.github/pull_request_template.md`), vincular un Issue (`Closes #N`) y contar con al menos **1 aprobación** de otro miembro del equipo antes de hacer *merge*.

## 2. Convenciones de Commits y Código
- Uso obligatorio de **Conventional Commits** (`feat:`, `fix:`, `docs:`, `chore:`, `test:`).
- Cumplimiento de las reglas de formato definidas en `.editorconfig` (codificación UTF-8, indentación consistente).
- Prohibido subir credenciales, contraseñas o archivos temporales generados por Visual Studio (`bin/`, `obj/`, `.vs/`).

## 3. Comunicación y Seguimiento
- Toda tarea pendiente se registra como un **Issue** en GitHub con etiquetas (`bug`, `enhancement`, `documentation`, `database`) y responsable asignado.
- Revisión semanal del avance en el tablero de **Projects** y actualización de `docs/planificacion/seguimiento.md`.
