CREATE DATABASE examjava2020;
Use examjava2020;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Location`;
CREATE TABLE Location (
location_code INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
location_description TEXT);
DESCRIBE Location;

DROP TABLE IF EXISTS `Employees`;
CREATE TABLE Employees (
employee_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
start_date DATETIME,
end_date DATETIME,
other_details TEXT);
DESCRIBE Employees;


DROP TABLE IF EXISTS `Projects`;
CREATE TABLE Projects (
project_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
location_code INT,
project_mgr_employee_id INT,
start_date DATETIME,
end_date DATETIME,

other_details TEXT,
CONSTRAINT fk_location_code FOREIGN KEY (location_code) REFERENCES Location(`location_code`),
CONSTRAINT fk_employee_id FOREIGN KEY (project_mgr_employee_id) REFERENCES Employees(employee_id));
DESCRIBE Projects;


DROP TABLE IF EXISTS `Activity_Codes`;
CREATE TABLE Activity_Codes (
activity_code INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
activity_description TEXT);
DESCRIBE Activity_Codes;


DROP TABLE IF EXISTS `Activities`;
CREATE TABLE Activities (
activity_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
activity_code INT,
project_id INT,
start_date DATETIME,
end_date DATETIME,
other_details TEXT,
CONSTRAINT fk_project_id FOREIGN KEY (project_id) REFERENCES Projects(project_id),
CONSTRAINT fk_activity_code FOREIGN KEY (activity_code) REFERENCES Activity_Codes(activity_code));

DESCRIBE Activities;


DROP TABLE IF EXISTS `Cost_Centers`;
CREATE TABLE Cost_Centers (
cost_center_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
cost_center_name TEXT,
cost_center_description TEXT,
other_details TEXT);
DESCRIBE Cost_Centers;





DROP TABLE IF EXISTS `Timesheets`;
CREATE TABLE Timesheets (
timesheet_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
activity_id INT,
authorised_by_employee_id INT,
cost_center_id INT,
timesheet_for_employee_id DATETIME,
start_date DATETIME,
end_date DATETIME,
submitted_date DATETIME,
other_details TEXT,
FOREIGN KEY (activity_id) REFERENCES Activities(activity_id),
FOREIGN KEY (authorised_by_employee_id) REFERENCES Employees(employee_id),
CONSTRAINT fk_cost_center_id FOREIGN KEY (cost_center_id) REFERENCES Cost_Centers(cost_center_id));
DESCRIBE Timesheets;


SET FOREIGN_KEY_CHECKS = 1;


