# ⚽ EL CLUB - Sistema de Gestión

**Materia:** Programación II (UNIFRANZ)  
**Semestre:** 2° Semestre 2026  

---

## 📌 1. Problema y Valor Aportado
* **Problema:** La administración del club realiza el registro de socios, empleados, cobranzas de cuotas y reserva de instalaciones de forma manual o desorganizada, lo que genera pérdida de datos y retrasos en la atención.
* **Solución:** Un sistema de escritorio desarrollado en C# (Windows Forms) conectado a una base de datos relacional (`elclubom`) que centraliza el control operativo del club.
* **Beneficiarios:** Administradores / Dueños del club (gestión eficiente y trazabilidad) y Socios (atención más rápida y clara).

---

## 📊 2. Estado Actual del Proyecto
* **Base de Datos Relacional (`elclubom`):** **Implementada** (`database/script_elclub.sql`).
* **Documentación Técnica y Planificación:** **Completada** (`docs/`).
* **Aplicación de Escritorio (C# / Windows Forms):** **En desarrollo / Propuesta planificada** (`src/`).

---

## 🎯 3. Objetivos
* **Objetivo General:** Desarrollar una aplicación de escritorio modular en C# para la automatización del registro de personal, socios, cobro de cuotas y reserva de mesas/instalaciones en el club.
* **Objetivos Específicos:**
  1. Diseñar e implementar el modelo de datos relacional para gestionar la información operativa del club.
  2. Implementar la interfaz gráfica de usuario en Windows Forms bajo una arquitectura en tres capas (UI, BLL, DAL).
  3. Validar las reglas de negocio mediante pruebas unitarias y de integración.

---

## 🚀 4. Alcance y MVP (Producto Mínimo Viable)

### 🟢 Lo que SÍ incluye el MVP:
- Módulo de Gestión de Personal y Roles (Dueños y Empleados comunes).
- Módulo de Gestión de Socios (Altas, Bajas, Modificaciones y Consultas).
- Módulo de Registro de Pagos / Cuotas mensuales.
- Módulo de Reserva de Mesas e Instalaciones.
- Reportes básicos en pantalla.

### 🔴 Lo que NO incluye (Fuera de Alcance):
- Pagos en línea mediante pasarelas con tarjeta de crédito/débito.
- Notificaciones automáticas por correo electrónico o WhatsApp.
- Aplicación móvil.

---

## 🗂️ 5. Estructura del Repositorio
* `.github/` — Plantillas de Issues, PRs, CODEOWNERS y flujo CI
* `database/` — Scripts DDL de creación y estructura de BD (`script_elclub.sql`)
* `docs/` — Documentación técnica, diagramas y planificación
  * `analisis/` — Artefactos de análisis del dominio
  * `arquitectura.md` — Arquitectura en 3 capas (UI, BLL, DAL) y estado de componentes
  * `base-datos/` — Modelo lógico fuente (`.txt`) y diagrama visual (`.png`)
  * `equipo/` — Integrantes, roles y acuerdos de trabajo
  * `modelo-de-datos.md` — Diccionario de entidades y guía de BD
  * `planificacion/` — Cronograma Gantt, hitos y seguimiento de avance
  * `presentacion/` — Material de exposición del proyecto
  * `proyecto/` — Documentos generales del proyecto
  * `requisitos.md` — Requisitos Funcionales (RF) y No Funcionales (RNF)
  * `requisitos/` — Historias de usuario detalladas
  * `riesgos_y_pruebas.md` — Matriz de riesgos y plan de pruebas
  * `vision-y-alcance.md` — Propósito, problema, usuarios y alcance MVP
* `src/` — Código fuente de la aplicación C# Windows Forms (en desarrollo)
* `tests/` — Pruebas unitarias y de validación funcional
* `.editorconfig`, `.gitignore`, `CHANGELOG.md`, `CONTRIBUTING.md`, `LICENSE`, `SECURITY.md`

---

## 📂 6. Documentación del Proyecto
* [📄 Visión y Alcance](docs/vision-y-alcance.md)
* [📋 Requisitos Funcionales y No Funcionales](docs/requisitos.md)
* [📄 Historias de Usuario y Criterios de Aceptación](docs/requisitos/historias_de_usuario.md)
* [🏗️ Arquitectura del Sistema](docs/arquitectura.md)
* [📊 Modelo de Datos y Diccionario](docs/modelo-de-datos.md) | [Diagrama Lógico](docs/base-datos/10-09-MODELOLOGICOOFICIAL.txt.drawio.png)
* [📅 Planificación](docs/planificacion/planificacion.md) | [Diagrama de Gantt](docs/planificacion/gantt.md) | [Seguimiento](docs/planificacion/seguimiento.md)
* [⚠️ Análisis de Riesgos y Pruebas](docs/riesgos_y_pruebas.md)
* [👥 Integrantes y Roles](docs/equipo/integrantes-y-roles.md) | [Acuerdos de Trabajo](docs/equipo/acuerdos-de-trabajo.md)

---

## ⚙️ 7. Instalación y Ejecución

### Requisitos Previos
* **Motor de Base de Datos Relacional:** MySQL / MariaDB o SQL Server (según entorno local).
* **Entorno de Desarrollo (para fase UI):** Visual Studio 2022 con carga de trabajo *Desarrollo de escritorio de .NET* (C# / Windows Forms).
* **Control de Versiones:** Git.

### Configuración de la Base de Datos
1. Clonar el repositorio: `git clone [https://github.com/joelfrancomolina14-netizen/PR2-2026-EL_CLUB.git](https://github.com/joelfrancomolina14-netizen/PR2-2026-EL_CLUB.git)`
2. Abrir el gestor de base de datos y ejecutar el script ubicado en [`database/script_elclub.sql`](database/script_elclub.sql) para generar la base de datos `elclubom` y sus tablas.

### Variables de Entorno y Credenciales
Por seguridad (ver [`SECURITY.md`](SECURITY.md)), **no se almacenan contraseñas ni cadenas de conexión reales en el repositorio**. Configure su archivo local `App.config` o variables de entorno (`DB_HOST`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`) ignoradas por `.gitignore`.

---

## 👥 8. Equipo y Responsabilidades
* **Joel Franco Molina (`@joelfrancomolina14-netizen`):** Programación y Desarrollo Core (C#), Arquitectura y Coordinación.
* **Leo (`@LEONARDOERICK`):** Análisis de Sistemas, Pruebas y Maquetación UI.
* **Jhonn (`@JHONNGUTIERREZ`):** Administración y Diseño de Base de Datos.
