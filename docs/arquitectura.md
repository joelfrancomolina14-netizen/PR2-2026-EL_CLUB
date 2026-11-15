# Arquitectura del Sistema — EL CLUB

## 1. Estilo Arquitectónico
El sistema **EL CLUB** está diseñado bajo una **arquitectura en tres capas (3-Tier / N-Layer)** para aplicaciones de escritorio en C# (.NET / Windows Forms) conectadas a una base de datos relacional (`elclubom`):

1. **Capa de Presentación (UI - Windows Forms):** Formularios de escritorio para la gestión de Empleados, Socios, Mesas y Cobros.
2. **Capa de Lógica de Negocio (BLL - C#):** Validaciones de datos, reglas de cálculo de cobros y control de permisos por rol (Dueño vs. Empleado común).
3. **Capa de Acceso a Datos (DAL - C#):** Repositorios y consultas SQL parametrizadas que comunican la aplicación con la base de datos.
4. **Base de Datos Relacional (`elclubom`):** Almacenamiento persistente con tablas normalizadas, claves primarias (`PK`), claves foráneas (`FK`) y restricciones (`CHECK`) definidas en `database/script_elclub.sql`.

## 2. Estado de Implementación de Componentes
De acuerdo con el avance actual del proyecto:
- **Base de Datos Relacional (`database/script_elclub.sql`):** **Implementado.** Estructura DDL completa con tablas `empleados`, `duenos`, `empleados_comunes` y `telefonos_empleados`.
- **Capa de Acceso a Datos (DAL):** **Propuesta planificada (en desarrollo).** Se implementará en C# utilizando conexiones parametrizadas y lectura de cadena de conexión desde configuración local (`App.config`).
- **Capa de Lógica de Negocio (BLL):** **Propuesta planificada (en desarrollo).** Encapsulará las reglas de negocio (validación de roles dueño/empleado, cálculo de tarifas por tiempo de mesa y control de duplicados).
- **Capa de Presentación (Windows Forms):** **Propuesta planificada (en desarrollo).** Interfaz de escritorio en C# organizada por módulos funcionales.

## 3. Decisiones Técnicas Clave
- **Separación de responsabilidades:** Evitar consultas SQL directas dentro de los eventos de botones (`Click`) de los formularios de Windows Forms.
- **Seguridad en consultas:** Uso obligatorio de parámetros SQL para prevenir inyección SQL.
- **Configuración desacoplada:** Las credenciales de conexión a la base de datos se mantienen fuera del repositorio mediante archivos de configuración locales ignorados por Git.
