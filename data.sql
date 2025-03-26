-- Datos iniciales para la tabla de productos
INSERT INTO productos (nombre, categoria, precio, costo, stock, fecha_creacion) 
VALUES
('Laptop EliteBook', 'Tecnología', 1299.99, 850.00, 45, '2023-01-15'),
('Smartphone Galaxy X', 'Tecnología', 899.99, 600.00, 80, '2023-02-10'),
('Mesa Ejecutiva', 'Muebles', 399.50, 250.00, 25, '2023-01-20'),
('Silla Ergonómica Premium', 'Muebles', 279.99, 170.00, 35, '2023-03-05'),
('Monitor Curvo 27"', 'Tecnología', 329.00, 210.00, 50, '2023-02-28'),
('Teclado Mecánico RGB', 'Accesorios', 89.99, 45.00, 100, '2023-03-10'),
('Mouse Inalámbrico Pro', 'Accesorios', 59.99, 32.00, 75, '2023-03-12'),
('Impresora Laser Multifunción', 'Oficina', 249.99, 160.00, 20, '2023-01-25');

-- Datos iniciales para la tabla de vendedores
INSERT INTO vendedores (nombre, email, telefono, fecha_contratacion, comision) 
VALUES
('Ana Martínez Rodríguez', 'ana.martinez@empresa.com', '+34 555 1001', '2022-01-10', 5.25),
('Carlos López García', 'carlos.lopez@empresa.com', '+34 555 1002', '2022-03-15', 6.75),
('María González Pérez', 'maria.gonzalez@empresa.com', '+34 555 1003', '2022-05-20', 7.00),
('Juan Pérez Sánchez', 'juan.perez@empresa.com', '+34 555 1004', '2023-01-05', 5.00),
('Laura Sánchez Martín', 'laura.sanchez@empresa.com', '+34 555 1005', '2023-02-12', 6.00);

-- Datos iniciales para la tabla de ventas 
INSERT INTO ventas (fecha_venta, producto_id, vendedor_id, cantidad, precio_unitario) 
VALUES
('2023-04-01 09:15:00', 9, 2, 1, 1299.99),  
('2023-04-01 10:30:00', 10, 1, 2, 899.99),   
('2023-04-02 11:45:00', 11, 3, 1, 399.50),    
('2023-04-02 14:20:00', 12, 5, 2, 279.99),    
('2023-04-03 16:10:00', 13, 4, 1, 329.00),    
('2023-04-03 17:30:00', 14, 2, 3, 89.99),    
('2023-04-04 10:00:00', 15, 1, 2, 59.99),     
('2023-04-04 12:45:00', 16, 3, 1, 249.99),    
('2023-04-05 09:30:00', 9, 5, 1, 1299.99),    
('2023-04-05 15:20:00', 10, 4, 1, 899.99),    
('2023-04-06 11:10:00', 11, 2, 1, 399.50),    
('2023-04-06 16:45:00', 12, 1, 1, 279.99),    
('2023-04-07 10:30:00', 13, 3, 1, 329.00),    
('2023-04-07 14:15:00', 14, 5, 2, 89.99),     
('2023-04-08 17:00:00', 15, 4, 1, 59.99);     

