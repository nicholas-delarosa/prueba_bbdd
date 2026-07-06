-- Consult 1
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
SELECT
	w.id,
	w.warehouse_name,
	SUM(quantity * unit_price) AS total_values
FROM PURCHASES p
JOIN WAREHOUSES w
ON p.id_warehouse = w.id
GROUP BY w.id, w.warehouse_name
ORDER BY total_values DESC, w.warehouse_name ASC;