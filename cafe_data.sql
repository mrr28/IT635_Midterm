CREATE DATABASE cafe_data;
CREATE USER cafe_user WITH PASSWORD 'testing';
GRANT ALL PRIVILEGES ON DATABASE cafe_data to cafe_user;
\c cafe_data

CREATE TABLE products (
  product_id      INTEGER NOT NULL,
  name            VARCHAR(256) NOT NULL,
  bev_food        VARCHAR(256) NOT NULL,
  price           VARCHAR(32) NOT NULL,
  quant_sold      INTEGER NOT NULL,
  PRIMARY KEY     ( product_id )
);

CREATE TABLE employees (
  employee_id     INTEGER NOT NULL,
  name            VARCHAR(256) NOT NULL,
  position        VARCHAR(256) NOT NULL,
  hrs_worked      INTEGER NOT NULL,
  PRIMARY KEY     ( employee_id )
);

CREATE TABLE purchases (
  purchase_id     INTEGER NOT NULL,
  product_id      INTEGER NOT NULL,
  employee_id     INTEGER NOT NULL,
  quantity        INTEGER NOT NULL,
  PRIMARY KEY ( purchase_id, product_id, employee_id ),
  CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id),
  CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

GRANT ALL PRIVILEGES ON products, employees, purchases TO cafe_user;

INSERT INTO products VALUES (0, 'Coffee', 'beverage', 2.00, 50);
INSERT INTO products VALUES (1, 'Latte', 'beverage', 3.75, 78);
INSERT INTO products VALUES (2, 'Americano', 'beverage', 3.00, 33);
INSERT INTO products VALUES (3, 'Macchiato', 'beverage', 3.75, 62);
INSERT INTO products VALUES (4, 'Muffin', 'food', 3.50, 44);
INSERT INTO products VALUES (5, 'Croissant', 'food', 4.50, 52);
INSERT INTO products VALUES (6, 'Scone', 'food', 3.00, 36);


INSERT INTO employees VALUES (0, 'Pete', 'Manager', 40);
INSERT INTO employees VALUES (1, 'Duncan', 'Barista', 35);
INSERT INTO employees VALUES (2, 'Starr', 'Barista', 30);
INSERT INTO employees VALUES (3, 'Buckey', 'Barista', 15);
INSERT INTO employees VALUES (4, 'Carl', 'Barista', 0);


INSERT INTO purchases VALUES (0, 1, 2, 1);
INSERT INTO purchases VALUES (0, 4, 3, 1);
INSERT INTO purchases VALUES (1, 0, 0, 4);
INSERT INTO purchases VALUES (2, 5, 1, 1);
INSERT INTO purchases VALUES (3, 3, 2, 2);
INSERT INTO purchases VALUES (3, 5, 2, 1);
INSERT INTO purchases VALUES (3, 6, 2, 1);
INSERT INTO purchases VALUES (4, 0, 2, 1);
