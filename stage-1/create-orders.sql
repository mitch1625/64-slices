CREATE TABLE Orders(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES Customers(id),
    date DATE,
    pizza_type VARCHAR REFERENCES Available_Pizzas(name),
    store_id INTEGER REFERENCES Stores(id),
    toppings INTEGER ARRAY REFERENCES Available_Toppings(id)
);