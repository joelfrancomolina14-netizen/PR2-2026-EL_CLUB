# Guía de Contribución - EL CLUB

Gracias por contribuir al desarrollo del sistema de gestión **EL CLUB**. Para mantener el orden del repositorio, sigue estas normas:

## 1. Flujo de Ramas
- `main`: Rama principal estable y lista para presentación. **No hacer push directo.**
- `develop`: Rama de integración del equipo (opcional si trabajan con ramas por funcionalidad).
- `feature/<nombre-corto>`: Para nuevas funcionalidades (ej. `feature/modulo-pagos`).
- `fix/<nombre-corto>`: Para corrección de errores (ej. `fix/validacion-socio`).
- `docs/<nombre-corto>`: Para actualizaciones de documentación.

## 2. Convención de Commits
Utiliza mensajes claros y descriptivos en español o inglés siguiendo el formato:
- `feat: agrega registro de pago de cuotas mensuales`
- `fix: corrige validación de carnet duplicado en socios`
- `docs: actualiza modelo de datos y diagrama ER`
- `refactor: mejora consultas SQL en capa de datos`
- `test: añade pruebas unitarias para cálculo de mora`

## 3. Pull Requests
1. Crea un Issue describiendo la tarea o error antes de empezar.
2. Verifica que el proyecto compile sin errores en Visual Studio.
3. Abre un Pull Request hacia `main` referenciando el Issue (`Closes #N`).
4. Solicita revisión de al menos un compañero del equipo.
