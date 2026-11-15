# Seguimiento del Proyecto — EL CLUB

## 1. Estado Actual por Hitos
| Hito | Estado | Evidencia en el Repositorio |
| :--- | :--- | :--- |
| **1. Análisis y Requisitos** | Completado | `docs/vision-y-alcance.md`, `docs/requisitos.md`, `docs/requisitos/historias_de_usuario.md` |
| **2. Diseño y Base de Datos** | Completado | `docs/modelo-de-datos.md`, `database/script_elclub.sql` |
| **3. Estandarización del Repositorio** | Completado | `.github/`, `CONTRIBUTING.md`, `SECURITY.md`, `.gitignore`, `.editorconfig` |
| **4. Desarrollo de Capas y UI (C#)** | En progreso / Planificado | `src/` (estructura base en desarrollo para Windows Forms) |
| **5. Pruebas y Entrega Final** | Pendiente | `tests/`, `docs/riesgos_y_pruebas.md` |

## 2. Registro de Decisiones y Bloqueos
- **Decisión 1:** Se adoptó arquitectura en tres capas (UI Windows Forms, BLL, DAL) separada del motor de base de datos `elclubom`.
- **Decisión 2:** Se centralizó el script DDL en `database/script_elclub.sql` para evitar duplicidad de versiones en `docs/`.
- **Próximo foco:** Implementar la capa de acceso a datos (`DAL`) y los primeros formularios de gestión de personal y socios en Windows Forms.
