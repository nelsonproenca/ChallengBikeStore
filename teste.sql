
-- Listar todos Clientes que não tenham realizado uma compra;

SELECT cus.[customer_id]
FROM [dbo].[customers] cus
LEFT JOIN [dbo].[orders] odr ON odr.[customer_id] = cus.[customer_id]
WHERE odr.[customer_id] IS NULL

-- Listar os Produtos que não tenham sido comprados
SELECT prod.[product_id]
FROM [dbo].[products] prod
LEFT JOIN [dbo].[order_items] oit ON oit.[product_id] = prod.[product_id]
WHERE oit.[product_id] IS NULL

-- Listar os Produtos sem Estoque;
SELECT prod.[product_id]
FROM [dbo].[products] prod
LEFT JOIN [dbo].[stocks] st ON st.[product_id] = prod.[product_id]
WHERE st.[product_id] IS NULL

-- Listar os Funcionarios que não estejam relacionados a um Pedido.
SELECT sta.[staff_id]
FROM [dbo].[staffs] sta
LEFT JOIN [dbo].[orders] odr ON odr.[staff_id] = sta.[staff_id]
WHERE odr.[staff_id] IS NULL

-- Agrupar a quantidade de vendas que uma determinada Marca por Loja.

SELECT COUNT(odr.[order_id]),
	store_name,
	brand_name
FROM [dbo].[orders] odr
LEFT JOIN [dbo].[order_items] oit ON oit.[order_id] = sta.[order_id] 
LEFT JOIN [dbo].[products] prod ON prod.[product_id] = oit.[product_id]
LEFT JOIN [dbo].[brands] bra ON bra.[brand_id] = prod.[brand_id]
group by store_name,brand_name



