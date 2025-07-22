-- triggers_and_procedures.sql: PL/SQL logic

-- Procedure to Book Appointment
CREATE OR REPLACE PROCEDURE Book_Appointment (
    pid IN VARCHAR2,
    did IN VARCHAR2,
    app_date IN DATE,
    mode IN VARCHAR2
)
IS
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Appointment
    WHERE doctor_id = did AND appointment_date = app_date;

    IF v_count >= 5 THEN
        DBMS_OUTPUT.PUT_LINE('Doctor not available on this date.');
    ELSE
        INSERT INTO Appointment (appointment_id, patient_id, doctor_id, appointment_date, hospital_id)
        VALUES ('A' || TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), pid, did, app_date, 'H001');

        INSERT INTO Book_Appointment (appointment_id, patient_id, doctor_id, appointment_date, mode)
        VALUES ('A' || TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), pid, did, app_date, mode);

        DBMS_OUTPUT.PUT_LINE('Appointment booked successfully.');
    END IF;
END;
/

-- Trigger to Prevent Double Booking
CREATE OR REPLACE TRIGGER Check_Doctor_Availability
BEFORE INSERT ON Appointment
FOR EACH ROW
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Appointment
    WHERE doctor_id = :NEW.doctor_id AND appointment_date = :NEW.appointment_date;

    IF v_count >= 5 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Doctor already has 5 appointments for this date.');
    END IF;
END;
/

-- Trigger to Auto-assign Unoccupied Bed
CREATE OR REPLACE TRIGGER Assign_Bed_Automatically
AFTER INSERT ON Appointment
FOR EACH ROW
DECLARE
    v_bed_id VARCHAR2(10);
BEGIN
    SELECT bed_id INTO v_bed_id
    FROM Bed
    WHERE is_occupied = 'N' AND ROWNUM = 1;

    IF v_bed_id IS NOT NULL THEN
        UPDATE Bed SET is_occupied = 'Y' WHERE bed_id = v_bed_id;
        DBMS_OUTPUT.PUT_LINE('Bed ' || v_bed_id || ' assigned.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No beds available.');
    END IF;
END;
/
