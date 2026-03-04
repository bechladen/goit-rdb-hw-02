CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

CREATE TABLE addresses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  street VARCHAR(120) NOT NULL,
  city VARCHAR(60) NOT NULL,
  postal_code VARCHAR(20),
  country VARCHAR(60) NOT NULL
);

CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(80) NOT NULL,
  contact VARCHAR(120),
  address_id INT,
  CONSTRAINT fk_customers_address
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE order_items (
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  qty INT NOT NULL,
  PRIMARY KEY (order_id, product_id),
  CONSTRAINT fk_items_order
    FOREIGN KEY (order_id) REFERENCES orders(id),
  CONSTRAINT fk_items_product
    FOREIGN KEY (product_id) REFERENCES products(id)
);