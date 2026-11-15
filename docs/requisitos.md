# Requisitos del Sistema — EL CLUB

Este documento especifica los requisitos funcionales y no funcionales verificables del sistema **EL CLUB**, complementando el detalle de criterios de aceptación disponible en [`docs/requisitos/historias_de_usuario.md`](requisitos/historias_de_usuario.md).

## 1. Requisitos Funcionales (RF)
- **RF-01 (Gestión de Personal y Roles):** El sistema debe permitir registrar, consultar, actualizar y diferenciar perfiles entre dueños (`duenos`) y empleados operativos (`empleados_comunes`).
- **RF-02 (Gestión de Contactos):** El sistema debe permitir asociar uno o múltiples números telefónicos (`telefonos_empleados`) a cada miembro del personal.
- **RF-03 (Gestión de Socios):** El sistema debe permitir el alta, búsqueda y actualización de socios del club de billar, validando que no existan registros duplicados.
- **RF-04 (Control de Mesas / Reservas):** El sistema debe permitir registrar el estado de las mesas de billar (disponible, ocupada, reservada) y calcular el tiempo de uso.
- **RF-05 (Registro de Pagos y Cuotas):** El sistema debe registrar los cobros por alquiler de mesa, consumos o cuotas de socios, generando un historial verificable.
- **RF-06 (Consultas y Reportes Básicos):** El sistema debe permitir a los dueños consultar resúmenes de ingresos y actividad operativa por fecha.

## 2. Requisitos No Funcionales (RNF)
- **RNF-01 (Integridad Referencial):** La base de datos (`elclubom`) debe garantizar la integridad de los datos mediante claves primarias (`PK`), claves foráneas (`FK`) y restricciones de dominio (`CHECK`).
- **RNF-02 (Seguridad de Credenciales):** Ninguna contraseña o cadena de conexión real debe almacenarse en texto plano dentro del código fuente del repositorio.
- **RNF-03 (Usabilidad en Escritorio):** La interfaz de escritorio (Windows Forms en C#) debe ofrecer navegación clara por módulos para reducir el tiempo de registro en recepción.
- **RNF-04 (Mantenibilidad):** El código fuente debe seguir una arquitectura separada por capas (Presentación, Negocio, Datos) y las convenciones definidas en `.editorconfig`.
