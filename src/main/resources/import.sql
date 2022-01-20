ALTER TABLE Repair ALTER COLUMN address VARCHAR(255) COLLATE Latin1_General_100_CI_AI_SC_UTF8;

INSERT INTO Users (afm, first_name, last_name, address, phone_number, email, password, roles) VALUES ('123456789', 'John', 'Smith', '25 Tsimiski', 2310444455, 'test@user.com', '$2a$10$hmCPrjOxKyFXda.Z40rcHeeJmQu7CrEqunNAnju1l9SrmzrOcpXqe', 'USER');
INSERT INTO Users (afm, first_name, last_name, address, phone_number, email, password, roles) VALUES ('987654321', 'George', 'Papadopoulos', '3 Trapezountos', 2102102100, 'test@admin.com', '$2a$10$hmCPrjOxKyFXda.Z40rcHeeJmQu7CrEqunNAnju1l9SrmzrOcpXqe', 'ADMIN');
INSERT INTO Users (afm, first_name, last_name, address, phone_number, email, password, roles) VALUES ('112356794', 'Athanasios', 'Galatis', '43 Kavalas', 2310231023, 'athanasiosgalatis2@somecompany.com', '$2a$10$hmCPrjOxKyFXda.Z40rcHeeJmQu7CrEqunNAnju1l9SrmzrOcpXqe', 'ADMIN');
INSERT INTO Users (afm, first_name, last_name, address, phone_number, email, password, roles) VALUES ('123457890', 'Marios', 'Genigiorgis', '47 Korai', 2103456789, 'mariosgenigiorgis@somecompany.com', '$2a$10$hmCPrjOxKyFXda.Z40rcHeeJmQu7CrEqunNAnju1l9SrmzrOcpXqe', 'ADMIN');
INSERT INTO Users (afm, first_name, last_name, address, phone_number, email, password, roles) VALUES ('123432109', 'Niyazi', 'Haci-Halil', '2 Smirnis', 2541012345, 'niyazihacihalil@somecompany.com', '$2a$10$hmCPrjOxKyFXda.Z40rcHeeJmQu7CrEqunNAnju1l9SrmzrOcpXqe', 'ADMIN');
INSERT INTO Users (afm, first_name, last_name, address, phone_number, email, password, roles) VALUES ('987643246', 'Dimitra', 'Florou', '78 Venizelou', 2541023456, 'dimitraflorou5@somecompany.com', '$2a$10$hmCPrjOxKyFXda.Z40rcHeeJmQu7CrEqunNAnju1l9SrmzrOcpXqe', 'ADMIN');
INSERT INTO Users (afm, first_name, last_name, address, phone_number, email, password, roles) VALUES ('123456700', 'Jonas', 'Kahnwald', '67 Skiathou', 2310056789, 'johnaskahnwald@somecompany.com', '$2a$10$hmCPrjOxKyFXda.Z40rcHeeJmQu7CrEqunNAnju1l9SrmzrOcpXqe', 'ADMIN');


--
INSERT INTO Repair ("date", state, repair_type, cost, address, user_id, description) VALUES (SYSDATETIME(), 'WAITING', 'PAINTING', 130, 'Klemanso 25', 1, '2 Rooms');
INSERT INTO Repair ("date", state, repair_type, cost, address, user_id, description) VALUES (SYSDATETIME(), 'ONGOING', 'INSULATION', 1500, 'Korai 47', 2, 'Whole House');
INSERT INTO Repair ("date", state, repair_type, cost, address, user_id, description) VALUES (SYSDATETIME(), 'DONE', 'FRAMES', 2500, 'Skiathou 67', 3, '9 Windows');
INSERT INTO Repair ("date", state, repair_type, cost, address, user_id, description) VALUES (SYSDATETIME(), 'WAITING', 'PLUMBING', 300, 'Korai 47', 4, 'Bathroom');
INSERT INTO Repair ("date", state, repair_type, cost, address, user_id, description) VALUES (SYSDATETIME(), 'ONGOING', 'ELECTRICAL_WORK', 150, 'Venizelou 78', 5, 'Electric Sockets');
INSERT INTO Repair ("date", state, repair_type, cost, address, user_id, description) VALUES ('2020-11-11', 'DONE', 'ELECTRICAL_WORK', 1000, 'Kavalas 43', 6, 'New sockets & switches for the whole house');
INSERT INTO Repair ("date", state, repair_type, cost, address, user_id, description) VALUES ('2020-11-11', 'DONE', 'ELECTRICAL_WORK', 1000, 'Kavalas 43', 6, 'New sockets & switches for the whole house');


--
INSERT INTO Property (property_id, house_type, year_of_construction, address, user_id) VALUES ('123456789' , 'APARTMENT_BUILDING',  1983, '43 Kavalas', 1);
INSERT INTO Property (property_id, house_type, year_of_construction, address, user_id) VALUES ('123455678' , 'APARTMENT_BUILDING',  2000, '78 Venizelou', 2);
INSERT INTO Property (property_id, house_type, year_of_construction, address, user_id) VALUES ('012345678' , 'MAISONETTE',  1987, 'Skiathou 67', 3);
INSERT INTO Property (property_id, house_type, year_of_construction, address, user_id) VALUES ('901234567' , 'MAISONETTE',  1995, 'Klemanso 25', 4);
INSERT INTO Property (property_id, house_type, year_of_construction, address, user_id) VALUES ('123456456' , 'DETACHED_HOUSE',  1977, 'Kavalas 3', 5);
INSERT INTO Property (property_id, house_type, year_of_construction, address, user_id) VALUES ('123123123' , 'DETACHED_HOUSE',  2010, 'Klemanso 2', 5);
INSERT INTO Property (property_id, house_type, year_of_construction, address, user_id) VALUES ('123456780' , 'APARTMENT_BUILDING',  2003, 'Korai 47', 1);
