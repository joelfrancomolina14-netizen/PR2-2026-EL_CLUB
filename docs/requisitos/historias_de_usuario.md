# 📋 Historias de Usuario y Criterios de Aceptación - EL CLUB

## HU-01: Registro y Gestión de Socios
* **Como:** Administrador del club.
* **Quiero:** Registrar, consultar, actualizar y dar de baja la información de los socios (Nombre, CI, Teléfono, Estado).
* **Para:** Mantener un padrón actualizado de los miembros activos.
* **Criterios de Aceptación:**
  - El número de CI no debe repetirse en el sistema.
  - No se permiten campos obligatorios vacíos.

## HU-02: Control de Pagos y Cuotas
* **Como:** Administrador.
* **Quiero:** Registrar el pago de la cuota mensual de un socio y generar un comprobante.
* **Para:** Llevar un historial financiero claro de las aportaciones.
* **Criterios de Aceptación:**
  - El sistema debe calcular automáticamente la fecha de vencimiento de la cuota.
  - Debe mostrar alerta si el socio registra deudas pendientes.

## HU-03: Reserva de Canchas e Instalaciones
* **Como:** Administrador / Socio.
* **Quiero:** Seleccionar una cancha, fecha y horario disponible para realizar una reserva.
* **Para:** Evitar cruces de horarios e imprevistos en las instalaciones.
* **Criterios de Aceptación:**
  - El sistema debe bloquear automáticamente horarios previamente reservados.
  - Confirmar la reserva únicamente si el socio se encuentra al día en sus cuotas.
