CREATE DATABASE bd_nicholas_delarosa_mulata;

CREATE TABLE SUPPLIERS (
    id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    supplier_city VARCHAR(100) NOT NULL,
    CONSTRAINT uq_supplier_name UNIQUE (supplier_name),
    CONSTRAINT chk_supplier_name CHECK (TRIM(supplier_name) <> ''),
    CONSTRAINT chk_supplier_city CHECK (TRIM(supplier_city) <> '')
);

CREATE TABLE WAREHOUSES (
    id SERIAL PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    warehouse_city VARCHAR(100) NOT NULL,
    CONSTRAINT uq_warehouse_name UNIQUE (warehouse_name),
    CONSTRAINT chk_warehouse_name CHECK (TRIM(warehouse_name) <> ''),
    CONSTRAINT chk_warehouse_city CHECK (TRIM(warehouse_city) <> '')
);

CREATE TABLE PRODUCTS (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    CONSTRAINT uq_product_name UNIQUE (product_name),
    CONSTRAINT chk_product_name CHECK (TRIM(product_name) <> ''),
    CONSTRAINT chk_category CHECK (TRIM(category) <> '')
);

CREATE TABLE MOVEMENT_TYPES (
    id SERIAL PRIMARY KEY,
    movement_type VARCHAR(100) NOT NULL,
    CONSTRAINT uq_movement_type UNIQUE (movement_type),
    CONSTRAINT chk_movement_type CHECK (TRIM(movement_type) <> '')
);

CREATE TABLE PURCHASES (
    id SERIAL PRIMARY KEY,
    movement_date DATE NOT NULL,
    id_supplier INT NOT NULL,
    id_warehouse INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    id_movement_type INT NOT NULL,
    purchase_order VARCHAR(100) NOT NULL,
    CONSTRAINT chk_quantity CHECK (quantity > 0),
    CONSTRAINT chk_unit_price CHECK (unit_price > 0),
    CONSTRAINT chk_purchase_order CHECK (TRIM(purchase_order) <> ''),
    CONSTRAINT uq_purchase_order UNIQUE (purchase_order),
    FOREIGN KEY (id_supplier)
        REFERENCES SUPPLIERS(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (id_warehouse)
        REFERENCES WAREHOUSES(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (id_product)
        REFERENCES PRODUCTS(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (id_movement_type)
        REFERENCES MOVEMENT_TYPES(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

SELECT * FROM SUPPLIERS;
SELECT * FROM WAREHOUSES;
SELECT * FROM PRODUCTS;
SELECT * FROM MOVEMENT_TYPES;
SELECT * FROM PURCHASES;