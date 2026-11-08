-- Crownfield Eye Hospital: Part C individual queries (tasks 1-4)
-- Run AFTER 01_schema.sql and 02_population.sql.
-- The stored procedure and trigger belong in 05_procedure_and_trigger.sql.

USE cosmin_ionut_alexandru_g1420953;

-- C1 - GROUP BY and HAVING
SELECT Clinician_ID, COUNT(*) AS Appointment_Count
FROM Appointment
GROUP BY Clinician_ID
HAVING COUNT(*) > 1;

-- C2 - INNER JOIN across Patient, Appointment and Clinician
SELECT
    Appointment.Appointment_ID,
    Patient.First_Name AS Patient_Name,
    Clinician.First_Name AS Clinician_Name,
    Appointment.Appointment_Date
FROM Appointment
INNER JOIN Patient
ON Appointment.Patient_ID = Patient.Patient_ID
INNER JOIN Clinician
ON Appointment.Clinician_ID = Clinician.Clinician_ID
ORDER BY Appointment.Appointment_ID;

-- C3 - LEFT JOIN to identify appointments without prescriptions
SELECT
    Appointment.Appointment_ID,
    Prescription.Prescription_ID
FROM Appointment
LEFT JOIN Prescription
ON Appointment.Appointment_ID = Prescription.Appointment_ID
WHERE Prescription.Prescription_ID IS NULL;

-- C4 - Subquery to find patients seen by clinician CL001
SELECT Patient_ID, First_Name, Last_Name
FROM Patient
WHERE Patient_ID IN (
    SELECT Patient_ID
    FROM Appointment
    WHERE Clinician_ID = 'CL001'
);
