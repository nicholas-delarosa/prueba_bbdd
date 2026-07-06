-- Purchases, but pretty
CREATE VIEW view_purchases_pretty
AS
SELECT
    p.id,
	p.movement_date,
	s.supplier_name AS supplier_name,
	w.warehouse_name AS warehouse_name,
	pr.product_name AS product_name,
	p.quantity,
	p.unit_price,
	m.movement_type AS movement_type,
	p.purchase_order
FROM PURCHASES p
INNER JOIN SUPPLIERS s
ON p.id_supplier = s.id
INNER JOIN WAREHOUSES w
ON p.id_warehouse = w.id
INNER JOIN PRODUCTS pr
ON p.id_product = pr.id
INNER JOIN MOVEMENT_TYPES m
ON p.id_movement_type = m.id;

-- Consult 1
CREATE VIEW view_consult_1
AS
SELECT
	pr.id,
	pr.product_name,
	SUM(
		CASE
			--WHEN p.id_movement_type = 1 THEN p.quantity
			WHEN p.id_movement_type = 2 THEN -p.quantity
			END
	) AS available_stock
FROM PURCHASES p
JOIN PRODUCTS pr
ON p.id_product = pr.id
GROUP BY pr.id, pr.product_name
ORDER BY available_stock DESC, pr.product_name ASC;

-- Consult 2
CREATE VIEW view_consult_2
AS
SELECT
	p.id,
	m.movement_type,
	pr.product_name,
	pr.category,
	w.warehouse_name,
	w.warehouse_city
FROM PURCHASES p
JOIN PRODUCTS pr
ON pr.id = p.id_product
JOIN WAREHOUSES w
ON w.id = p.id_warehouse
JOIN MOVEMENT_TYPES m
ON m.id = p.id_movement_type;

-- Consult 3
CREATE VIEW view_consult_3
AS
SELECT
	s.id,
	s.supplier_name,
	SUM(unit_price) AS total_prices
FROM PURCHASES p
JOIN SUPPLIERS s
ON p.id_supplier = s.id
GROUP BY s.id, s.supplier_name
ORDER BY total_prices DESC, s.supplier_name ASC;

-- Consult 4
CREATE VIEW view_consult_4
AS
SELECT
	w.id,
	w.warehouse_name,
	COUNT(id_movement_type) AS total_movements
FROM PURCHASES p
JOIN WAREHOUSES w
ON p.id_warehouse = w.id
GROUP BY w.id, w.warehouse_name
ORDER BY total_movements DESC, w.warehouse_name ASC;

-- Consult 5
CREATE VIEW view_consult_5
AS
SELECT
	pr.id,
	pr.product_name,
	COUNT(id_movement_type) AS total_movements
FROM PURCHASES p
JOIN PRODUCTS pr
ON p.id_product = pr.id
GROUP BY pr.id, pr.product_name
ORDER BY total_movements DESC, pr.product_name ASC
LIMIT 1;

-- Consult 6
CREATE VIEW view_consult_6
AS
SELECT
	w.id,
	w.warehouse_name,
	SUM(quantity * unit_price) AS total_values
FROM PURCHASES p
JOIN WAREHOUSES w
ON p.id_warehouse = w.id
GROUP BY w.id, w.warehouse_name
ORDER BY total_values DESC, w.warehouse_name ASC;

-- View views
SELECT * FROM public.view_purchases_pretty;
SELECT * FROM public.view_consult_1;
SELECT * FROM public.view_consult_2;
SELECT * FROM public.view_consult_3;
SELECT * FROM public.view_consult_4;
SELECT * FROM public.view_consult_5;
SELECT * FROM public.view_consult_6;
