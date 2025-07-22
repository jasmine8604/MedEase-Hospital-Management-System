-- schema.sql: Table creation

CREATE TABLE Patient (
    patient_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender CHAR(1),
    city VARCHAR(50),
    contact VARCHAR(15)
);

CREATE TABLE Doctor (
    doctor_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE Hospital (
    hospital_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50),
    contact VARCHAR(15)
);

CREATE TABLE Appointment (
    appointment_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    doctor_id VARCHAR(10),
    appointment_date DATE,
    hospital_id VARCHAR(10),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id)
);

CREATE TABLE Bed (
    bed_id VARCHAR(10) PRIMARY KEY,
    hospital_id VARCHAR(10),
    type VARCHAR(20),
    is_occupied CHAR(1),
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id)
);

CREATE TABLE Employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    designation VARCHAR(50),
    hospital_id VARCHAR(10),
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id)
);

CREATE TABLE Book_Appointment (
    appointment_id VARCHAR(10),
    patient_id VARCHAR(10),
    doctor_id VARCHAR(10),
    appointment_date DATE,
    mode VARCHAR(20),
    PRIMARY KEY (appointment_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);
