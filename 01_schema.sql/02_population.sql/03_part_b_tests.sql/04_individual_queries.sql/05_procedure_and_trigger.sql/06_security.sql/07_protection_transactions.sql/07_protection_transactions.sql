-- Crownfield Eye Hospital coursework: Part D2 and transaction demonstration
-- IMPORTANT: THIS FILE HAS NOT BEEN EXECUTED OR VERIFIED.
-- DO NOT RUN IT WHILE THE MARIA DB SYSTEM TABLE ERROR / CORRUPTION REMAINS UNRESOLVED.
-- Intended only for use after the server is repaired and the relevant data is backed up.
-- All examples use fictional data in a SEPARATE demonstration database.
-- They do not change the Crownfield hospital database.

-- ==============================================================
-- PART D2: Protect a fictional sensitive access code with a hash
-- ==============================================================

CREATE DATABASE IF NOT EXISTS crownfield_part_d_demo;
USE crownfield_part_d_demo;

CREATE TABLE IF NOT EXISTS Protected_Access_Code_Demo (
    Example_ID INT PRIMARY KEY,
    Access_Code_Hash CHAR(64) NOT NULL
) ENGINE=InnoDB;

-- Store the SHA-256 hash, not the original fictional access code.
INSERT INTO Protected_Access_Code_Demo (Example_ID, Access_Code_Hash)
VALUES (1, SHA2('FICTIONAL-ACCESS-CODE-123', 256))
ON DUPLICATE KEY UPDATE Access_Code_Hash = VALUES(Access_Code_Hash);

SELECT Example_ID, Access_Code_Hash
FROM Protected_Access_Code_Demo;

-- NOTE: SHA2 is a simple coursework example of one-way hashing.
-- It is NOT suitable by itself for storing real user passwords.
-- For real passwords, use a purpose-built password hashing method
-- (e.g., Argon2id) in the application. Data that must be read back
-- requires suitable encryption rather than one-way hashing.

-- ==============================================================
-- TRANSACTION TEST 1: ROLLBACK undoes an uncommitted INSERT
-- ==============================================================

CREATE TABLE IF NOT EXISTS Transaction_Demo (
    Demo_ID VARCHAR(20) PRIMARY KEY,
    Description VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Run the transaction tests only once in a fresh demonstration database.
START TRANSACTION;

INSERT INTO Transaction_Demo (Demo_ID, Description)
VALUES ('ROLLBACK-01', 'Temporary row that will be rolled back');

SELECT * FROM Transaction_Demo WHERE Demo_ID = 'ROLLBACK-01';

ROLLBACK;

-- Expect no row after the rollback.
SELECT * FROM Transaction_Demo WHERE Demo_ID = 'ROLLBACK-01';

-- ==============================================================
-- TRANSACTION TEST 2: COMMIT saves an INSERT
-- ==============================================================

START TRANSACTION;

INSERT INTO Transaction_Demo (Demo_ID, Description)
VALUES ('COMMIT-01', 'Row that will be committed');

COMMIT;

-- Expect one row after the commit.
SELECT * FROM Transaction_Demo WHERE Demo_ID = 'COMMIT-01';

-- REPORTING NOTE: Include actual results/screenshots only if these
-- statements are executed successfully after the database is repaired.
-- Otherwise state that the proposed tests could not be run because of
-- the MariaDB corruption issue. Do not claim they were verified.
