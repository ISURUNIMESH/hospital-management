CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

-- =========================
-- PATIENTS TABLE
-- =========================
CREATE TABLE IF NOT EXISTS patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    disease VARCHAR(150) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- DOCTORS TABLE
-- =========================
CREATE TABLE IF NOT EXISTS doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    experience VARCHAR(50),
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample doctors (used in your dropdown list)
INSERT INTO doctors (name, specialization, experience, phone) VALUES
('Dr. Kamal Perera', 'Cardiologist', '10+ years', '0712345678'),
('Dr. Nirosha Silva', 'Neurologist', '8+ years', '0723456789'),
('Dr. Ravi Fernando', 'Dentist', '7+ years', '0771234567');

-- =========================
-- APPOINTMENTS TABLE
-- =========================
CREATE TABLE IF NOT EXISTS appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_name VARCHAR(100),
    phone VARCHAR(15),
    doctor VARCHAR(100),
    appointment_date DATE,
    problem TEXT,
    status VARCHAR(20) DEFAULT 'Pending
);
