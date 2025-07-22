# MedEase – Hospital Management System (DBMS Project)

A comprehensive hospital management system built using Oracle SQL and PL/SQL. Designed to manage patients, doctors, appointments, hospitals, and beds through a normalized relational schema. The project includes stored procedures, triggers, and advanced data integrity constraints.

---

## Database Overview

- **Tables**:
  - `Patient`, `Doctor`, `Hospital`, `Appointment`, `Bed`, `Book_Appointment`, `Manages_H`, `Employees`
- **Normalization**: Achieved up to **3NF**
- **PL/SQL Features**:
  - Triggers for validating doctor availability
  - Procedures for booking appointments

---

## Technologies Used
- Oracle SQL
- PL/SQL (Procedures and Triggers)
- ER Modeling
- Data Normalization (1NF, 2NF, 3NF)

---

## Features
- Add and manage doctors, hospitals, and patients
- Book appointments only when doctor and bed are available
- Trigger-based validations for real-time availability
- Track employees and hospital assignments

---
## Key Procedures & Triggers

- **`Book_Appointment`** – PL/SQL procedure to automate appointment scheduling, checking both doctor and bed availability.
- **`Check_Doctor_Availability`** – Trigger to prevent double-booking of doctors.
- **`Assign_Bed_Automatically`** – Trigger to allocate beds upon booking based on room availability.

  ---

## Screenshots

### 🏥 Hospital Table
Shows the hospital database with ID, name, location, and contact number.

![Hospital Table](images/hospital.png)

---

### 👤 Patients Table
Displays stored patient information such as name, age, gender, city, and phone.

![Patients Table](images/patients.png)

---

### 📅 Appointments Table
Logs each appointment with doctor ID, patient ID, hospital ID, and date.

![Appointments Table](images/appointments.png)

## Sample Queries

```sql
-- Add a new patient
INSERT INTO Patient VALUES ('P101', 'Aarav Gupta', 22, 'M', 'Delhi', '7770001112');

-- Book appointment
EXEC Book_Appointment('P101', 'D201', TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'OPD');

