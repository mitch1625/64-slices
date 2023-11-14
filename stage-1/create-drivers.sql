CREATE TABLE Drivers(
    id SERIAL PRIMARY KEY,
    store_id INTEGER REFERENCES Stores(id),
    full_name VARCHAR
);