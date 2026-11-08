-- Crownfield Eye Hospital - Part B database population
-- Student: Cosmin Ionut Alexandru
-- Execute this file AFTER 01_schema.sql, on a newly created, empty database.
-- Each set of fictional records is inserted once, in foreign-key dependency order.
-- Follow_Up_Plan records are included at the end; do not execute the separate duplicate Follow_up_Plan script.

USE cosmin_ionut_alexandru_g1420953;

-- Patients, clinicians, clinics
INSERT INTO Patient (Patient_ID, First_Name, Last_Name, Postcode) VALUES
('OP001', 'Amina', 'Yusuf', 'NE1 4AB'),
('OP002', 'Daniel', 'Reed', 'N16 7QP'),
('OP003', 'Sofia', 'Bennett', 'E8 2LD'),
('OP004', 'Michael', 'Okoro', 'SE6 3RT'),
('OP005', 'John', 'Doe', 'M1 1AA'),
('OP006', 'Jane', 'Smith', 'LS1 2BB'),
('OP007', 'Alice', 'Johnson', 'B1 3CC'),
('OP008', 'Bob', 'Williams', 'L1 4DD'),
('OP009', 'Charlie', 'Brown', 'NE2 5EE'),
('OP010', 'Diana', 'Evans', 'OX1 6FF'),
('OP011', 'Evan', 'Davies', 'CB1 7GG'),
('OP012', 'Fiona', 'Taylor', 'S1 8HH'),
('OP013', 'George', 'Thomas', 'NG1 9II'),
('OP014', 'Hannah', 'Roberts', 'M2 0JJ');

INSERT INTO Clinician (Clinician_ID, First_Name, Last_Name, Specialty) VALUES
('CL001', 'Maya', 'Shah', 'Glaucoma'),
('CL002', 'Leo', 'Grant', 'Retina'),
('CL003', 'Priya', 'Nair', 'Cornea'),
('CL004', 'Sarah', 'Jones', 'Cataract'),
('CL005', 'James', 'Smith', 'Paediatric'),
('CL006', 'Emma', 'Williams', 'Neuro-ophthalmology'),
('CL007', 'David', 'Brown', 'Oculoplastics'),
('CL008', 'Lisa', 'Taylor', 'Retina'),
('CL009', 'Mark', 'Davies', 'Glaucoma'),
('CL010', 'Anna', 'Evans', 'Cornea'),
('CL011', 'Paul', 'Thomas', 'Cataract'),
('CL012', 'Laura', 'Roberts', 'Paediatric'),
('CL013', 'John', 'White', 'Retina');

INSERT INTO Clinic (Clinic_ID, Clinic_Name) VALUES
('C001', 'City Road'),
('C002', 'Bedford'),
('C003', 'Croydon'),
('C004', 'Manchester Royal'),
('C005', 'Leeds General'),
('C006', 'Bristol Eye Hospital'),
('C007', 'Birmingham Central'),
('C008', 'Liverpool Ophthalmic'),
('C009', 'Newcastle Vision'),
('C010', 'Oxford Eye Centre'),
('C011', 'Cambridge Clinic'),
('C012', 'Sheffield Vision'),
('C013', 'Nottingham Eye');

-- Medicines, appointments, diagnoses
INSERT INTO Medicine (Medicine_ID, Medicine_Name) VALUES
('M001', 'Latanoprost'),
('M002', 'Timolol'),
('M003', 'Aflibercept'),
('M004', 'Sodium chloride drops'),
('M005', 'Bimatoprost'),
('M006', 'Dexamethasone'),
('M007', 'Prednisolone'),
('M008', 'Cyclopentolate'),
('M009', 'Tropicamide'),
('M010', 'Chloramphenicol'),
('M011', 'Dorzolamide'),
('M012', 'Brimonidine'),
('M013', 'Ranibizumab'),
('M014', 'Fluorometholone');

INSERT INTO Appointment
(Appointment_ID, Clinician_ID, Patient_ID, Clinic_ID, Appointment_Date, Appointment_Time, Note) VALUES
('A001', 'CL001', 'OP001', 'C001', '2026-10-05', '09:00:00', 'Review IOP'),
('A002', 'CL002', 'OP002', 'C001', '2026-10-05', '09:30:00', 'OCT before review'),
('A003', 'CL001', 'OP001', 'C002', '2026-11-16', '10:15:00', 'Visual field test'),
('A004', 'CL001', 'OP003', 'C001', '2026-10-06', '11:00:00', 'Monitor'),
('A005', 'CL003', 'OP004', 'C003', '2026-10-07', '14:00:00', 'Corneal topography'),
('A006', 'CL004', 'OP005', 'C004', '2026-10-08', '10:00:00', 'Cataract assessment'),
('A007', 'CL005', 'OP006', 'C005', '2026-10-09', '11:30:00', 'Routine eye check'),
('A008', 'CL006', 'OP007', 'C006', '2026-10-10', '13:00:00', 'Review symptoms'),
('A009', 'CL007', 'OP008', 'C007', '2026-10-11', '14:15:00', 'Eyelid review'),
('A010', 'CL008', 'OP009', 'C008', '2026-10-12', '15:30:00', 'Macular scan'),
('A011', 'CL009', 'OP010', 'C009', '2026-10-13', '09:45:00', 'IOP check'),
('A012', 'CL010', 'OP011', 'C010', '2026-10-14', '10:20:00', 'Dry eye clinic'),
('A013', 'CL011', 'OP012', 'C011', '2026-10-15', '11:45:00', 'Post-op assessment'),
('A014', 'CL012', 'OP013', 'C012', '2026-10-16', '12:30:00', 'Eye irritation review'),
('A015', 'CL013', 'OP014', 'C013', '2026-10-17', '16:00:00', 'Retinal scan');

