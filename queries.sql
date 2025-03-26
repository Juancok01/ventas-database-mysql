
-- ventas totales por vendedor y comsion ganada
select v.nombre as vendedor,
       sum(ve.venta_id) as venta_total,
       round(sum(ve.total) *v.comision / 100, 2) as comision_ganada
from vendedores v
inner join ventas ve
on v.vendedor_id = ve.vendedor_id
group by v.vendedor_id
order by venta_total desc;




-- productos mas vendidos
select p.categoria,
 	   p.nombre as productos,
 	   sum(v.cantidad) as unidades_vendidas
from productos  p
left join ventas v
on p.producto_id = v.producto_id
group by p.producto_id
having sum(v.cantidad) > (select avg(cantidad)
                          from ventas)
order by unidades_vendidas desc;




-- Ventas diarias
select date(fecha_venta) as dia,
       count(*) as numero_de_ventas,
       sum(total) as monto_total
from ventas
group by dia
order by dia asc;




-- Utilidades de los productos 
select nombre as producto,
       costo as precio_de_compra,
       precio as precio_de_venta,
       (select sum(cantidad) from ventas where producto_id = productos.producto_id) as unidades_vendidas,
       round( precio - costo , 2) as margen_de_ganacia,
       (select sum(total) from ventas where producto_id = productos.producto_id) as ingresos_totales
from productos
order by margen_de_ganacia desc;


-- 

WITH ventas_productos AS (
    SELECT 
        p.producto_id,
        p.nombre,
        SUM(v.total) AS ventas_totales,
        SUM(v.total) / (SELECT SUM(total) FROM ventas WHERE producto_id BETWEEN 9 AND 16) * 100 AS porcentaje_ventas
    FROM productos p
    JOIN ventas v ON p.producto_id = v.producto_id
    WHERE p.producto_id BETWEEN 9 AND 16
    GROUP BY p.producto_id
)
SELECT 
    producto_id,
    nombre,
    ventas_totales,
    porcentaje_ventas,
    SUM(porcentaje_ventas) OVER (ORDER BY porcentaje_ventas DESC) AS porcentaje_acumulado,
    CASE 
        WHEN SUM(porcentaje_ventas) OVER (ORDER BY porcentaje_ventas DESC) <= 80 THEN 'A'
        WHEN SUM(porcentaje_ventas) OVER (ORDER BY porcentaje_ventas DESC) <= 95 THEN 'B'
        ELSE 'C'
    END AS categoria_abc
FROM ventas_productos
ORDER BY porcentaje_ventas DESC;



-- 

