-- CREATE DATABASE pizza_shop;

-- \connect pizza_shop

DROP TABLE IF EXISTS Stores;
CREATE TABLE Stores(
    id SERIAL PRIMARY KEY,
    location VARCHAR
);
-- \copy Stores(id, location) FROM '/home/eric/code-platoon/week7-sql/sql-64-slices-1/stage-1/data/stores.csv' CSV HEADER;

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
    id SERIAL PRIMARY KEY,
    street VARCHAR,
    city VARCHAR,
    zip VARCHAR,
    country VARCHAR
);
-- \copy Customers(id, street,city,zip,country) FROM './data/customers.csv' CSV HEADER;


DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES Customers(id),
    date DATE,
    pizza_type VARCHAR REFERENCES Available_Pizzas(name),
    store_id INTEGER REFERENCES Stores(id),
    toppings INTEGER ARRAY REFERENCES Available_Toppings(id)
);
-- \copy Orders(id, customer_id, date, pizza_type, store_id, toppings) FROM './data/orders.csv' CSV HEADER;

DROP TABLE IF EXISTS Drivers;
CREATE TABLE Drivers(
    id SERIAL PRIMARY KEY,
    store_id INTEGER REFERENCES Stores(id),
    full_name VARCHAR
);
-- \copy Drivers(id,store_id, full_name) FROM './data.drivers.csv' CSV HEADER;


DROP TABLE IF EXISTS Deliveries;
CREATE TABLE Deliveries (
    id SERIAL PRIMARY KEY,
    driver_id INTEGER REFERENCES Drivers(id),
    order_id INTEGER REFERENCES Orders(id),
    started_delivery TIME,
    completed_delivery TIME
);
-- \copy Deliveries(id, name,cost_per_pizza) FROM './data/deliveries.csv' CSV HEADER;


DROP TABLE IF EXISTS Available_Toppings;
CREATE TABLE Available_Toppings (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    cost_per_pizza INTEGER
);
-- \copy Available_Toppings(id, name,cost_per_pizza) FROM './data/available_toppings.csv' CSV HEADER;


DROP TABLE IF EXISTS Available_Pizzas;
CREATE TABLE Available_Pizzas(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    cost INTEGER
);
-- \copy Available_Pizzas(id, name, cost) FROM '/home/eric/code-platoon/week7-sql/sql-64-slices-1/stage-1/data/available_pizzas.csv' CSV HEADER;