INSERT INTO Diagnosis (Diagnosis_ID, Appointment_ID, Diagnosis_Name) VALUES
('D001', 'A001', 'Ocular hypertension'),
('D002', 'A002', 'Diabetic macular oedema'),
('D003', 'A003', 'Ocular hypertension'),
('D004', 'A004', 'Glaucoma suspect'),
('D005', 'A005', 'Keratoconus'),
('D006', 'A006', 'Age-related cataract'),
('D007', 'A007', 'Conjunctivitis'),
('D008', 'A008', 'Optic neuritis'),
('D009', 'A009', 'Blepharitis'),
('D010', 'A010', 'Macular degeneration'),
('D011', 'A011', 'Ocular hypertension'),
('D012', 'A012', 'Dry eye syndrome'),
('D013', 'A013', 'Postoperative inflammation'),
('D014', 'A014', 'Conjunctivitis'),
('D015', 'A015', 'Diabetic macular oedema');

-- Prescriptions, prescription items, follow-up plans
INSERT INTO Prescription (Prescription_ID, Appointment_ID) VALUES
('PR001', 'A001'),
('PR002', 'A002'),
('PR003', 'A003'),
('PR004', 'A005'),
('PR005', 'A006'),
('PR006', 'A007'),
('PR007', 'A008'),
('PR008', 'A009'),
('PR009', 'A010'),
('PR010', 'A011'),
('PR011', 'A012'),
('PR012', 'A013'),
('PR013', 'A014'),
('PR014', 'A015');

INSERT INTO Prescription_Item
(Prescription_Item_ID, Prescription_ID, Medicine_ID, Dose, Route, Frequency, Duration) VALUES
('PI001', 'PR001', 'M001', NULL, NULL, NULL, NULL),
('PI002', 'PR001', 'M002', NULL, NULL, NULL, NULL),
('PI003', 'PR002', 'M003', NULL, NULL, NULL, NULL),
('PI004', 'PR003', 'M001', NULL, NULL, NULL, NULL),
('PI005', 'PR004', 'M004', NULL, NULL, NULL, NULL),
('PI006', 'PR005', 'M006', 'Example dose', 'Eye drops', 'As directed', '7 days'),
('PI007', 'PR006', 'M010', 'Example dose', 'Eye drops', 'As directed', '5 days'),
('PI008', 'PR007', 'M007', 'Example dose', 'Oral', 'As directed', '7 days'),
('PI009', 'PR008', 'M010', 'Example dose', 'Eye drops', 'As directed', '5 days'),
('PI010', 'PR009', 'M013', 'Example dose', 'Intravitreal', 'As directed', '1 visit'),
('PI011', 'PR010', 'M005', 'Example dose', 'Eye drops', 'As directed', 'Ongoing'),
('PI012', 'PR011', 'M014', 'Example dose', 'Eye drops', 'As directed', '7 days'),
('PI013', 'PR012', 'M006', 'Example dose', 'Eye drops', 'As directed', '7 days'),
('PI014', 'PR013', 'M010', 'Example dose', 'Eye drops', 'As directed', '5 days'),
('PI015', 'PR014', 'M003', 'Example dose', 'Intravitreal', 'As directed', '1 visit');


INSERT INTO Follow_Up_Plan (Follow_Up_ID, Appointment_ID, Due_Date, Priority, Status) VALUES
('FU001', 'A001', '2026-11-16', 'High', 'Pending'),
('FU002', 'A002', '2026-11-02', 'Urgent', 'Pending'),
('FU003', 'A003', '2027-02-08', 'Routine', 'Pending'),
('FU004', 'A004', '2027-04-06', 'Routine', 'Pending'),
('FU005', 'A005', '2026-12-02', 'Routine', 'Pending'),
('FU006', 'A006', '2026-10-22', 'Routine', 'Completed'),
('FU007', 'A007', '2026-10-23', 'Routine', 'Pending'),
('FU008', 'A008', '2026-10-24', 'High', 'Pending'),
('FU009', 'A009', '2026-10-25', 'Routine', 'Completed'),
('FU010', 'A010', '2026-11-09', 'Urgent', 'Pending'),
('FU011', 'A011', '2026-11-10', 'High', 'Pending'),
('FU012', 'A012', '2026-11-11', 'Routine', 'Pending'),
('FU013', 'A013', '2026-11-12', 'Routine', 'Completed'),
('FU014', 'A014', '2026-11-13', 'Routine', 'Pending'),
('FU015', 'A015', '2026-11-14', 'Urgent', 'Pending');
