CREATE TABLE Deliveries (
    id SERIAL PRIMARY KEY,
    driver_id INTEGER REFERENCES Drivers(id),
    order_id INTEGER REFERENCES Orders(id),
    started_delivery TIME,
    completed_delivery TIME
);