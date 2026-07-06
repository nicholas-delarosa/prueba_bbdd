INSERT
INTO PURCHASES
(movement_date, id_supplier, id_warehouse, id_product, quantity, unit_price, id_movement_type, purchase_order)
VALUES
('01-01-1700','1','1', '1', '67', '67000', 2, 'PO-6666');

UPDATE SUPPLIERS
SET supplier_city = 'Santa Marta'
WHERE supplier_city = 'Sta Marta';

DELETE FROM PURCHASES
WHERE ID = 23;