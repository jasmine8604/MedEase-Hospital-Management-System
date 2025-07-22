-- sample_queries.sql: Example queries for testing

-- Add patients
INSERT INTO Patient VALUES ('P101', 'Aarav Gupta', 22, 'M', 'Delhi', '7770001112');
INSERT INTO Patient VALUES ('P102', 'Neha Sharma', 28, 'F', 'Mumbai', '9990002233');

-- Add doctors
INSERT INTO Doctor VALUES ('D201', 'Dr. Kapoor', 'Cardiology', '8881122233');
INSERT INTO Doctor VALUES ('D202', 'Dr. Mehta', 'Orthopedics', '8883344455');

-- Add hospital
INSERT INTO Hospital VALUES ('H001', 'Apollo Hospital', 'Delhi', '011-22001100');

-- Add beds
INSERT INTO Bed VALUES ('B001', 'H001', 'General', 'N');
INSERT INTO Bed VALUES ('B002', 'H001', 'ICU', 'N');

-- Add employee
INSERT INTO Employees VALUES ('E001', 'Asha Singh', 'Receptionist', 'H001');

-- Book appointment (call procedure)
EXEC Book_Appointment('P101', 'D201', TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'OPD');

-- Try booking more than 5 appointments for a doctor on the same day to test the trigger
-- Observe trigger preventing booking
