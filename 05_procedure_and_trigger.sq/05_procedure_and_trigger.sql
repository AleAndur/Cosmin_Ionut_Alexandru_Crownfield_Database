-- Crownfield Eye Hospital - Part C: Stored Procedure and Trigger
-- Run after 01_schema.sql and 02_population.sql in MySQL Workbench.
-- The DROP IF EXISTS statements let you rerun this file without
-- an "already exists" error for the procedure or trigger.

USE cosmin_ionut_alexandru_g1420953;

-- C5: Stored procedure with one input parameter.
DROP PROCEDURE IF EXISTS GetPatientAppointments;

DELIMITER //

CREATE PROCEDURE GetPatientAppointments(IN p_patient_id VARCHAR(10))
BEGIN
    SELECT Appointment_ID, Appointment_Date
    FROM Appointment
    WHERE Patient_ID = p_patient_id;
END //

DELIMITER ;

-- Example test: returns appointments belonging to patient OP001.
CALL GetPatientAppointments('OP001');

-- C6: Trigger to prevent blank diagnosis names on new diagnoses.
DROP TRIGGER IF EXISTS CheckDiagnosisName;

DELIMITER //

CREATE TRIGGER CheckDiagnosisName
BEFORE INSERT ON Diagnosis
FOR EACH ROW
BEGIN
    IF TRIM(NEW.Diagnosis_Name) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Diagnosis name cannot be empty';
    END IF;
END //

DELIMITER ;
