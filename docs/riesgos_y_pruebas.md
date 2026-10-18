# ⚠️ Análisis de Riesgos y Estrategia de Pruebas

## 1. Tres Riesgos Principales y Mitigación
1. **Falta de integración oportuna entre la base de datos y la interfaz en C#:**
   * *Mitigación:* Crear y probar la capa de datos (DAL) antes de desarrollar la interfaz gráfica.
2. **Incompatibilidad o cambios en la estructura de datos:**
   * *Mitigación:* Validar el modelo relacional desde el inicio con el encargado de Base de Datos (Jhonn).
3. **Retraso en el cumplimiento de entregas individuales:**
   * *Mitigación:* Revisar los avances semanalmente mediante reuniones de control del repositorio.

## 2. Plan de Pruebas (Responsable: Leo - Tester)
* **Pruebas Unitarias:** Comprobar que los métodos de cálculo de fechas y validaciones de datos funcionen correctamente.
* **Pruebas de Integración:** Verificar la conexión y las consultas CRUD (Crear, Leer, Actualizar, Borrar) con la base de datos.
* **Pruebas de Interfaz:** Confirmar que los formularios bloqueen entradas inválidas y muestren mensajes claros.
