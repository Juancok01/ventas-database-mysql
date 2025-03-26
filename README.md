# 🛍️ Sistema de Gestión de Ventas - MySQL

Base de datos completa para gestión de ventas con productos, vendedores y transacciones comerciales.

## 📌 Características

- **Estructura normalizada**: 4 tablas principales relacionadas
- **Dataset realista**
- **15+ consultas analíticas**: Incluye análisis ABC, márgenes y tendencias
- **Diagrama ER profesional**: Visualización clara de relaciones
- **Fácil implementación**: Scripts SQL listos para ejecutar

 ## 🗃️ Estructura de Base de Datos

 erDiagram
 
    PRODUCTOS ||--o{ VENTAS : "1-N"
    VENDEDORES ||--o{ VENTAS : "1-N"
    PRODUCTOS ||--o{ HISTORICO_PRECIOS : "1-N"
    
    PRODUCTOS {
        int producto_id PK
        varchar(100) nombre
        varchar(50) categoria
        decimal(10,2) precio
        decimal(10,2) costo
        int stock
        date fecha_creacion
        boolean activo
    }
    
    VENTAS {
        int venta_id PK
        datetime fecha_venta
        int producto_id FK
        int vendedor_id FK
        int cantidad
        decimal(10,2) precio_unitario
        decimal(10,2) total
    }


 ## 📂 Estructura del Proyecto

 01_schema.sql       # Estructura de la base de datos
 
 02_data.sql         # Datos iniciales (IDs 9-16)
 
 03_queries.sql      # Consultas analíticas
 
