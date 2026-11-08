USE cosmin_ionut_alexandru_g1420953;
-- Part B tests: run after 01_schema.sql and 02_population.sql.
-- Run on a fresh populated database. The ALTER constraint should not already exist.
-- The DELETE test inserts and removes a temporary diagnosis record.


-- ALTER TABLE constraint
ALTER TABLE follow_up_plan ADD CONSTRAINT chk_status
CHECK (Status IN ('Pending', 'Completed', 'Cancelled'));


-- UPDATE test
Select Patient_ID, First_name, Postcode
FROM Patient
WHERE Patient_ID = 'OP005';

UPDATE Patient
Set Postcode = 'M1 2AB'
Where Patient_ID = 'OP005';

Select Patient_ID, First_name, Postcode
From Patient
Where Patient_Id = 'OP005';


-- DELETE test

INSERT INTO Diagnosis (Diagnosis_ID, Appointment_ID, Diagnosis_Name)
VALUES ('DTEST', 'A015', 'Temporary test record');

SELECT * FROM Diagnosis
WHERE Diagnosis_ID = 'DTEST';

DELETE FROM Diagnosis
WHERE Diagnosis_ID = 'DTEST';

SELECT * FROM Diagnosis
WHERE Diagnosis_ID = 'DTEST';

SELECT COUNT(*) AS Diagnosis_Count
FROM Diagnosis;


-- Record-count verification

SELECT
    (SELECT COUNT(*) FROM Patient) AS Patient,
    (SELECT COUNT(*) FROM Clinician) AS Clinician,
    (SELECT COUNT(*) FROM Clinic) AS Clinic,
    (SELECT COUNT(*) FROM Medicine) AS Medicine,
    (SELECT COUNT(*) FROM Appointment) AS Appointment,
    (SELECT COUNT(*) FROM Diagnosis) AS Diagnosis,
    (SELECT COUNT(*) FROM Prescription) AS Prescription,
    (SELECT COUNT(*) FROM Prescription_Item) AS Prescription_Item,
    (SELECT COUNT(*) FROM Follow_Up_Plan) AS Follow_Up_Plan;
