CREATE TABLE reservation(
   reservation_id INT AUTO_INCREMENT,
   reservation_date DATETIME,
   reservation_status BOOLEAN,
   PRIMARY KEY(reservation_id)
);

CREATE TABLE stopover(
   stopover_id INT AUTO_INCREMENT,
   stopover_duration INT,
   PRIMARY KEY(stopover_id)
);

CREATE TABLE city(
   city_id INT AUTO_INCREMENT,
   city_name VARCHAR(255),
   PRIMARY KEY(city_id)
);

CREATE TABLE planet(
   planet_id INT AUTO_INCREMENT,
   planet_name VARCHAR(255),
   city_id INT NOT NULL,
   PRIMARY KEY(planet_id),
   FOREIGN KEY(city_id) REFERENCES city(city_id)
);

CREATE TABLE client(
   client_id INT AUTO_INCREMENT,
   client_name VARCHAR(255),
   client_quantity INT,
   client_email VARCHAR(255),
   reservation_id INT NOT NULL,
   PRIMARY KEY(client_id),
   FOREIGN KEY(reservation_id) REFERENCES reservation(reservation_id)
);

CREATE TABLE passenger(
   passenger_id INT AUTO_INCREMENT,
   passenger_name VARCHAR(255),
   client_id INT NOT NULL,
   PRIMARY KEY(passenger_id),
   FOREIGN KEY(client_id) REFERENCES client(client_id)
);

CREATE TABLE flight(
   flight_id INT AUTO_INCREMENT,
   flight_date_departure DATETIME,
   flight_date_arrival DATETIME,
   is_flight_with_stopover BOOLEAN,
   flight_price INT,
   reservation_id INT NOT NULL,
   stopover_id INT NOT NULL,
   passenger_id INT NOT NULL,
   PRIMARY KEY(flight_id),
   FOREIGN KEY(reservation_id) REFERENCES reservation(reservation_id),
   FOREIGN KEY(stopover_id) REFERENCES stopover(stopover_id),
   FOREIGN KEY(passenger_id) REFERENCES passenger(passenger_id)
);

CREATE TABLE airport(
   airport_id INT AUTO_INCREMENT,
   airport_name VARCHAR(255),
   city_id INT,
   flight_id INT NOT NULL,
   PRIMARY KEY(airport_id),
   FOREIGN KEY(city_id) REFERENCES city(city_id),
   FOREIGN KEY(flight_id) REFERENCES flight(flight_id)
);

CREATE TABLE company(
   company_id INT AUTO_INCREMENT,
   company_name VARCHAR(255),
   company_mail VARCHAR(255),
   flight_id INT NOT NULL,
   PRIMARY KEY(company_id),
   FOREIGN KEY(flight_id) REFERENCES flight(flight_id)
);