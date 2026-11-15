# Visión y Alcance — EL CLUB

## 1. Propósito y Descripción del Sistema
**EL CLUB** es un sistema de gestión de escritorio diseñado para administrar las operaciones diarias de un club oficial de billar. Centraliza el control de empleados, dueños, socios, reservas de mesas/canchas y cobro de cuotas o consumos en una base de datos relacional estructurada.

## 2. Problema que Resuelve
Actualmente, la administración operativa y el control del personal, socios y cobros del club se realizan de forma manual o dispersa, lo que genera:
- Dificultad para controlar turnos, roles (dueños vs. empleados comunes) y datos de contacto del personal.
- Riesgo de errores o pérdidas en el registro de pagos, cuotas y disponibilidad de mesas.
- Falta de trazabilidad histórica para la toma de decisiones administrativas.

## 3. Usuarios Objetivo
- **Dueños / Administradores:** Supervisión general, gestión de personal, configuración de tarifas y consulta de reportes financieros y operativos.
- **Empleados / Recepción:** Registro diario de atención, gestión de socios, control de uso de mesas y cobro de cuotas o servicios.

## 4. Alcance del Producto (MVP)
### Incluido en el alcance actual:
- **Modelo y Base de Datos Relacional (`elclubom`):** Estructura normalizada para empleados, dueños, empleados comunes, teléfonos y entidades operativas del club (`database/script_elclub.sql`).
- **Módulo de Gestión de Personal y Socios (Planificado en UI):** Registro, consulta y actualización de perfiles y roles.
- **Módulo de Control de Mesas y Cobros (Planificado en UI):** Registro de uso de mesas, reservas y pagos.

### Fuera del alcance (Límites de esta versión):
- Aplicación móvil nativa para clientes externos.
- Pasarela de pagos en línea con tarjetas o QR bancario automatizado.
- Facturación electrónica integrada con impuestos nacionales.
