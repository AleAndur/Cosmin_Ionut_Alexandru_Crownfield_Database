use cosmin_ionut_alexandru_g1420953;
create table Patient(
Patient_ID VARCHAR(10) PRIMARY KEY,
First_name VARCHAR(50) NOT NULL,
Last_name VARCHAR(50) 	NOT NULL,
Postcode VARCHAR(10)
);

CREATE TABLE Clinician (
Clinician_ID VARCHAR(10) PRIMARY KEY,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL,
Specialty VARCHAR(50) NOT NULL
);

CREATE TABLE Clinic (
Clinic_ID VARCHAR(10) PRIMARY KEY,
Clinic_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE MEDICINE (
Medicine_ID VARCHAR(10) PRIMARY KEY,
Medicine_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Appointment (
Appointment_ID VARCHAR(10) PRIMARY KEY,
Clinician_ID VARCHAR(10) NOT NULL,
Patient_ID VARCHAR(10) NOT NULL,
Clinic_ID VARCHAR(10) NOT NULL,
Appointment_Date Date NOT NULL,
Appointment_Time TIME NOT NULL,
Note VARCHAR(255),
FOREIGN KEY (Clinician_ID) REFERENCES Clinician(clinician_ID),
FOREIGN KEY (PATIENT_ID) REFERENCES Patient(patient_ID), 
FOREIGN KEY (CLINIC_ID) REFERENCES Clinic(Clinic_ID)
);


CREATE TABLE Diagnosis (
Diagnosis_ID VARCHAR(10) PRIMARY KEY,
Appointment_ID VARCHAR(10) NOT NULL,
Diagnosis_Name VARCHAR(100) NOT NULL,
Foreign KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID)
);

CREATE TABLE Prescription (
Prescription_ID VARCHAR(10) PRIMARY KEY,
Appointment_ID VARCHAR(10) NOT NULL,
FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID)
);
 
CREATE TABLE Prescription_Item (
Prescription_Item_ID VARCHAR(10) PRIMARY KEY,
Prescription_ID VARCHAR(10) NOT NULL,
Medicine_ID VARCHAR(10) NOT NULL,
Dose VARCHAR(50),
Route VARCHAR(50),
Frequency VARCHAR(50),
Duration VARCHAR(50),
FOREIGN KEY (Prescription_ID) REFERENCES Prescription(Prescription_ID),
FOREIGN KEY (Medicine_ID) REFERENCES MEDICINE(Medicine_ID)
);

CREATE TABLE Follow_Up_Plan (
Follow_Up_ID VARCHAR(10) PRIMARY KEY,
Appointment_ID VARCHAR(10) NOT NULL UNIQUE,
Due_Date date NOT NULL,
Priority VARCHAR(20) NOT NULL,
Status VARCHAR(20) NOT NULL DEFAULT 'Pending',
FOREIGN Key (Appointment_ID) REFERENCES Appointment(Appointment_ID),
CHECK (PRIORITY IN ('Routine', 'High', 'Urgent'))
);
