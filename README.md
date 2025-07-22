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

## Sample Queries

```sql
-- Add a new patient
INSERT INTO Patient VALUES ('P101', 'Aarav Gupta', 22, 'M', 'Delhi', '7770001112');

-- Book appointment
EXEC Book_Appointment('P101', 'D201', TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'OPD');

