CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE salesperson(
    salesperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    customer_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    license VARCHAR(50),
    price NUMERIC,
    customer_id INTEGER NOT NULL,
    salesperson_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id) ON DELETE CASCADE
);

CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    invoice_date DATE DEFAULT CURRENT_DATE,
    car_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    salesperson_id INTEGER NOT NULL,
    FOREIGN KEY (car_id) REFERENCES car(car_id) ON DELETE CASCADE,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id) ON DELETE CASCADE
);

CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE service_ticket(
    service_id SERIAL PRIMARY KEY,
    service_date DATE DEFAULT CURRENT_DATE,
    service_amount NUMERIC,
    car_parts VARCHAR(50),
    car_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    mechanic_id INTEGER NOT NULL,
    FOREIGN KEY (car_id) REFERENCES car(car_id) ON DELETE CASCADE,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id) ON DELETE CASCADE
);
