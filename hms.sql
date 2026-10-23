-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2023 at 07:25 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_group_name`
--

CREATE TABLE `bill_group_name` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_desc` text NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_group_name`
--

INSERT INTO `bill_group_name` (`group_id`, `group_name`, `group_desc`, `InActive`) VALUES
(1, 'CARE SERVICES', 'Care Services', 0),
(2, 'CONSULTATION & PROFESSIONAL FEES', 'Consultation & Professional Fees', 0),
(3, 'DIAGNOSTIC IMAGING', 'Diagnostic Imaging', 0),
(4, 'GENERAL PROCEDURES & SURGERY', 'General Procedures & Surgery', 0),
(5, 'HEALTH CHECK PACKAGES', 'Health Check Packages', 0),
(6, 'INPATIENT & CLINICAL SUPPORT', 'Inpatient & Clinical Support', 0),
(7, 'INPATIENT SERVICES', 'Inpatient Services', 0),
(8, 'LABORATORY', 'Laboratory', 0),
(9, 'OPHTHALMOLOGY', 'Ophthalmology', 0),
(10, 'MISCELLANEOUS', 'Miscellaneous', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill_particular`
--

CREATE TABLE `bill_particular` (
  `particular_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `particular_name` varchar(150) NOT NULL,
  `particular_desc` text NOT NULL,
  `charge_amount` float(11,2) NOT NULL,
  `InActive` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_particular`
--

INSERT INTO `bill_particular` (`particular_id`, `group_id`, `particular_name`, `particular_desc`, `charge_amount`, `InActive`) VALUES
(1, 1, 'Home Care visit', 'Home Care', 250, 0),
(2, 2, 'Consultation General', 'Consultation', 10, 0),
(3, 2, 'Consultation specialize (on call)', 'Consultation', 35, 0),
(4, 2, 'Doctor and Nursing fee (Emergency)', 'Doctor / Nursing Fee - Emergency', 450, 0),
(5, 2, 'Doctor and Nursing fee (Normal)', 'Doctor / Nursing Fee - Normal', 30, 0),
(6, 2, 'Doctor and Nursing fee (VIP)', 'Doctor / Nursing Fee - VIP', 50, 0),
(7, 3, 'Echo abdomen', 'Ultrasound / X-ray', 12.5, 0),
(8, 3, 'Echo abdomen by specialist doctor', 'Ultrasound / X-ray', 20, 0),
(9, 3, 'Echo Cardio (On call)', 'Ultrasound / X-ray', 25, 0),
(10, 3, 'X-ray', 'Ultrasound / X-ray', 15, 0),
(11, 4, 'Abscess incision and drainage', 'Procedure / Minor Surgery', 100, 0),
(12, 4, 'Botox injection', 'Procedure / Minor Surgery', 200, 0),
(13, 4, 'Small Surgery', 'Procedure / Minor Surgery', 0, 0),
(14, 5, 'Health check up (Economic)', 'Health Check Package', 38, 0),
(15, 5, 'Health check up (General)', 'Health Check Package', 67, 0),
(16, 5, 'Health check up (Woman/ Man)', 'Health Check Package', 76, 0),
(17, 6, 'Oxygen', 'Oxygen', 0, 0),
(18, 7, 'Meals', 'Meals', 3, 0),
(19, 7, 'Room Emergency', 'Room / Bed Charge', 120, 0),
(20, 7, 'Room fee 101 (Four beds)', 'Room / Bed Charge', 20, 0),
(21, 7, 'Room fee 104', 'Room / Bed Charge', 30, 0),
(22, 7, 'Room fee 105', 'Room / Bed Charge', 25, 0),
(23, 7, 'Room fee 107', 'Room / Bed Charge', 25, 0),
(24, 7, 'Room fee 108', 'Room / Bed Charge', 25, 0),
(25, 7, 'Short Stay/Hour', 'Short Stay', 3, 0),
(26, 8, 'Rida Allergy Panel 1+3+4', 'Allergy / Immunology', 207, 0),
(27, 8, 'Spermogramme', 'Andrology', 18.4, 0),
(28, 8, 'ANA 12 Profile', 'Autoimmune / Immunology', 89.13, 0),
(29, 8, 'ANA 23 Profile', 'Autoimmune / Immunology', 126.5, 0),
(30, 8, 'ANA Test', 'Autoimmune / Immunology', 19.55, 0),
(31, 8, 'Anti CCP', 'Autoimmune / Immunology', 23, 0),
(32, 8, 'Anti-ds DNA', 'Autoimmune / Immunology', 48.88, 0),
(33, 8, 'Rheumatoid Factor', 'Autoimmune / Immunology', 2.01, 0),
(34, 8, 'Acide Urique', 'Biochemistry', 1.55, 0),
(35, 8, 'Albumin', 'Biochemistry', 1.55, 0),
(36, 8, 'Amylase', 'Biochemistry', 3.45, 0),
(37, 8, 'Protein, Total', 'Biochemistry', 2.3, 0),
(38, 8, 'Glucose/Glycemie', 'Biochemistry / Diabetes', 1.55, 0),
(39, 8, 'HbA1c(EDTA TUBE)', 'Biochemistry / Diabetes', 11.5, 0),
(40, 8, 'Bicarbonates', 'Biochemistry / Electrolytes', 7.48, 0),
(41, 8, 'Bicarbonates', 'Biochemistry / Electrolytes', 6.5, 0),
(42, 8, 'Calcium', 'Biochemistry / Electrolytes', 1.55, 0),
(43, 8, 'Ionogramme (Na, K, Cl)', 'Biochemistry / Electrolytes', 5.75, 0),
(44, 8, 'Ionogramme (Na+, K+, Cl-)', 'Biochemistry / Electrolytes', 5, 0),
(45, 8, 'Magnesium', 'Biochemistry / Electrolytes', 2.7, 0),
(46, 8, 'Phosphorus', 'Biochemistry / Electrolytes', 3.39, 0),
(47, 8, 'CPK', 'Biochemistry / Enzyme', 5.75, 0),
(48, 8, 'LDH', 'Biochemistry / Enzyme', 2.88, 0),
(49, 8, 'Lipase', 'Biochemistry / Enzyme', 18.69, 0),
(50, 8, 'Bilirubin T, D & I', 'Biochemistry / Liver', 3.16, 0),
(51, 8, 'GGT', 'Biochemistry / Liver', 2.01, 0),
(52, 8, 'PAL', 'Biochemistry / Liver', 3.45, 0),
(53, 8, 'Transa', 'Biochemistry / Liver', 2.88, 0),
(54, 8, 'CPK-MB', 'Cardiac Marker', 11.5, 0),
(55, 8, 'NT-ProBNP', 'Cardiac Marker', 54.63, 0),
(56, 8, 'Troponin I', 'Cardiac Marker', 23, 0),
(57, 8, 'APTT / TCA', 'Coagulation', 6.33, 0),
(58, 8, 'D-Dimer', 'Coagulation', 44.85, 0),
(59, 8, 'Fibrinogen', 'Coagulation', 14.38, 0),
(60, 8, 'PT/INR', 'Coagulation', 4.6, 0),
(61, 8, 'Cytology', 'Cytology', 13.8, 0),
(62, 8, 'H.I.V 1/ 2 (Centaur)', 'HIV / Serology', 13.8, 0),
(63, 8, 'H.I.V 1/2 (ELISA)', 'HIV / Serology', 5.18, 0),
(64, 8, 'HPV 16/18 Ag', 'HPV / Serology', 48.88, 0),
(65, 8, 'Hb Electrophoresis (EDTA)', 'Hematology', 36.8, 0),
(66, 8, 'Reticulocyte Count', 'Hematology', 2.88, 0),
(67, 8, 'ABO GROUP + Rh', 'Hematology / Blood Group', 2.3, 0),
(68, 8, 'Hg/CBC', 'Hematology / CBC', 3.16, 0),
(69, 8, 'Protein Electrophoresis', 'Hematology / Protein', 31.05, 0),
(70, 8, 'Ag HBe (Centaur)', 'Hepatitis / Serology', 11.5, 0),
(71, 8, 'Ag HBs (Centaur)', 'Hepatitis / Serology', 11.5, 0),
(72, 8, 'Ag HBs (ELISA)', 'Hepatitis / Serology', 4.03, 0),
(73, 8, 'Ag HBs UI/ml (Quanti)', 'Hepatitis / Serology', 40.25, 0),
(74, 8, 'Anti-HAV IgM (Centaur)', 'Hepatitis / Serology', 12.94, 0),
(75, 8, 'Anti-HAV Total (Centaur)', 'Hepatitis / Serology', 12.94, 0),
(76, 8, 'Anti-HBc IgM (Centaur)', 'Hepatitis / Serology', 18.4, 0),
(77, 8, 'Anti-HBc Total (ELISA)', 'Hepatitis / Serology', 11.5, 0),
(78, 8, 'Anti-HBe (Centaur)', 'Hepatitis / Serology', 11.5, 0),
(79, 8, 'Anti-HBs (ELISA)', 'Hepatitis / Serology', 5.18, 0),
(80, 8, 'Anti-HBs (Quanti)(Centaur)', 'Hepatitis / Serology', 11.5, 0),
(81, 8, 'Anti-HCV (Centaur)', 'Hepatitis / Serology', 13.8, 0),
(82, 8, 'Anti-HCV (ELISA)', 'Hepatitis / Serology', 5.75, 0),
(83, 8, 'Cortisol (8H AM)', 'Hormone', 17.25, 0),
(84, 8, 'Beta-HCG', 'Hormone / Pregnancy', 20.7, 0),
(85, 8, 'FSH', 'Hormone / Reproductive', 18.4, 0),
(86, 8, 'LH', 'Hormone / Reproductive', 18.4, 0),
(87, 8, 'Progesterone', 'Hormone / Reproductive', 18.4, 0),
(88, 8, 'Prolactine', 'Hormone / Reproductive', 18.4, 0),
(89, 8, 'Testosterone', 'Hormone / Reproductive', 23, 0),
(90, 8, 'IgE', 'Immunology', 12.65, 0),
(91, 8, 'IgG', 'Immunology', 23, 0),
(92, 8, 'CD4', 'Immunology / HIV Monitoring', 18.4, 0),
(93, 8, 'CD4/CD8', 'Immunology / HIV Monitoring', 45.43, 0),
(94, 8, 'ASLO', 'Immunology / Serology', 2.01, 0),
(95, 8, 'Procalcitonin', 'Infection / Inflammation', 40.25, 0),
(96, 8, 'Dengue Duo', 'Infectious Disease / Dengue', 23, 0),
(97, 8, 'Dengue IgM+IgG', 'Infectious Disease / Dengue', 14.38, 0),
(98, 8, 'Dengue NS1 Ag', 'Infectious Disease / Dengue', 14.38, 0),
(99, 8, 'H.Pylori Antigen (stool)', 'Infectious Disease / H. pylori', 23, 0),
(100, 8, 'H.pylori IgG', 'Infectious Disease / H. pylori', 5.75, 0),
(101, 8, 'H.pylori IgM', 'Infectious Disease / H. pylori', 5.75, 0),
(102, 8, 'Malaria(sero+smear)', 'Infectious Disease / Malaria', 4.6, 0),
(103, 8, 'Influenza-A & B', 'Infectious Disease / Respiratory', 19.55, 0),
(104, 8, 'Strep A Antigen', 'Infectious Disease / Respiratory', 19.55, 0),
(105, 8, 'Syphilis RPR', 'Infectious Disease / STI', 5.75, 0),
(106, 8, 'Syphilis TPHA', 'Infectious Disease / STI', 5.75, 0),
(107, 8, 'Chikungunya IgM', 'Infectious Disease / Serology', 20.13, 0),
(108, 8, 'Rubella IgM+IgG', 'Infectious Disease / Serology', 29.9, 0),
(109, 8, 'Toxoplasma IgM+IgG', 'Infectious Disease / Serology', 31.63, 0),
(110, 8, 'Varicella IgM+IgG', 'Infectious Disease / Serology', 48.3, 0),
(111, 8, 'Typhoid IgM+IgG', 'Infectious Disease / Typhoid', 13.8, 0),
(112, 8, 'Widal', 'Infectious Disease / Typhoid', 1.44, 0),
(113, 8, 'CRP (quantitative)', 'Inflammation', 6.33, 0),
(114, 8, 'VS/ESR', 'Inflammation', 1.15, 0),
(115, 8, 'Fer sérique / Serum Iron', 'Iron Studies', 2.01, 0),
(116, 8, 'Ferritin', 'Iron Studies', 11.5, 0),
(117, 8, 'TIBC', 'Iron Studies', 10.35, 0),
(118, 8, 'Cholesterol, HDL', 'Lipid Profile', 2.3, 0),
(119, 8, 'Cholesterol, LDL', 'Lipid Profile', 1.73, 0),
(120, 8, 'Cholesterol, Total', 'Lipid Profile', 1.55, 0),
(121, 8, 'Triglyceride', 'Lipid Profile', 1.73, 0),
(122, 8, 'Culture(Stool/Pus/Uro/Blood)', 'Microbiology / Culture', 34.5, 0),
(123, 8, 'BK /Wet smear (sputum)', 'Microbiology / Respiratory', 8.63, 0),
(124, 8, 'HPV DNA PCR', 'Molecular / HPV', 63.25, 0),
(125, 8, 'HPV DNA PCR+GENOTYPE', 'Molecular / HPV', 97.75, 0),
(126, 8, 'HBV Genotype', 'Molecular / Hepatitis', 80.5, 0),
(127, 8, 'HCV Genotype', 'Molecular / Hepatitis', 92, 0),
(128, 8, 'PCR HBV DNA (Qiagen )', 'Molecular / Hepatitis', 51.75, 0),
(129, 8, 'PCR HBV DNA (Roche)', 'Molecular / Hepatitis', 143.75, 0),
(130, 8, 'PCR HCV RNA (Qiagen)', 'Molecular / Hepatitis', 75.9, 0),
(131, 8, 'PCR HCV RNA (Roche)', 'Molecular / Hepatitis', 143.75, 0),
(132, 8, 'MTB-Gene-Expert', 'Molecular / Tuberculosis', 51.75, 0),
(133, 8, 'Amoebiasis', 'Parasitology / Serology', 11.5, 0),
(134, 8, 'Creatinine', 'Renal / Biochemistry', 1.73, 0),
(135, 8, 'Urée sanguine / Blood Urea', 'Renal / Biochemistry', 1.73, 0),
(136, 8, 'Creatinine 24h', 'Renal / Urine', 4.6, 0),
(137, 8, 'Creatinine Clearance', 'Renal / Urine', 3.45, 0),
(138, 8, 'Creatinine urine', 'Renal / Urine', 4.6, 0),
(139, 8, 'Microalbuminurie', 'Renal / Urine', 11.5, 0),
(140, 8, 'Protein (Quantitative)24h', 'Renal / Urine', 5.75, 0),
(141, 8, 'Urea 24h', 'Renal / Urine', 3.45, 0),
(142, 8, 'Urea in urine', 'Renal / Urine', 3.45, 0),
(143, 8, 'Occult Blood', 'Stool / Gastrointestinal', 11.5, 0),
(144, 8, 'Stool Exam', 'Stool / Parasitology', 5.75, 0),
(145, 8, 'TRAb', 'Thyroid / Autoimmune', 29.9, 0),
(146, 8, 'Anti-TG', 'Thyroid / Hormone', 25.3, 0),
(147, 8, 'fT3', 'Thyroid / Hormone', 8.63, 0),
(148, 8, 'fT4', 'Thyroid / Hormone', 8.63, 0),
(149, 8, 'T3', 'Thyroid / Hormone', 20.13, 0),
(150, 8, 'T4', 'Thyroid / Hormone', 20.13, 0),
(151, 8, 'Thyroglo', 'Thyroid / Hormone', 25.3, 0),
(152, 8, 'TSH', 'Thyroid / Hormone', 9.2, 0),
(153, 8, 'Amphetamine', 'Toxicology / Drug Screen', 6.9, 0),
(154, 8, 'Methamphetamine', 'Toxicology / Drug Screen', 8.05, 0),
(155, 8, 'Morphine', 'Toxicology / Drug Screen', 8.05, 0),
(156, 8, 'BK (M. tuberculosis) IgG', 'Tuberculosis / Serology', 11.5, 0),
(157, 8, 'BK (M. tuberculosis) IgM', 'Tuberculosis / Serology', 11.5, 0),
(158, 8, 'AFP', 'Tumor Marker', 11.5, 0),
(159, 8, 'CA 125', 'Tumor Marker', 17.25, 0),
(160, 8, 'CA 15-3', 'Tumor Marker', 18.4, 0),
(161, 8, 'CA 19-9', 'Tumor Marker', 17.25, 0),
(162, 8, 'CA 72-4', 'Tumor Marker', 28.75, 0),
(163, 8, 'CEA', 'Tumor Marker', 14.38, 0),
(164, 8, 'CYFRA 21-1', 'Tumor Marker', 25.3, 0),
(165, 8, 'SCC', 'Tumor Marker', 25.3, 0),
(166, 8, 'PSA Free', 'Tumor Marker / Prostate', 20.7, 0),
(167, 8, 'PSA Total', 'Tumor Marker / Prostate', 14.95, 0),
(168, 8, 'Urine Analysis 11 Test', 'Urinalysis', 6.33, 0),
(169, 8, 'Alb/ Sucre /Cytology', 'Urine / Cytology', 4.6, 0),
(170, 8, 'Vitamine B12', 'Vitamins', 25.88, 0),
(171, 8, 'Vitamine B9 (Folic acid)', 'Vitamins', 24.15, 0),
(172, 8, 'Vitamine D', 'Vitamins', 40.25, 0),
(173, 9, 'Eye consultation (on call)', 'Consultation / Ophthalmology', 20, 0),
(174, 9, 'Cyclo-refraction', 'Eye Examination', 15, 0),
(175, 9, 'Fundus examination', 'Eye Examination', 10, 0),
(176, 9, 'Subjective refraction', 'Eye Examination', 5, 0),
(177, 9, 'Clean eye', 'Minor Procedure / Ophthalmology', 3, 0),
(178, 9, 'Eye irrigation', 'Minor Procedure / Ophthalmology', 5, 0),
(179, 9, 'Remove foreign body', 'Minor Procedure / Ophthalmology', 10, 0),
(180, 9, 'Sac wash out (SWO)', 'Minor Procedure / Ophthalmology', 10, 0),
(181, 9, 'Intravitreal Avastin Injection', 'Ophthalmic Procedure / Injection', 200, 0),
(182, 9, 'Triamcinolone injection', 'Ophthalmic Procedure / Injection', 50, 0),
(183, 9, 'Chalazion/stye incision', 'Ophthalmic Procedure / Surgery', 40, 0),
(184, 9, 'Nevus excision', 'Ophthalmic Procedure / Surgery', 150, 0),
(185, 9, 'Probing', 'Ophthalmic Procedure / Surgery', 150, 0),
(186, 9, 'Blepharoplasty', 'Ophthalmic Surgery', 500, 0),
(187, 9, 'Epiblepharon repair', 'Ophthalmic Surgery', 500, 0),
(188, 9, 'Lid tumor removal', 'Ophthalmic Surgery', 300, 0),
(189, 9, 'Ptosis correction', 'Ophthalmic Surgery', 500, 0),
(190, 9, 'Squint surgery', 'Ophthalmic Surgery', 500, 0),
(191, 10, 'Other Income', 'Other Income', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('aaaa522c1e39d873bdea9947c8f66ce1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1403771284, '');

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

CREATE TABLE `company_info` (
  `company_name` varchar(150) NOT NULL,
  `company_address` text NOT NULL,
  `company_contactNo` varchar(50) NOT NULL,
  `TIN` varchar(50) NOT NULL,
  `logo` varchar(900) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`company_name`, `company_address`, `company_contactNo`, `TIN`, `logo`) VALUES
('CamCare Clinic', '#HA177, BD05, HA173, HA175, NB Street, Khan Chroy Changva, Songkat Bak Kheng (Borey Golden Park, Bridge 9), Phnom Penh, Cambodia', '099 8000 68 / 096 2 8000 68', 'K008-902304727', 'camcare-color-favicon.png');

-- --------------------------------------------------------

--
-- Table structure for table `complain`
--

CREATE TABLE `complain` (
  `complain_id` int(11) NOT NULL,
  `complain_name` varchar(999) NOT NULL,
  `complain_desc` text NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complain`
--

INSERT INTO `complain` (`complain_id`, `complain_name`, `complain_desc`, `InActive`) VALUES
(1, 'ABDOMINAL PAIN', 'Abdominal pain', 0),
(2, 'PELVIC PAIN', 'Pelvic pain', 0),
(3, 'CHEST PAIN', 'Chest pain or discomfort', 0),
(4, 'BACK PAIN', 'Back pain', 0),
(5, 'NECK PAIN', 'Neck pain', 0),
(6, 'HEADACHE', 'Headache', 0),
(7, 'DIZZINESS', 'Dizziness or lightheadedness', 0),
(8, 'VERTIGO', 'Sensation of spinning or movement', 0),
(9, 'FAINTING OR SYNCOPE', 'Fainting or temporary loss of consciousness', 0),
(10, 'FEVER', 'Fever or feeling feverish', 0),
(11, 'CHILLS', 'Chills or shivering', 0),
(12, 'COUGH', 'Cough', 0),
(13, 'SHORTNESS OF BREATH', 'Shortness of breath or difficulty breathing', 0),
(14, 'WHEEZING', 'Wheezing or whistling breathing sound', 0),
(15, 'SORE THROAT', 'Sore throat', 0),
(16, 'RUNNY NOSE', 'Runny nose', 0),
(17, 'NASAL CONGESTION', 'Blocked or congested nose', 0),
(18, 'SNEEZING', 'Sneezing', 0),
(19, 'EAR PAIN', 'Ear pain or otalgia', 0),
(20, 'EAR DISCHARGE', 'Discharge from the ear', 0),
(21, 'HEARING LOSS', 'Reduced or lost hearing', 0),
(22, 'TINNITUS', 'Ringing or noise in the ears', 0),
(23, 'EYE PAIN', 'Eye pain or discomfort', 0),
(24, 'RED EYE', 'Redness of one or both eyes', 0),
(25, 'BLURRED VISION', 'Blurred or unclear vision', 0),
(26, 'VISION LOSS', 'Partial or complete loss of vision', 0),
(27, 'EYE DISCHARGE', 'Discharge from one or both eyes', 0),
(28, 'NAUSEA', 'Feeling sick or nauseated', 0),
(29, 'VOMITING', 'Vomiting', 0),
(30, 'DIARRHEA', 'Loose or frequent stools', 0),
(31, 'CONSTIPATION', 'Difficulty passing stool or infrequent bowel movements', 0),
(32, 'DIFFICULTY SWALLOWING', 'Difficulty swallowing or dysphagia', 0),
(33, 'HEARTBURN OR ACID REFLUX', 'Burning sensation in the chest or acid reflux symptoms', 0),
(34, 'BLOATING', 'Abdominal bloating or fullness', 0),
(35, 'LOSS OF APPETITE', 'Reduced desire to eat', 0),
(36, 'RECTAL BLEEDING', 'Bleeding from the rectum', 0),
(37, 'BLACK OR TARRY STOOL', 'Black or tarry stool', 0),
(38, 'JAUNDICE', 'Yellowing of the skin or eyes', 0),
(39, 'BLOOD IN URINE', 'Visible blood in the urine or hematuria', 0),
(40, 'PAINFUL URINATION', 'Pain or burning during urination', 0),
(41, 'FREQUENT URINATION', 'Urinating more often than usual', 0),
(42, 'URGENT URINATION', 'Sudden strong need to urinate', 0),
(43, 'DIFFICULTY URINATING', 'Difficulty starting or maintaining urination', 0),
(44, 'FLANK PAIN', 'Pain in the side or flank area', 0),
(45, 'URINARY INCONTINENCE', 'Involuntary leakage of urine', 0),
(46, 'GENITAL DISCHARGE', 'Unusual genital discharge', 0),
(47, 'GENITAL SORE OR ULCER', 'Sore, ulcer, or lesion in the genital area', 0),
(48, 'SCROTAL PAIN OR SWELLING', 'Pain or swelling of the scrotum', 0),
(49, 'BREAST PAIN', 'Breast pain or tenderness', 0),
(50, 'BREAST LUMP', 'Lump or mass in the breast', 0),
(51, 'VAGINAL BLEEDING', 'Vaginal bleeding outside the expected pattern', 0),
(52, 'HEAVY MENSTRUAL BLEEDING', 'Menstrual bleeding that is heavier than usual', 0),
(53, 'PAINFUL MENSTRUATION', 'Pain associated with menstruation', 0),
(54, 'MISSED OR ABSENT PERIOD', 'Missed or absent menstrual period', 0),
(55, 'VAGINAL DISCHARGE', 'Vaginal discharge or change in discharge', 0),
(56, 'PREGNANCY CONCERN', 'Concern related to possible or confirmed pregnancy', 0),
(57, 'PREGNANCY-RELATED VOMITING', 'Nausea or vomiting during pregnancy', 0),
(58, 'LABOR PAIN OR CONTRACTIONS', 'Labor pain or uterine contractions', 0),
(59, 'POSTPARTUM CONCERN', 'Concern arising after childbirth', 0),
(60, 'JOINT PAIN', 'Pain in one or more joints', 0),
(61, 'MUSCLE PAIN', 'Muscle pain or myalgia', 0),
(62, 'LIMB PAIN', 'Pain in an arm or leg', 0),
(63, 'SHOULDER PAIN', 'Shoulder pain', 0),
(64, 'KNEE PAIN', 'Knee pain', 0),
(65, 'HIP PAIN', 'Hip pain', 0),
(66, 'FOOT OR ANKLE PAIN', 'Pain in the foot or ankle', 0),
(67, 'HAND OR WRIST PAIN', 'Pain in the hand or wrist', 0),
(68, 'SWOLLEN JOINT', 'Swelling of one or more joints', 0),
(69, 'MUSCLE CRAMPS', 'Muscle cramps or spasms', 0),
(70, 'NUMBNESS OR TINGLING', 'Numbness, pins and needles, or tingling sensation', 0),
(71, 'WEAKNESS', 'General or localized weakness', 0),
(72, 'FATIGUE', 'Tiredness or lack of energy', 0),
(73, 'GENERAL MALAISE', 'General feeling of being unwell', 0),
(74, 'WEIGHT LOSS', 'Unintentional weight loss', 0),
(75, 'WEIGHT GAIN', 'Unexplained or unwanted weight gain', 0),
(76, 'LOSS OF CONSCIOUSNESS', 'Loss of consciousness', 0),
(77, 'CONFUSION', 'New or ongoing confusion', 0),
(78, 'MEMORY PROBLEM', 'Memory difficulty or memory loss', 0),
(79, 'SEIZURE OR CONVULSION', 'Seizure or convulsive episode', 0),
(80, 'TREMOR', 'Involuntary shaking or trembling', 0),
(81, 'DIFFICULTY WALKING', 'Difficulty walking or change in gait', 0),
(82, 'UNSTEADY GAIT', 'Unsteadiness while standing or walking', 0),
(83, 'ANXIETY OR WORRY', 'Anxiety, excessive worry, or nervousness', 0),
(84, 'LOW MOOD OR SADNESS', 'Low mood or persistent sadness', 0),
(85, 'SLEEP DIFFICULTY', 'Difficulty falling asleep or staying asleep', 0),
(86, 'IRRITABILITY', 'Increased irritability or agitation', 0),
(87, 'RASH', 'New rash or skin eruption', 0),
(88, 'ITCHING', 'Itching or pruritus', 0),
(89, 'SKIN LESION OR SORE', 'Skin lesion, sore, or ulcer', 0),
(90, 'SKIN SWELLING OR LUMP', 'Lump or localized swelling under or on the skin', 0),
(91, 'SKIN COLOR CHANGE', 'Change in skin color', 0),
(92, 'HAIR LOSS', 'Hair loss or thinning', 0),
(93, 'EXCESSIVE SWEATING', 'Sweating more than usual', 0),
(94, 'NIGHT SWEATS', 'Excessive sweating during sleep', 0),
(95, 'LEG SWELLING', 'Swelling of one or both legs', 0),
(96, 'GENERALIZED SWELLING', 'Swelling affecting multiple body areas', 0),
(97, 'FACIAL SWELLING', 'Swelling of the face', 0),
(98, 'NECK LUMP OR SWELLING', 'Lump or swelling in the neck', 0),
(99, 'ENLARGED LYMPH NODES', 'Swollen or enlarged lymph nodes', 0),
(100, 'PALPITATIONS', 'Awareness of a rapid, pounding, or irregular heartbeat', 0),
(101, 'RAPID HEARTBEAT', 'Feeling that the heart is beating too fast', 0),
(102, 'SLOW HEARTBEAT', 'Feeling that the heart is beating unusually slowly', 0),
(103, 'HIGH BLOOD PRESSURE CONCERN', 'Concern about elevated blood pressure or a high reading', 0),
(104, 'LOW BLOOD PRESSURE SYMPTOMS', 'Symptoms possibly associated with low blood pressure', 0),
(105, 'LEG CRAMPS', 'Cramping or painful tightening of the leg muscles', 0),
(106, 'PAIN ON BREATHING', 'Pain that worsens with breathing', 0),
(107, 'COUGHING BLOOD', 'Coughing up blood or blood-stained sputum', 0),
(108, 'SPUTUM PRODUCTION', 'Cough with sputum or phlegm', 0),
(109, 'HOARSENESS', 'Hoarse or altered voice', 0),
(110, 'NOSEBLEED', 'Bleeding from the nose', 0),
(111, 'MOUTH SORE OR ULCER', 'Sore or ulcer inside the mouth', 0),
(112, 'TOOTHACHE', 'Pain in a tooth or teeth', 0),
(113, 'GUM PAIN OR BLEEDING', 'Pain or bleeding of the gums', 0),
(114, 'BAD BREATH', 'Unpleasant breath odor', 0),
(115, 'DRY MOUTH', 'Dryness of the mouth', 0),
(116, 'EXCESSIVE THIRST', 'Increased thirst', 0),
(117, 'FREQUENT HUNGER', 'Increased hunger', 0),
(118, 'FREQUENT URINATION AND THIRST', 'Frequent urination accompanied by increased thirst', 0),
(119, 'PAIN OR BURNING IN EXTREMITY', 'Pain or burning sensation in an arm or leg', 0),
(120, 'REDNESS OR WARMTH OF SKIN', 'Localized skin redness or warmth', 0),
(121, 'BRUISING', 'Easy bruising or unexplained bruises', 0),
(122, 'BLEEDING', 'Bleeding from an unspecified site', 0),
(123, 'EASY BLEEDING', 'Bleeding more easily than expected', 0),
(124, 'FALL', 'Recent fall', 0),
(125, 'INJURY OR TRAUMA', 'Recent injury or trauma', 0),
(126, 'WOUND OR CUT', 'Cut, wound, or open injury', 0),
(127, 'BURN INJURY', 'Burn injury', 0),
(128, 'BITE OR STING', 'Animal bite, insect bite, or sting', 0),
(129, 'FOREIGN BODY CONCERN', 'Concern about a possible foreign body', 0),
(130, 'ALLERGIC SYMPTOMS', 'Symptoms suspected to be caused by an allergy', 0),
(131, 'FACIAL FLUSHING', 'Redness or flushing of the face', 0),
(132, 'FEELING COLD', 'Unusual sensitivity to cold', 0),
(133, 'FEELING HOT', 'Unusual sensation of heat', 0),
(134, 'POOR FEEDING IN INFANT', 'Infant feeding poorly or taking less than usual', 0),
(135, 'EXCESSIVE CRYING IN INFANT', 'Excessive or inconsolable crying in an infant', 0),
(136, 'INFANT FEVER', 'Fever in an infant', 0),
(137, 'INFANT COUGH OR BREATHING DIFFICULTY', 'Cough or breathing difficulty in an infant', 0),
(138, 'CHILDHOOD RASH', 'Rash in a child', 0),
(139, 'CHILDHOOD DIARRHEA', 'Diarrhea in a child', 0),
(140, 'CHILDHOOD VOMITING', 'Vomiting in a child', 0),
(141, 'POOR WEIGHT GAIN IN CHILD', 'Poor weight gain in a child', 0),
(142, 'DEVELOPMENTAL CONCERN', 'Concern about a childs development', 0),
(143, 'CHILD LIMB PAIN OR LIMP', 'Limb pain or limping in a child', 0),
(144, 'FEEDING DIFFICULTY', 'Difficulty feeding or swallowing food', 0),
(145, 'DEHYDRATION CONCERN', 'Concern about possible dehydration', 0),
(146, 'REDUCED URINE OUTPUT', 'Passing less urine than usual', 0),
(147, 'INCREASED URINE OUTPUT', 'Passing more urine than usual', 0),
(148, 'ABNORMAL VAGINAL ODOR', 'Unusual vaginal odor', 0),
(149, 'GENITAL ITCHING', 'Itching in the genital area', 0),
(150, 'PAINFUL INTERCOURSE', 'Pain during sexual intercourse', 0),
(151, 'SEXUAL HEALTH CONCERN', 'Concern about sexual health or possible exposure to infection', 0),
(152, 'TESTICULAR LUMP', 'Lump or mass in a testicle', 0),
(153, 'ERECTILE OR SEXUAL FUNCTION CONCERN', 'Concern about erectile or sexual function', 0),
(154, 'RECTAL PAIN', 'Pain in or around the rectum', 0),
(155, 'ANAL ITCHING', 'Itching around the anus', 0),
(156, 'CHANGE IN BOWEL HABIT', 'Change in usual bowel movement pattern', 0),
(157, 'EXCESSIVE GAS', 'Excessive intestinal gas', 0),
(158, 'FOOD INTOLERANCE CONCERN', 'Symptoms suspected to be related to a food intolerance', 0),
(159, 'PALLOR', 'Unusual paleness of the skin or mucous membranes', 0),
(160, 'PAIN', 'Pain with no specific site recorded', 0),
(161, 'OTHER PRESENTING COMPLAINT', 'Other presenting complaint not listed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `declaredor`
--

CREATE TABLE `declaredor` (
  `id` int(11) NOT NULL,
  `receipt_no` varchar(25) NOT NULL,
  `invoice_no` varchar(25) NOT NULL,
  `old_receipt_no` varchar(25) NOT NULL,
  `dDate` date NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `patient_no` varchar(25) NOT NULL,
  `payment_type` varchar(25) NOT NULL,
  `discount` float(11,2) NOT NULL,
  `subtotal` float(11,2) NOT NULL,
  `total_amount` float(11,2) NOT NULL,
  `amountPaid` float(11,2) NOT NULL,
  `change` float(11,2) NOT NULL,
  `total_purchased` int(3) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `dept_code` varchar(100) NOT NULL,
  `dept_name` varchar(150) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `dept_code`, `dept_name`, `InActive`) VALUES
(1, 'MIS', 'Management Information System', 0),
(2, 'GS', 'General Services', 0),
(3, 'THC', 'Technical Healthcare', 0);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `designation_id` int(11) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `description` varchar(150) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`designation_id`, `designation`, `description`, `InActive`) VALUES
(1, 'System Administrator', 'System Administrator', 0),
(2, 'Admin', 'Admin', 0),
(3, 'Intern', 'Intern', 0),
(4, 'Receptionist', 'Receptionist', 0),
(5, 'Doctor', 'Doctor', 0),
(6, 'Nurse', 'Nurse', 0),
(7, 'Pharmacist', 'Pharmacist', 0),
(8, 'Laboratory Technician', 'Laboratory Technician', 0),
(9, 'Cashier', 'Cashier', 0);

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `diagnosis_id` int(11) NOT NULL,
  `diagnosis_name` varchar(500) NOT NULL,
  `diagnosis_desc` text NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`diagnosis_id`, `diagnosis_name`, `diagnosis_desc`, `InActive`) VALUES
(1, 'FEVER', 'Fever', 0),
(2, 'COUGH', 'Cough', 0),
(3, 'SORE THROAT', 'Sore throat', 0),
(4, 'COMMON COLD', 'Common cold', 0),
(5, 'UPPER RESPIRATORY TRACT INFECTION', 'Upper respiratory tract infection', 0),
(6, 'ACUTE BRONCHITIS', 'Acute bronchitis', 0),
(7, 'PNEUMONIA', 'Pneumonia', 0),
(8, 'ALLERGIC RHINITIS', 'Allergic rhinitis', 0),
(9, 'SINUSITIS', 'Sinusitis', 0),
(10, 'PHARYNGITIS', 'Pharyngitis', 0),
(11, 'TONSILLITIS', 'Tonsillitis', 0),
(12, 'COVID-19', 'COVID-19', 0),
(13, 'DENGUE FEVER', 'Dengue fever', 0),
(14, 'MALARIA', 'Malaria', 0),
(15, 'TUBERCULOSIS', 'Tuberculosis', 0),
(16, 'INFLUENZA', 'Influenza', 0),
(17, 'ACUTE GASTROENTERITIS', 'Acute gastroenteritis', 0),
(18, 'GASTRITIS', 'Gastritis', 0),
(19, 'GASTROESOPHAGEAL REFLUX DISEASE', 'Gastroesophageal reflux disease', 0),
(20, 'PEPTIC ULCER DISEASE', 'Peptic ulcer disease', 0),
(21, 'ABDOMINAL PAIN', 'Abdominal pain', 0),
(22, 'NAUSEA AND VOMITING', 'Nausea and vomiting', 0),
(23, 'DYSPEPSIA', 'Dyspepsia', 0),
(24, 'ACUTE APPENDICITIS', 'Acute appendicitis', 0),
(25, 'HEMORRHOIDS', 'Hemorrhoids', 0),
(26, 'ANAL FISSURE', 'Anal fissure', 0),
(27, 'IRRITABLE BOWEL SYNDROME', 'Irritable bowel syndrome', 0),
(28, 'HEPATITIS B', 'Hepatitis B', 0),
(29, 'HEPATITIS C', 'Hepatitis C', 0),
(30, 'CHOLECYSTITIS', 'Cholecystitis', 0),
(31, 'HYPERTENSION', 'Hypertension (high blood pressure)', 0),
(32, 'TYPE 2 DIABETES MELLITUS', 'Type 2 diabetes mellitus', 0),
(33, 'TYPE 1 DIABETES MELLITUS', 'Type 1 diabetes mellitus', 0),
(34, 'HYPERLIPIDEMIA', 'Hyperlipidemia (high blood lipids)', 0),
(35, 'ISCHEMIC HEART DISEASE', 'Ischemic heart disease', 0),
(36, 'HEART FAILURE', 'Heart failure', 0),
(37, 'ATRIAL FIBRILLATION', 'Atrial fibrillation', 0),
(38, 'ANEMIA', 'Anemia', 0),
(39, 'IRON DEFICIENCY ANEMIA', 'Iron deficiency anemia', 0),
(40, 'HYPOTHYROIDISM', 'Hypothyroidism', 0),
(41, 'HYPERTHYROIDISM', 'Hyperthyroidism', 0),
(42, 'GOUT', 'Gout', 0),
(43, 'OSTEOARTHRITIS', 'Osteoarthritis', 0),
(44, 'LOW BACK PAIN', 'Low back pain', 0),
(45, 'NECK PAIN', 'Neck pain', 0),
(46, 'MUSCLE STRAIN', 'Muscle strain', 0),
(47, 'SPRAIN', 'Sprain', 0),
(48, 'FRACTURE', 'Fracture', 0),
(49, 'CONTUSION', 'Contusion (bruise)', 0),
(50, 'WOUND', 'Wound', 0),
(51, 'BURN', 'Burn injury', 0),
(52, 'DERMATITIS', 'Dermatitis', 0),
(53, 'ATOPIC DERMATITIS', 'Atopic dermatitis', 0),
(54, 'CONTACT DERMATITIS', 'Contact dermatitis', 0),
(55, 'URTICARIA', 'Urticaria (hives)', 0),
(56, 'CELLULITIS', 'Cellulitis', 0),
(57, 'IMPETIGO', 'Impetigo', 0),
(58, 'TINEA INFECTION', 'Tinea (fungal skin infection)', 0),
(59, 'SCABIES', 'Scabies', 0),
(60, 'ACNE VULGARIS', 'Acne vulgaris', 0),
(61, 'CONJUNCTIVITIS', 'Conjunctivitis', 0),
(62, 'CATARACT', 'Cataract', 0),
(63, 'GLAUCOMA', 'Glaucoma', 0),
(64, 'REFRACTIVE ERROR', 'Refractive error', 0),
(65, 'OTITIS EXTERNA', 'Otitis externa', 0),
(66, 'CERUMEN IMPACTION', 'Impacted earwax', 0),
(67, 'URINARY TRACT INFECTION', 'Urinary tract infection', 0),
(68, 'CYSTITIS', 'Cystitis', 0),
(69, 'PYELONEPHRITIS', 'Pyelonephritis', 0),
(70, 'KIDNEY STONE', 'Renal calculus (kidney stone)', 0),
(71, 'CHRONIC KIDNEY DISEASE', 'Chronic kidney disease', 0),
(72, 'BENIGN PROSTATIC HYPERPLASIA', 'Benign prostatic hyperplasia', 0),
(73, 'VAGINITIS', 'Vaginitis', 0),
(74, 'CERVICITIS', 'Cervicitis', 0),
(75, 'PELVIC PAIN', 'Pelvic pain', 0),
(76, 'DYSMENORRHEA', 'Dysmenorrhea (painful menstruation)', 0),
(77, 'AMENORRHEA', 'Amenorrhea (absence of menstruation)', 0),
(78, 'ABNORMAL UTERINE BLEEDING', 'Abnormal uterine bleeding', 0),
(79, 'ANTENATAL CARE', 'Encounter for antenatal care', 0),
(80, 'PREGNANCY-RELATED NAUSEA AND VOMITING', 'Nausea and vomiting in pregnancy', 0),
(81, 'POSTPARTUM CHECK', 'Postpartum examination', 0),
(82, 'MASTITIS', 'Mastitis', 0),
(83, 'ECTOPIC PREGNANCY', 'Ectopic pregnancy', 0),
(84, 'MIGRAINE', 'Migraine', 0),
(85, 'TENSION-TYPE HEADACHE', 'Tension-type headache', 0),
(86, 'VERTIGO', 'Vertigo', 0),
(87, 'EPILEPSY', 'Epilepsy', 0),
(88, 'SYNCOPE', 'Syncope (fainting)', 0),
(89, 'PERIPHERAL NEUROPATHY', 'Peripheral neuropathy', 0),
(90, 'ANXIETY DISORDER', 'Anxiety disorder', 0),
(91, 'DEPRESSIVE DISORDER', 'Depressive disorder', 0),
(92, 'OBSTRUCTIVE SLEEP APNEA', 'Obstructive sleep apnea', 0),
(93, 'VITAMIN D DEFICIENCY', 'Vitamin D deficiency', 0),
(94, 'DEHYDRATION', 'Dehydration', 0),
(95, 'ELECTROLYTE IMBALANCE', 'Electrolyte imbalance', 0),
(96, 'ALLERGIC REACTION', 'Allergic reaction', 0),
(97, 'ANAPHYLAXIS', 'Anaphylaxis', 0),
(98, 'TOOTH DECAY', 'Dental caries (tooth decay)', 0),
(99, 'GINGIVITIS', 'Gingivitis', 0),
(100, 'DENTAL ABSCESS', 'Dental abscess', 0),
(101, 'ORAL ULCER', 'Oral ulcer', 0),
(102, 'PALLOR', 'Pallor', 0),
(103, 'EDEMA', 'Edema', 0),
(104, 'CHEST PAIN', 'Chest pain', 0),
(105, 'SHORTNESS OF BREATH', 'Shortness of breath', 0),
(106, 'PALPITATIONS', 'Palpitations', 0),
(107, 'DIZZINESS', 'Dizziness', 0),
(108, 'FATIGUE', 'Fatigue', 0),
(109, 'WEIGHT LOSS', 'Unintentional weight loss', 0),
(110, 'WEIGHT GAIN', 'Weight gain', 0),
(111, 'JOINT PAIN', 'Joint pain', 0),
(112, 'RASH', 'Skin rash', 0),
(113, 'PRURITUS', 'Pruritus (itching)', 0),
(114, 'LYMPHADENOPATHY', 'Lymphadenopathy (enlarged lymph nodes)', 0),
(115, 'HYPERURICEMIA', 'Hyperuricemia', 0),
(116, 'OSTEOPOROSIS-RELATED FRACTURE', 'Fracture associated with osteoporosis', 0),
(117, 'CERVICAL SPONDYLOSIS', 'Cervical spondylosis', 0),
(118, 'LUMBAGO WITH SCIATICA', 'Low back pain with sciatica', 0),
(119, 'RHEUMATOID ARTHRITIS', 'Rheumatoid arthritis', 0),
(120, 'PARKINSONISM', 'Parkinsonism', 0),
(121, 'TRANSIENT ISCHEMIC ATTACK', 'Transient ischemic attack', 0),
(122, 'CHRONIC OBSTRUCTIVE PULMONARY DISEASE', 'Chronic obstructive pulmonary disease', 0),
(123, 'PULMONARY TUBERCULOSIS', 'Pulmonary tuberculosis', 0),
(124, 'PLEURAL EFFUSION', 'Pleural effusion', 0),
(125, 'ACUTE SINUSITIS', 'Acute sinusitis', 0),
(126, 'ACUTE OTITIS MEDIA', 'Acute otitis media', 0),
(127, 'HAND-FOOT-AND-MOUTH DISEASE', 'Hand-foot-and-mouth disease', 0),
(128, 'CHICKENPOX', 'Chickenpox (varicella)', 0),
(129, 'HERPES ZOSTER', 'Herpes zoster (shingles)', 0),
(130, 'SCARLET FEVER', 'Scarlet fever', 0),
(131, 'TYPHOID FEVER', 'Typhoid fever', 0),
(132, 'CHOLERA', 'Cholera', 0),
(133, 'LEPTOSPIROSIS', 'Leptospirosis', 0),
(134, 'CHIKUNGUNYA', 'Chikungunya', 0),
(135, 'ZIKA VIRUS DISEASE', 'Zika virus disease', 0),
(136, 'HUMAN IMMUNODEFICIENCY VIRUS DISEASE', 'Human immunodeficiency virus disease', 0),
(137, 'SYPHILIS', 'Syphilis', 0),
(138, 'GONORRHEA', 'Gonorrhea', 0),
(139, 'CHLAMYDIAL INFECTION', 'Chlamydial infection', 0),
(140, 'IRON DEFICIENCY', 'Iron deficiency', 0),
(141, 'GESTATIONAL DIABETES', 'Gestational diabetes mellitus', 0),
(142, 'HYPERTENSIVE DISORDER IN PREGNANCY', 'Hypertensive disorder in pregnancy', 0),
(143, 'PRE-ECLAMPSIA', 'Pre-eclampsia', 0),
(144, 'THREATENED MISCARRIAGE', 'Threatened miscarriage', 0),
(145, 'ACUTE OTITIS MEDIA IN CHILD', 'Acute otitis media in a child', 0),
(146, 'ACUTE BRONCHIOLITIS', 'Acute bronchiolitis', 0),
(147, 'FEBRILE SEIZURE', 'Febrile seizure', 0),
(148, 'FAILURE TO THRIVE', 'Failure to thrive', 0),
(149, 'DEVELOPMENTAL DELAY', 'Developmental delay', 0),
(150, 'NEONATAL JAUNDICE', 'Neonatal jaundice', 0),
(151, 'ANALGESIC OVERUSE HEADACHE', 'Medication-overuse headache', 0),
(152, 'GASTROINTESTINAL BLEEDING', 'Gastrointestinal bleeding', 0),
(153, 'CIRRHOSIS OF LIVER', 'Cirrhosis of liver', 0),
(154, 'FATTY LIVER DISEASE', 'Fatty liver disease', 0),
(155, 'ACUTE KIDNEY INJURY', 'Acute kidney injury', 0),
(156, 'URINARY INCONTINENCE', 'Urinary incontinence', 0),
(157, 'HERNIA', 'Hernia', 0),
(158, 'INGUINAL HERNIA', 'Inguinal hernia', 0),
(159, 'VARICOSE VEINS', 'Varicose veins', 0),
(160, 'DEEP VEIN THROMBOSIS', 'Deep vein thrombosis', 0),
(161, 'HEMORRHAGE', 'Hemorrhage', 0),
(162, 'SEPSIS', 'Sepsis', 0),
(163, 'MALNUTRITION', 'Malnutrition', 0),
(164, 'FOOD ALLERGY', 'Food allergy', 0),
(165, 'GLAUCOMA SUSPECT', 'Glaucoma suspect', 0),
(166, 'DRY EYE SYNDROME', 'Dry eye syndrome', 0),
(167, 'HEARING LOSS', 'Hearing loss', 0),
(168, 'EPISTAXIS', 'Epistaxis (nosebleed)', 0),
(169, 'DYSPHAGIA', 'Dysphagia (difficulty swallowing)', 0),
(170, 'HOARSENESS', 'Hoarseness', 0),
(171, 'CONSTIPATION IN CHILD', 'Constipation in a child', 0),
(172, 'ACUTE DIARRHEA', 'Acute diarrhea', 0),
(173, 'CHRONIC DIARRHEA', 'Chronic diarrhea', 0),
(174, 'URINARY RETENTION', 'Urinary retention', 0),
(175, 'POLYCYSTIC OVARY SYNDROME', 'Polycystic ovary syndrome', 0),
(176, 'ENDOMETRIOSIS', 'Endometriosis', 0),
(177, 'UTERINE FIBROIDS', 'Uterine fibroids', 0),
(178, 'INFERTILITY', 'Infertility', 0),
(179, 'ERECTILE DYSFUNCTION', 'Erectile dysfunction', 0),
(180, 'PROSTATITIS', 'Prostatitis', 0),
(181, 'BELL PALSY', 'Bell palsy', 0),
(182, 'CARPAL TUNNEL SYNDROME', 'Carpal tunnel syndrome', 0),
(183, 'PLANTAR FASCIITIS', 'Plantar fasciitis', 0),
(184, 'TENDINITIS', 'Tendinitis', 0),
(185, 'BURSITIS', 'Bursitis', 0),
(186, 'OSTEOMYELITIS', 'Osteomyelitis', 0),
(187, 'ABSCESS', 'Abscess', 0),
(188, 'FURUNCLE', 'Furuncle (boil)', 0),
(189, 'HERPES SIMPLEX INFECTION', 'Herpes simplex infection', 0),
(190, 'CANDIDAL VULVOVAGINITIS', 'Candidal vulvovaginitis', 0),
(191, 'BACTERIAL VAGINOSIS', 'Bacterial vaginosis', 0),
(192, 'MENOPAUSAL SYMPTOMS', 'Menopausal symptoms', 0),
(193, 'OSTEOMALACIA', 'Osteomalacia', 0),
(194, 'HYPONATREMIA', 'Hyponatremia', 0),
(195, 'HYPOKALEMIA', 'Hypokalemia', 0),
(196, 'HYPERKALEMIA', 'Hyperkalemia', 0),
(197, 'HYPOGLYCEMIA', 'Hypoglycemia', 0),
(198, 'HYPERGLYCEMIA', 'Hyperglycemia', 0),
(199, 'ACUTE STRESS REACTION', 'Acute stress reaction', 0),
(200, 'TOBACCO USE', 'Tobacco use', 0),
(201, 'ALCOHOL USE DISORDER', 'Alcohol use disorder', 0),
(202, 'HEALTH CHECKUP', 'Encounter for general health examination', 0),
(203, 'FOLLOW-UP EXAMINATION', 'Follow-up examination', 0),
(204, 'MEDICATION REFILL VISIT', 'Encounter for medication refill', 0),
(205, 'SCREENING EXAMINATION', 'Encounter for screening examination', 0),
(206, 'IMMUNIZATION VISIT', 'Encounter for immunization', 0);

-- --------------------------------------------------------

--
-- Table structure for table `doctors_fee`
--

CREATE TABLE `doctors_fee` (
  `doctorfeeID` int(11) NOT NULL,
  `user_id` varchar(11) DEFAULT NULL,
  `invoice_no` varchar(25) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `completeDate` varchar(50) DEFAULT NULL,
  `feeType` varchar(25) DEFAULT NULL,
  `value` float(11,2) DEFAULT NULL,
  `totalFee` float(11,2) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `floor_id` int(11) NOT NULL,
  `floor_name` varchar(25) NOT NULL,
  `floor_description` text NOT NULL,
  `InActive` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`floor_id`, `floor_name`, `floor_description`, `InActive`) VALUES
(1, 'Ground Floor', 'Ground Floor', 0),
(2, 'Middle Floor', 'Middle Floor', 0),
(3, '1st Floor', '1st Floor', 0),
(4, '2nd Floor', '2nd Floor', 0);

-- --------------------------------------------------------

--
-- Table structure for table `insurance_comp`
--

CREATE TABLE `insurance_comp` (
  `in_com_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_address` varchar(100) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `fax_no` varchar(25) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `contact_no_person` varchar(100) NOT NULL,
  `contact_email` varchar(50) NOT NULL,
  `notes` text NOT NULL,
  `InActive` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_bed_side_procedure`
--

CREATE TABLE `iop_bed_side_procedure` (
  `bed_pro_id` int(11) NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `dDate` date NOT NULL,
  `dDateTime` varchar(50) NOT NULL,
  `cItem_id` int(11) NOT NULL,
  `qty` int(5) NOT NULL,
  `notes` text NOT NULL,
  `cPreparedBy` varchar(25) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_billing`
--

CREATE TABLE `iop_billing` (
  `bill_id` int(11) NOT NULL,
  `receipt_no` varchar(25) NOT NULL,
  `iop_id` varchar(25) DEFAULT NULL,
  `patient_no` varchar(25) DEFAULT NULL,
  `payment_type` varchar(25) DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `dDate` date DEFAULT NULL,
  `discount` float(11,2) DEFAULT NULL,
  `reason_discount` int(5) DEFAULT NULL,
  `sub_total` float(11,2) DEFAULT NULL,
  `total_amount` float(11,2) DEFAULT NULL,
  `total_purchased` float(11,2) DEFAULT NULL,
  `creditCardNo` int(11) DEFAULT NULL,
  `creditCardHolder` int(11) DEFAULT NULL,
  `insurance_company` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `InActive` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_billing_t`
--

CREATE TABLE `iop_billing_t` (
  `invoice_no` varchar(50) DEFAULT NULL,
  `bill_name` varchar(900) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `rate` float(11,2) DEFAULT NULL,
  `amount` float(11,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `InActive` int(1) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `iop_id` varchar(25) DEFAULT NULL,
  `isPackage` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_complaints`
--

CREATE TABLE `iop_complaints` (
  `iop_comp_id` int(11) NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `complain_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `dDate` date NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_diagnosis`
--

CREATE TABLE `iop_diagnosis` (
  `iop_diag_id` int(11) NOT NULL,
  `iop_id` varchar(11) NOT NULL,
  `diagnosis_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `dDate` datetime NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_discharge_summary`
--

CREATE TABLE `iop_discharge_summary` (
  `dis_id` int(11) NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `dDate` date NOT NULL,
  `dDateTime` datetime NOT NULL,
  `reason_admission` text NOT NULL,
  `condition_upon_discharge` int(11) NOT NULL,
  `admitting_impression` text NOT NULL,
  `final_diagnosis` text NOT NULL,
  `physical_exam_findings` text NOT NULL,
  `course_ward` text NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_intake_record`
--

CREATE TABLE `iop_intake_record` (
  `intake_id` int(11) NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `particulars` varchar(500) NOT NULL,
  `IV_fluids` varchar(25) NOT NULL,
  `oral` varchar(25) NOT NULL,
  `no_stool` varchar(25) NOT NULL,
  `no_urine` varchar(25) NOT NULL,
  `dDate` date NOT NULL,
  `dDateTime` varchar(50) NOT NULL,
  `InActive` int(1) NOT NULL,
  `cPreparedBy` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_laboratory`
--

CREATE TABLE `iop_laboratory` (
  `io_lab_id` int(11) NOT NULL,
  `iop_id` varchar(11) NOT NULL,
  `dDate` date NOT NULL,
  `dDateTime` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `laboratory_id` int(11) NOT NULL,
  `findings` text NOT NULL,
  `result` text NOT NULL,
  `doctor` int(11) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_medication`
--

CREATE TABLE `iop_medication` (
  `iop_med_id` int(11) NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `instruction` text NOT NULL,
  `advice` text NOT NULL,
  `days` int(2) NOT NULL,
  `total_qty` int(5) NOT NULL,
  `InActive` int(1) NOT NULL,
  `dDate` datetime NOT NULL,
  `cPreparedBy` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_nurse_notes`
--

CREATE TABLE `iop_nurse_notes` (
  `nurse_notes_id` int(11) NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `dDate` date NOT NULL,
  `dDateTime` varchar(50) NOT NULL,
  `focus` varchar(50) NOT NULL,
  `notes` text NOT NULL,
  `cPreparedBy` varchar(25) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_operation_theater`
--

CREATE TABLE `iop_operation_theater` (
  `operation_id` int(11) NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `dDate_from` date NOT NULL,
  `dTime_from` time NOT NULL,
  `dDate_to` date NOT NULL,
  `dTime_to` time NOT NULL,
  `operation_name` varchar(250) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `diagnosis` text NOT NULL,
  `name_of_surgeon` varchar(25) NOT NULL,
  `name_of_anesthesia` varchar(25) NOT NULL,
  `assistant_name1` varchar(150) NOT NULL,
  `assistant_name2` varchar(150) NOT NULL,
  `assistant_name3` varchar(150) NOT NULL,
  `assistant_name4` varchar(150) NOT NULL,
  `operation_procedure` text NOT NULL,
  `notes` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_output_record`
--

CREATE TABLE `iop_output_record` (
  `output_id` int(11) NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `urine` varchar(25) NOT NULL,
  `feaces` varchar(25) NOT NULL,
  `respitation` varchar(25) NOT NULL,
  `skin` varchar(25) NOT NULL,
  `dDate` date NOT NULL,
  `dDateTime` varchar(50) NOT NULL,
  `cPreparedBy` varchar(25) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_progress_note`
--

CREATE TABLE `iop_progress_note` (
  `progress_id` int(11) NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `dDate` date NOT NULL,
  `dDateTime` varchar(50) NOT NULL,
  `progress` text NOT NULL,
  `treatment` text NOT NULL,
  `remarks` text NOT NULL,
  `InActive` int(1) NOT NULL,
  `cPreparedBy` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_receipt`
--

CREATE TABLE `iop_receipt` (
  `receipt_id` int(11) NOT NULL,
  `receipt_no` varchar(15) NOT NULL,
  `invoice_no` varchar(25) NOT NULL,
  `dDate` datetime NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `patient_no` varchar(25) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `discount` float(11,2) NOT NULL,
  `subtotal` float(11,2) NOT NULL,
  `total_amount` float(11,2) NOT NULL,
  `amountPaid` float(11,2) NOT NULL,
  `change` float(11,2) NOT NULL,
  `total_purchased` int(4) NOT NULL,
  `creditCardNo` int(25) NOT NULL,
  `creditCardHolder` varchar(35) NOT NULL,
  `insurance_company` int(11) NOT NULL,
  `remarks` int(11) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_room_transfer`
--

CREATE TABLE `iop_room_transfer` (
  `transfer_id` int(11) NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `dDate` date NOT NULL,
  `dDateTime` varchar(50) NOT NULL,
  `room_category_id` int(3) NOT NULL,
  `room_master_id` int(3) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `cPreparedBy` varchar(25) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iop_vital_parameters`
--

CREATE TABLE `iop_vital_parameters` (
  `vital_id` int(11) NOT NULL,
  `iop_id` varchar(25) NOT NULL,
  `dDate` date NOT NULL,
  `dDateTime` varchar(50) NOT NULL,
  `pulse_rate` varchar(25) NOT NULL,
  `temperature` varchar(25) NOT NULL,
  `height` varchar(25) NOT NULL,
  `bp` varchar(25) NOT NULL,
  `respiration` varchar(25) NOT NULL,
  `weight` varchar(25) NOT NULL,
  `cPreparedBy` varchar(25) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logfile`
--

CREATE TABLE `logfile` (
  `logid` bigint(11) NOT NULL,
  `user_id` varchar(25) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `event` varchar(10) DEFAULT NULL,
  `ipaddress` varchar(25) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_category`
--

CREATE TABLE `medicine_category` (
  `cat_id` int(11) NOT NULL,
  `med_category_name` varchar(500) NOT NULL,
  `med_category_desc` text NOT NULL,
  `InActive` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine_category`
--

INSERT INTO `medicine_category` (`cat_id`, `med_category_name`, `med_category_desc`, `InActive`) VALUES
(1, 'ANTI-ALLERGIC', 'ANTI-ALLERGIC', 0),
(2, 'ANTI-ANXIETY', 'ANTI-ANXIETY', 0),
(4, 'ANTI-ARRHYTHMIA', 'ANTI-ARRHYTHMIA', 0),
(5, 'ANTI-ASTHMATIC', 'ANTI-ASTHMATIC', 0),
(6, 'ANTI-BACTERIAL', 'ANTI-BACTERIAL ', 0),
(7, 'ANTI-CHOLINERGICS', 'ANTI-CHOLINERGICS', 0),
(8, 'ANTI-CHOLINESTERASES', 'ANTI-CHOLINESTERASES', 0),
(9, 'ANTI-HIV', 'ANTI-HIV', 0),
(10, 'ANTI-INFECTIVE', 'ANTI-INFECTIVE', 0),
(11, 'PHARMACY', 'PHARMACY', 0);

-- --------------------------------------------------------

--
-- Table structure for table `medicine_drug_name`
--

CREATE TABLE `medicine_drug_name` (
  `drug_id` int(11) NOT NULL,
  `med_cat_id` int(11) NOT NULL,
  `cType` int(11) NOT NULL,
  `drug_name` varchar(500) NOT NULL,
  `drug_desc` text NOT NULL,
  `uom` int(11) NOT NULL,
  `re_order_level` float(11,2) NOT NULL,
  `nPrice` float(11,2) NOT NULL,
  `nStock` float(11,2) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine_drug_name`
--

INSERT INTO `medicine_drug_name` (`drug_id`, `med_cat_id`, `cType`, `drug_name`, `drug_desc`, `uom`, `re_order_level`, `nPrice`, `nStock`, `InActive`) VALUES
(4, 1, 51, 'CYPROHEPTADINE', '', 55, 150.00, 60.00, 1500.00, 0),
(3, 1, 51, 'DIPHENHYDRAMINE', '', 55, 100.00, 25.00, 10000.00, 0),
(5, 1, 51, 'PROMETHAZINE', '', 55, 150.00, 50.00, 1500.00, 0),
(6, 1, 51, 'PHENIRAMINE', '', 55, 150.00, 45.00, 150.00, 0),
(7, 1, 51, 'CHLORPHENIRAMINE', '', 55, 15.00, 15.00, 250.00, 0),
(8, 1, 51, 'PYRILAMINE', '', 55, 150.00, 50.00, 150.00, 0),
(9, 5, 51, 'EPINEPHRINE', '', 55, 150.00, 45.00, 54000.00, 0),
(10, 1, 51, 'NITRIC OXIDE', '', 55, 155.00, 50.00, 2500.00, 0),
(11, 1, 51, 'ATROPINE', '', 55, 500.00, 25.00, 150.00, 0),
(12, 5, 51, 'ISOPROTERENOL', '', 55, 500.00, 50.00, 5000.00, 0),
(13, 11, 52, 'MEDICINE', '', 55, 0.00, 0.00, 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_module` varchar(50) NOT NULL,
  `page_name` varchar(50) NOT NULL,
  `page_link` varchar(50) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_module`, `page_name`, `page_link`, `InActive`) VALUES
(1, 'System Pages', 'Access to System Pages', 'pages', 0),
(2, 'System Pages', 'Add Page', 'add_page', 0),
(3, 'System Pages', 'Update Page', 'update_page', 0),
(4, 'System Pages', 'Delete Page', 'delete_page', 0),
(35, 'User Roles', 'Delete User Roles', 'delete_roles', 0),
(34, 'User Roles', 'Update User Roles', 'update_roles', 0),
(33, 'User Roles', 'Add User Roles', 'add_roles', 0),
(32, 'User Roles', 'Access to User Roles', 'roles', 0),
(28, 'Department', 'Access to Department', 'department', 0),
(29, 'Department', 'Add Department', 'add_department', 0),
(30, 'Department', 'Update Department', 'update_department', 0),
(31, 'Department', 'Delete Department', 'delete_department', 0),
(36, 'System User', 'Access to System User', 'view_user', 0),
(37, 'System User', 'Add User', 'add_user', 0),
(38, 'System User', 'Update User', 'update_user', 0),
(39, 'System User', 'Delete User', 'delete_user', 0),
(40, 'Designation', 'Access to Designation', 'designation', 0),
(41, 'Designation', 'Add Designation', 'add_designation', 0),
(42, 'Designation', 'Update Designation', 'update_designation', 0),
(43, 'Designation', 'Delete Designation', 'delete_designation', 0),
(44, 'Room Management', 'Access to Room Management', 'room_management', 0),
(45, 'Room Management', 'Add Room Management', 'add_room_management', 0),
(46, 'Room Management', 'Update Room Management', 'update_room_management', 0),
(47, 'Room Management', 'Delete Room Management', 'delete_room_management', 0),
(48, 'Patient Management', 'Add New Patient', 'add_new_patient', 0),
(49, 'Patient Management', 'Access to Patient Master', 'patient_master', 0),
(50, 'Patient Management', 'Patient Demographic', 'patient_demographic', 0),
(51, 'Patient Management', 'Modify Patient Information', 'modiffy_patient', 0),
(52, 'System Parameters', 'Access to System Parameters', 'parameters', 0),
(53, 'System Parameters', 'Add Parameters', 'add_sys_param', 0),
(54, 'System Parameters', 'Update Parameters', 'update_sys_param', 0),
(55, 'System Parameters', 'Delete Parameters', 'delete_sys_param', 0),
(56, 'Bill Group Name', 'Access to Bill Group Name', 'group_name', 0),
(57, 'Bill Group Name', 'Add Group Name', 'add_group_name', 0),
(58, 'Bill Group Name', 'Update Group Name', 'update_group_name', 0),
(59, 'Bill Group Name', 'Delete Group Name', 'delete_group_name', 0),
(60, 'Particular Bill', 'Access to Particular Bill', 'particular_bill', 0),
(61, 'Particular Bill', 'Add Particular Bill', 'add_particular_bill', 0),
(62, 'Particular Bill', 'Update Particular Bill', 'update_particular_bill', 0),
(63, 'Particular Bill', 'Delete Particular Bill', 'delete_particular_bill', 0),
(64, 'Diagnosis Master', 'Access to Diagnosis Master', 'diagnosis', 0),
(65, 'Diagnosis Master', 'Add Diagnosis Master', 'add_diagnosis', 0),
(66, 'Diagnosis Master', 'Update Diagnosis Master', 'update_diagnosis', 0),
(67, 'Diagnosis Master', 'Delete Diagnosis Master', 'delete_diagnosis', 0),
(68, 'Insurance Company', 'Access to Insurance Company', 'insurance_company', 0),
(69, 'Insurance Company', 'Add Insurance Company', 'add_insurance_company', 0),
(70, 'Insurance Company', 'Update Insurance Company', 'update_insurance_company', 0),
(71, 'Insurance Company', 'Delete Insurance Company', 'delete_insurance_company', 0),
(72, 'Complain Module', 'Access to Complain Module', 'complain', 0),
(73, 'Complain Module', 'Add Complain Module', 'add_complain', 0),
(74, 'Complain Module', 'Update Complain', 'update_complain', 0),
(75, 'Complain Module', 'Delete Complain', 'delete_complain', 0),
(76, 'Medicine Category', 'Access to Medicine Category', 'medicine_category', 0),
(77, 'Medicine Category', 'Add Medicine Category', 'add_medicine_category', 0),
(78, 'Medicine Category', 'Update Medicine Category', 'update_medical_category', 0),
(79, 'Medicine Category', 'Delete Medicine Category', 'delete_medical_category', 0),
(80, 'Drug Name Master', 'Access to Drug Name Master', 'drug_name', 0),
(81, 'Drug Name Master', 'Add Drug Name Master', 'add_drug_name', 0),
(82, 'Drug Name Master', 'Update Drug Name Master', 'update_drug_name', 0),
(83, 'Drug Name Master', 'Delete Drug Name Master', 'delete_drug_name', 0),
(84, 'Billing Module', 'Access to POS', 'pos', 0),
(85, 'Billing Module', 'Access to Billing List', 'billing_history', 0),
(86, 'OR History', 'Access to OR History', 'OR_history', 0),
(87, 'Reports', 'Daily Sales Reports', 'daily_reports', 0),
(88, 'Reports', 'Patient List Report', 'patient_list_report', 0),
(89, 'Doctor Module', 'OPD', 'doctor_opd', 0),
(90, 'Doctor Module', 'IPD', 'ipd_doctor', 0),
(91, 'Patient Management', 'OPD Registration', 'opd_registration', 0),
(92, 'Patient Management', 'OPD Enquiry', 'opd_enquiry', 0),
(93, 'Patient Management', 'IPD Registration', 'ipd_registration', 0),
(94, 'Patient Management', 'IPD Enquiry', 'ipd_enquiry', 0),
(95, 'EMR Sheet', 'OPD EMR', 'opd_emr', 0),
(96, 'EMR Sheet', 'IPD EMR', 'ipd_emr', 0),
(97, 'OPD Reports', 'Patient Diagnosis Reports', 'opd_diagnosis_reports', 0),
(98, 'Reports', 'Individual Patient  Reports', 'patient_visited_report', 0),
(99, 'Room Management', 'Room Enquiry', 'room_enquiry', 0),
(100, 'Nurse Module', 'Patient Medication', 'nurse_medication_reports', 0),
(101, 'Nurse Module', 'Intake/Output Record', 'nurse_intake_output_reports', 0),
(102, 'Nurse Module', 'Nurse Progress Note', 'nurse_progress_note_report', 0),
(103, 'Nurse Module', 'Patient Vital Sign', 'nurse_vital_sign_report', 0),
(104, 'Nurse Module', 'IP Room Transfer', 'nurse_room_transfer_report', 0),
(105, 'Nurse Module', 'Patient History', 'nurse_patientHistory_report', 0),
(106, 'Nurse Module', 'Patient Discharge Summary', 'nurse_discharge_summary_report', 0),
(107, 'Nurse Module', 'Bed Side Procedure', 'nurse_bed_side_procedure_report', 0),
(108, 'Reports', 'Out Patient Reports', 'outpatient_report', 0),
(109, 'Reports', 'Admitted Patient Reports', 'inpatient_report', 0),
(110, 'Reports', 'Discharged Patient', 'discharged_patient_report', 0),
(111, 'Company Information', 'Company Information', 'company_information', 0),
(112, 'Surgical Package', 'Access to Surgical Package', 'surgical_package', 0),
(113, 'Surgical Package', 'Add Surgical Package', 'add_surgical_package', 0),
(114, 'Surgical Package', 'Update Surgical Package', 'update_surgical_package', 0),
(115, 'Surgical Package', 'Delete Surgical Package', 'delete_surgical_package', 0),
(116, 'Billing Module', 'Surgical Quotation Costing', 'surgical_costing', 0),
(117, 'Acknowledge Receipt', 'Access to Acknowledge Receipt', 'declared_receipt', 0),
(118, 'Acknowledge Receipt', 'Delete  Acknowledge Receipt', 'delete_delaredOR', 0),
(119, 'Reports', 'Acknowledge Receipt Reports', 'declared_receipt_report', 0),
(120, 'Nurse Module', 'Nurse Diagnosis', 'nurse_diagnosis_reports', 0),
(121, 'Patient Appointment', 'Access to Appointment', 'appointment', 0),
(122, 'Patient Appointment', 'Add Appointment', 'add_appointment', 0),
(123, 'Patient Appointment', 'Edit Appointment', 'edit_appointment', 0),
(124, 'Patient Appointment', 'Delete Appointment', 'delete_appointment', 0),
(125, 'Patient Appointment', 'Check OUT Patient', 'checkOUT_appointment', 0),
(126, 'Patient Appointment', 'Check IN Patient', 'checkIN_appointment', 0),
(127, 'Backup Database', 'Create Backup of System Database', 'backup_database', 0),
(128, 'Nurse Module', 'Access to Nurse Module', 'access_nurse_module', 0),
(129, 'Doctor Module', 'Access to Doctor Module', 'access_doctor_module', 0),
(130, 'EMR Sheet', 'Access to EMR', 'access_emr_module', 0),
(131, 'Administration Module Tab', 'Access to Administration Module', 'access_administration_module', 0),
(132, 'Reports Generation Module Tab', 'Access to Reports Module', 'access_reports_module', 0),
(133, 'Reports', 'Doctor Fee Report', 'doctor_fee_report', 0),
(134, 'Dashboard', 'Access to Doctors Availability', 'access_doctors_avail', 0);

-- --------------------------------------------------------

--
-- Table structure for table `patient_appointment`
--

CREATE TABLE `patient_appointment` (
  `appID` bigint(20) NOT NULL,
  `patient_no` varchar(25) NOT NULL,
  `appointmentDate` date NOT NULL,
  `appHour` tinyint(2) NOT NULL,
  `appMinutes` tinyint(2) NOT NULL,
  `appAMPM` varchar(10) NOT NULL,
  `appointmentTime` time NOT NULL,
  `appointmentReason` tinytext NOT NULL,
  `consultantDoctor` varchar(10) NOT NULL,
  `dateVisit` datetime NOT NULL,
  `appointmentStatus` char(1) NOT NULL,
  `dateEntry` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_attachment`
--

CREATE TABLE `patient_attachment` (
  `attach_id` int(11) NOT NULL,
  `patient_no` varchar(25) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `description` varchar(155) NOT NULL,
  `file_name` varchar(150) NOT NULL,
  `file_type` varchar(150) NOT NULL,
  `file_size` varchar(50) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_details_iop`
--

CREATE TABLE `patient_details_iop` (
  `id` bigint(11) NOT NULL,
  `IO_ID` varchar(15) NOT NULL,
  `patient_no` varchar(15) NOT NULL,
  `patient_type` varchar(5) NOT NULL,
  `date_visit` date NOT NULL,
  `time_visit` time NOT NULL,
  `doctor_id` varchar(15) NOT NULL,
  `refferal_doctor` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `provisional_diagnosis` text NOT NULL,
  `complaints` text NOT NULL,
  `allergies` text NOT NULL,
  `warnings` text NOT NULL,
  `social_history` text NOT NULL,
  `family_history` text NOT NULL,
  `personal_history` text NOT NULL,
  `past_medical_history` text NOT NULL,
  `pulse_rate` varchar(150) NOT NULL,
  `temperature` varchar(150) NOT NULL,
  `height` varchar(150) NOT NULL,
  `bp` varchar(150) NOT NULL,
  `respiration` varchar(150) NOT NULL,
  `weight` varchar(150) NOT NULL,
  `nStatus` varchar(15) NOT NULL,
  `InActive` int(1) NOT NULL,
  `isPaid` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_personal_info`
--

CREATE TABLE `patient_personal_info` (
  `reg_no` bigint(11) NOT NULL,
  `patient_no` varchar(15) NOT NULL,
  `title` int(11) NOT NULL,
  `lastname` varchar(35) NOT NULL,
  `firstname` varchar(35) NOT NULL,
  `middlename` varchar(25) NOT NULL,
  `gender` int(11) NOT NULL,
  `civil_status` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `birthplace` varchar(150) NOT NULL,
  `fathers_name` varchar(150) NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `age` int(3) NOT NULL,
  `religion` int(11) NOT NULL,
  `street` varchar(50) NOT NULL,
  `subd_brgy` varchar(90) NOT NULL,
  `province` varchar(90) NOT NULL,
  `phone_no` varchar(25) NOT NULL,
  `phone_no_office` varchar(25) NOT NULL,
  `mobile_no` varchar(25) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `date_entry` datetime NOT NULL,
  `blood_group` int(11) NOT NULL,
  `Insurance_comp` int(11) NOT NULL,
  `insurance_no` varchar(25) NOT NULL,
  `id_identifiers` text NOT NULL,
  `InActive` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `price_history`
--

CREATE TABLE `price_history` (
  `price_history_id` int(11) NOT NULL,
  `nRef_ID` int(11) NOT NULL,
  `price` float(11,2) NOT NULL,
  `updatedBy` varchar(11) NOT NULL,
  `dDate` datetime NOT NULL,
  `action` varchar(25) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room_beds`
--

CREATE TABLE `room_beds` (
  `room_bed_id` int(11) NOT NULL,
  `room_master_id` int(11) NOT NULL,
  `bed_name` varchar(25) NOT NULL,
  `nStatus` varchar(15) NOT NULL,
  `patient_no` varchar(25) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_beds`
--

INSERT INTO `room_beds` (`room_bed_id`, `room_master_id`, `bed_name`, `nStatus`, `patient_no`, `InActive`) VALUES
(1, 1, 'RM-101-Bed-01', 'Vacant', '', 0),
(2, 1, 'RM-101-Bed-02', 'Vacant', '', 0),
(3, 1, 'RM-101-Bed-03', 'Vacant', '', 0),
(4, 1, 'RM-101-Bed-04', 'Vacant', '', 0),
(5, 2, 'RM-102-Bed-01', 'Vacant', '', 0),
(6, 3, 'RM-103-Bed-01', 'Vacant', '', 0),
(7, 4, 'RM-104-Bed-01', 'Vacant', '', 0),
(8, 5, 'RM-105-Bed-01', 'Vacant', '', 0),
(9, 6, 'RM-106-Bed-01', 'Vacant', '', 0),
(10, 7, 'RM-107-Bed-01', 'Vacant', '', 0),
(11, 8, 'RM-108-Bed-01', 'Vacant', '', 0),
(12, 9, 'Bed-01', 'Vacant', '', 0),
(13, 10, 'Bed-01', 'Vacant', '', 0),
(14, 11, 'Bed-01', 'Vacant', '', 0),
(15, 12, 'Bed-01', 'Vacant', '', 0),
(16, 13, 'Bed-01', 'Vacant', '', 0),
(17, 14, 'Bed-01', 'Vacant', '', 0),
(18, 15, 'EMERGENCY-Bed-01', 'Vacant', '', 0),
(19, 15, 'EMERGENCY-Bed-02', 'Vacant', '', 0),
(20, 15, 'EMERGENCY-Bed-03', 'Vacant', '', 0),
(21, 16, 'Bed-01', 'Vacant', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_category`
--

CREATE TABLE `room_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_desc` text NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_category`
--

INSERT INTO `room_category` (`category_id`, `category_name`, `category_desc`, `InActive`) VALUES
(1, 'Patient Room', 'Patient Room', 0),
(2, 'Consultation Room', 'Consultation Room', 0),
(3, 'Echo Room', 'Echo Room', 0),
(4, 'Small Surgical Room', 'Small Surgical Room', 0),
(5, 'X-ray Room', 'X-ray Room', 0),
(6, 'Emergency Room', 'Emergency Room', 0),
(7, 'Ophthalmology Room', 'Ophthalmology Room', 0),
(8, 'Pharmacy Room', 'Pharmacy Room', 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_master`
--

CREATE TABLE `room_master` (
  `room_master_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `room_name` varchar(50) NOT NULL,
  `floor` int(11) NOT NULL,
  `room_rates` float(11,2) NOT NULL,
  `InActive` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_master`
--

INSERT INTO `room_master` (`room_master_id`, `category_id`, `room_name`, `floor`, `room_rates`, `InActive`) VALUES
(1, 1, '101', 2, 20.00, 0),
(2, 1, '102', 2, 00.00, 0),
(3, 1, '103', 2, 00.00, 0),
(4, 1, '104', 2, 30.00, 0),
(5, 1, '105', 2, 25.00, 0),
(6, 1, '106', 2, 00.00, 0),
(7, 1, '107', 2, 25.00, 0),
(8, 1, '108', 2, 25.00, 0),
(9, 2, 'Consultation Room 1', 1, 00.00, 0),
(10, 2, 'Consultation Room 2', 1, 00.00, 0),
(11, 2, 'Consultation Room 3', 1, 00.00, 0),
(12, 3, 'Echo Room', 1, 00.00, 0),
(13, 4, 'Small Surgical Room', 1, 00.00, 0),
(14, 5, 'X-ray Room', 1, 00.00, 0),
(15, 6, 'Emergency Room', 1, 120.00, 0),
(16, 7, 'Ophthalmology Room', 1, 00.00, 0),
(17, 8, 'Pharmacy Room', 1, 00.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `surgical_package`
--

CREATE TABLE `surgical_package` (
  `surgery_id` int(11) NOT NULL,
  `surgery_name` varchar(150) NOT NULL,
  `surgery_desc` text NOT NULL,
  `total_costs` float(11,2) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surgical_package_t`
--

CREATE TABLE `surgical_package_t` (
  `m_id` int(11) NOT NULL,
  `surgery_id` int(11) NOT NULL,
  `surgery_item` varchar(150) NOT NULL,
  `cDesc` text NOT NULL,
  `costs` float(11,2) NOT NULL,
  `InActive` int(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `system_option`
--

CREATE TABLE `system_option` (
  `option_id` int(11) NOT NULL,
  `cCode` varchar(25) NOT NULL,
  `cValue` int(11) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_option`
--

INSERT INTO `system_option` (`option_id`, `cCode`, `cValue`, `InActive`) VALUES
(1, 'employee_no', 10, 0),
(2, 'patient_no', 1, 0),
(3, 'INPATIENTNO', 1, 0),
(4, 'OUTPATIENTNO', 1, 0),
(5, 'invoice_no', 1, 0),
(6, 'receipt_no', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `system_parameters`
--

CREATE TABLE `system_parameters` (
  `param_id` bigint(11) NOT NULL,
  `cCode` varchar(50) NOT NULL,
  `cValue` varchar(50) NOT NULL,
  `cDesc` varchar(150) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_parameters`
--

INSERT INTO `system_parameters` (`param_id`, `cCode`, `cValue`, `cDesc`, `InActive`) VALUES
(1, 'gender', 'Male', '', 0),
(2, 'gender', 'Female', '', 0),
(3, 'civil_status', 'Single', '', 0),
(4, 'civil_status', 'Married', '', 0),
(5, 'civil_status', 'Separated', '', 0),
(6, 'civil_status', 'Divorced', '', 0),
(7, 'title_name', 'Mr.', '', 0),
(8, 'title_name', 'Ms.', '', 0),
(9, 'title_name', 'Mrs.', '', 0),
(10, 'title_name', 'Dr.', '', 0),
(11, 'title_name', 'Prof.', '', 0),
(12, 'religion', 'Buddhist', '', 0),
(13, 'religion', 'Roman Catholic', '', 0),
(14, 'religion', 'Muslim', '', 0),
(15, 'religion', 'Chinese', '', 0),
(16, 'religion', 'Hindu', '', 0),
(17, 'religion', 'Others', '', 0),
(29, 'blood_type', 'O+', '', 0),
(30, 'blood_type', 'O-', '', 0),
(31, 'blood_type', 'A+', '', 0),
(32, 'blood_type', 'A-', '', 0),
(33, 'blood_type', 'B+', '', 0),
(34, 'blood_type', 'B-', '', 0),
(35, 'blood_type', 'AB+', '', 0),
(36, 'blood_type', 'AB-', '', 0),
(51, 'type_medicine', 'Generic', 'Generic', 0),
(52, 'type_medicine', 'Branded', 'Branded', 0),
(53, 'medicine_uom', 'Tablet', 'Tablet', 0),
(54, 'medicine_uom', 'Bottle', 'Bottle', 0),
(55, 'medicine_uom', 'Each', 'Each', 0),
(56, 'payment_type', 'CASH', 'CASH', 0),
(57, 'payment_type', 'CREDIT CARD', 'CREDIT CARD', 0),
(58, 'payment_type', 'BANK TRANSFER', 'BANK TRANSFER', 0),
(59, 'payment_type', 'INSURANCE COMPANY', 'INSURANCE COMPANY', 0),
(60, 'condition_upon_discharge', 'Improved', 'Improved', 0),
(61, 'condition_upon_discharge', 'Recovered', 'Recovered', 0),
(62, 'condition_upon_discharge', 'Expired', '', 0),
(63, 'condition_upon_discharge', 'Transferred', '', 0),
(64, 'reason_for_discount', 'Student', 'Student', 0),
(65, 'reason_for_discount', 'Senior Citizen', 'Senior Citizen', 0),
(66, 'reason_for_discount', 'Sample Reason here', 'Sample Reason here', 0),
(67, 'reason_for_discount', 'Person with Disablities', 'Person with Disablities', 0),
(68, 'reason_for_discount', 'Management Decision', 'Management Decision', 0),
(69, 'reason_for_discount', 'Below Poverty Line', 'Below Poverty Line', 0),
(70, 'reason_for_discount', 'Employee', 'Employee', 0),
(71, 'reason_for_discount', 'Member', 'Member', 0),
(100, 'birthplace', 'Banteay Meanchey', '', 0),
(101, 'birthplace', 'Battambang', '', 0),
(102, 'birthplace', 'Kampong Cham', '', 0),
(103, 'birthplace', 'Kampong Chhnang', '', 0),
(104, 'birthplace', 'Kampong Speu', '', 0),
(105, 'birthplace', 'Kampong Thom', '', 0),
(106, 'birthplace', 'Kampot', '', 0),
(107, 'birthplace', 'Kandal', '', 0),
(108, 'birthplace', 'Kep', '', 0),
(109, 'birthplace', 'Koh Kong', '', 0),
(110, 'birthplace', 'Kratie', '', 0),
(111, 'birthplace', 'Mondulkiri', '', 0),
(112, 'birthplace', 'Phnom Penh', '', 0),
(113, 'birthplace', 'Preah Vihear', '', 0),
(114, 'birthplace', 'Prey Veng', '', 0),
(115, 'birthplace', 'Pursat', '', 0),
(116, 'birthplace', 'Ratanak Kiri', '', 0),
(117, 'birthplace', 'Siem Reap', '', 0),
(118, 'birthplace', 'Preah Sihanouk', '', 0),
(119, 'birthplace', 'Stung Treng', '', 0),
(120, 'birthplace', 'Svay Rieng', '', 0),
(121, 'birthplace', 'Takeo', '', 0),
(122, 'birthplace', 'Oddar Meanchey', '', 0),
(123, 'birthplace', 'Pailin', '', 0),
(124, 'birthplace', 'Tboung Khmum', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `department` int(11) NOT NULL,
  `designation` int(11) NOT NULL,
  `user_role` int(11) NOT NULL,
  `cType` varchar(25) NOT NULL,
  `title` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(25) NOT NULL,
  `age` int(2) NOT NULL,
  `street` varchar(50) NOT NULL,
  `subd_brgy` varchar(50) NOT NULL,
  `province` char(50) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `gender` int(1) NOT NULL,
  `civil_status` int(1) NOT NULL,
  `birthday` date NOT NULL,
  `birthplace` varchar(100) NOT NULL,
  `email_address` varchar(75) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `doctorIsIn` varchar(10) NOT NULL,
  `doctorLastIn` varchar(25) NOT NULL,
  `doctorLastOut` varchar(25) NOT NULL,
  `InActive` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `department`, `designation`, `user_role`, `cType`, `title`, `lastname`, `firstname`, `middlename`, `age`, `street`, `subd_brgy`, `province`, `phone_no`, `mobile_no`, `gender`, `civil_status`, `birthday`, `birthplace`, `email_address`, `username`, `password`, `picture`, `doctorIsIn`, `doctorLastIn`, `doctorLastOut`, `InActive`) VALUES
(1, '00001', 1, 1, 1, '', 7, 'Marin', 'Marin', 'M', 38, '', '', '', '', '', 1, 4, '1978-03-16', 'Earth', 'abc@gmail.com', 'marin', '30f6df93537ae762794fcdd73bdae3b1', '', '0', '', '', 0),
(2, '00002', 2, 1, 1, '', 7, 'Administrator', 'Admin', 'A.', 27, '', '', '', '', '', 1, 3, '1989-09-27', '', 'admin@gmail.com', 'admin', '8b42a1c9b8f9fde869f83c954b3d463b', '', '0', '', '', 0),
(3, '00003', 2, 1, 2, '', 7, 'Sok', 'Heng', 'A.', 25, '', '', '', '', '', 1, 1, '1991-01-01', '', 'hengsok@gmail.com', 'heng sok', '1692ae04d32a3c26b0f6d61fd693ba03', '', '0', '', '', 0),
(4, '00004', 2, 9, 5, '', 7, 'Cashier1', 'Cashier1', 'A.', 25, '', '', '', '', '', 1, 1, '1991-01-01', '', 'cashier1@gmail.com', 'cashier1', '2128e681b001cc5e1d5d5f1ffa5ed9e8', '', '0', '', '', 0),
(5, '00005', 3, 5, 4, '', 11, 'No', 'Ku', 'A.', 25, '', '', '', '', '', 1, 1, '1991-01-01', '', 'kuno@gmail.com', 'ku no', '633e46b10e15d2667eb184c416ef3750', '', '0', '', '', 0),
(6, '00006', 3, 5, 4, '', 11, 'Phalla', 'Poev', 'A.', 25, '', '', '', '', '', 1, 1, '1991-01-01', '', 'poevphalla@gmail.com', 'poev phalla', '48af4b2d5e1dfc7e1568430d3d66c8d4', '', '0', '', '', 0),
(7, '00007', 3, 5, 4, '', 11, 'Sokheng', 'Seng', 'A.', 25, '', '', '', '', '', 1, 1, '1991-01-01', '', 'sengsokheng@gmail.com', 'seng sokheng', 'ed3aed180a6e85ee1755a66fb444775c', '', '0', '', '', 0),
(8, '00008', 3, 5, 4, '', 11, 'Sokcheng', 'Orn', 'A.', 25, '', '', '', '', '', 1, 1, '1991-01-01', '', 'ornsokcheng@gmail.com', 'orn sokcheng', 'f18af1d7101f779d778c3ef8d0894721', '', '0', '', '', 0),
(9, '00009', 3, 5, 4, '', 11, 'Chomroun', 'It', 'A.', 25, '', '', '', '', '', 1, 1, '1991-01-01', '', 'itchomroun@gmail.com', 'it chomroun', '5e4361653a978b11318a103ceb9455d5', '', '0', '', '', 0),
(10, '00010', 3, 5, 4, '', 11, 'Mengcheat', 'Tangleng', 'A.', 25, '', '', '', '', '', 1, 1, '1991-01-01', '', 'tanglengmengcheat@gmail.com', 'tangleng mengcheat', 'ca352bb69706a7e747181c451d845ddb', '', '0', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `role_description` text DEFAULT NULL,
  `InActive` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_id`, `module`, `role_name`, `role_description`, `InActive`) VALUES
(1, '0', 'Super Admin', 'Full Access of the entire system', 0),
(2, 'administrator', 'Administrator and CEO', 'Minimal supervision', 0),
(3, '0', 'Receptionist', 'Help Desk Officer', 0),
(4, 'doctor', 'Doctor', 'Doctor', 0),
(5, 'billing', 'Billing / Cashier', 'Billing / Cashier', 0),
(6, '0', 'Nurse Roles', 'Nurse', 0),
(7, '0', 'Pharmacy Roles', 'Pharmacy', 0),
(8, '0', 'Laboratory Roles', 'Laboratory', 0),
(9, '0', 'Radiology Roles', 'Radiology', 0),
(10, '0', 'Inventory Roles', 'Inventory', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles_pages`
--

CREATE TABLE `user_roles_pages` (
  `rollpages_id` bigint(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles_pages`
--

INSERT INTO `user_roles_pages` (`rollpages_id`, `role_id`, `page_id`) VALUES
(9259, 1, 34),
(9258, 1, 35),
(9257, 1, 33),
(9256, 1, 32),
(8892, 3, 50),
(4864, 2, 61),
(9255, 1, 38),
(9254, 1, 39),
(9253, 1, 37),
(9252, 1, 36),
(9251, 1, 54),
(9250, 1, 55),
(9249, 1, 53),
(9248, 1, 52),
(9247, 1, 3),
(9246, 1, 4),
(9245, 1, 2),
(9244, 1, 1),
(9243, 1, 114),
(9242, 1, 115),
(9241, 1, 113),
(9240, 1, 112),
(9239, 1, 46),
(9238, 1, 99),
(9237, 1, 47),
(9236, 1, 45),
(9235, 1, 44),
(9234, 1, 132),
(9233, 1, 88),
(9232, 1, 108),
(9231, 1, 98),
(9230, 1, 133),
(8891, 3, 91),
(8890, 3, 92),
(9229, 1, 110),
(9228, 1, 87),
(9227, 1, 109),
(9226, 1, 119),
(9225, 1, 50),
(8889, 3, 51),
(9224, 1, 91),
(9223, 1, 92),
(9222, 1, 51),
(9221, 1, 93),
(4863, 2, 60),
(4862, 2, 31),
(4861, 2, 28),
(4860, 2, 57),
(9220, 1, 94),
(9219, 1, 48),
(9218, 1, 49),
(9217, 1, 123),
(9216, 1, 124),
(9215, 1, 126),
(9214, 1, 122),
(9213, 1, 121),
(9212, 1, 62),
(9211, 1, 63),
(9210, 1, 61),
(9209, 1, 60),
(9208, 1, 97),
(9207, 1, 103),
(9206, 1, 100),
(9205, 1, 105),
(9204, 1, 106),
(9203, 1, 102),
(9202, 1, 120),
(9201, 1, 104),
(9200, 1, 101),
(9199, 1, 107),
(9198, 1, 128),
(9197, 1, 78),
(9196, 1, 79),
(9195, 1, 77),
(9194, 1, 76),
(9193, 1, 70),
(9192, 1, 71),
(9191, 1, 69),
(9190, 1, 68),
(9189, 1, 95),
(9188, 1, 96),
(9187, 1, 130),
(9186, 1, 82),
(9185, 1, 83),
(9184, 1, 81),
(9183, 1, 80),
(9182, 1, 89),
(9181, 1, 90),
(9180, 1, 129),
(9179, 1, 66),
(9178, 1, 67),
(9177, 1, 65),
(9176, 1, 64),
(9175, 1, 42),
(8888, 3, 93),
(8887, 3, 94),
(8886, 3, 48),
(8885, 3, 49),
(9174, 1, 43),
(4859, 2, 56),
(8880, 7, 102),
(8879, 7, 120),
(8878, 7, 104),
(8877, 7, 101),
(8876, 7, 107),
(9173, 1, 41),
(9172, 1, 40),
(9171, 1, 30),
(9170, 1, 31),
(9169, 1, 29),
(9168, 1, 28),
(9167, 1, 74),
(9166, 1, 75),
(9165, 1, 73),
(9164, 1, 72),
(9163, 1, 111),
(9162, 1, 116),
(9161, 1, 84),
(8875, 7, 128),
(9160, 1, 85),
(4858, 2, 125),
(4857, 2, 124),
(4869, 2, 4),
(4868, 2, 2),
(4867, 2, 1),
(4866, 2, 63),
(4865, 2, 62),
(4856, 2, 123),
(4855, 2, 122),
(4854, 2, 121),
(4853, 2, 118),
(4852, 2, 117),
(9159, 1, 58),
(9158, 1, 59),
(9157, 1, 57),
(9156, 1, 56),
(9155, 1, 127),
(9154, 1, 131),
(8881, 7, 106),
(8882, 7, 105),
(8883, 7, 100),
(8884, 7, 103),
(8934, 5, 89),
(8933, 5, 90),
(8932, 5, 129),
(9153, 1, 118),
(9152, 1, 117);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_group_name`
--
ALTER TABLE `bill_group_name`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `bill_particular`
--
ALTER TABLE `bill_particular`
  ADD PRIMARY KEY (`particular_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`complain_id`);

--
-- Indexes for table `declaredor`
--
ALTER TABLE `declaredor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`diagnosis_id`);

--
-- Indexes for table `doctors_fee`
--
ALTER TABLE `doctors_fee`
  ADD PRIMARY KEY (`doctorfeeID`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`floor_id`);

--
-- Indexes for table `insurance_comp`
--
ALTER TABLE `insurance_comp`
  ADD PRIMARY KEY (`in_com_id`);

--
-- Indexes for table `iop_bed_side_procedure`
--
ALTER TABLE `iop_bed_side_procedure`
  ADD PRIMARY KEY (`bed_pro_id`);

--
-- Indexes for table `iop_billing`
--
ALTER TABLE `iop_billing`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `iop_billing_t`
--
ALTER TABLE `iop_billing_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iop_complaints`
--
ALTER TABLE `iop_complaints`
  ADD PRIMARY KEY (`iop_comp_id`);

--
-- Indexes for table `iop_diagnosis`
--
ALTER TABLE `iop_diagnosis`
  ADD PRIMARY KEY (`iop_diag_id`);

--
-- Indexes for table `iop_discharge_summary`
--
ALTER TABLE `iop_discharge_summary`
  ADD PRIMARY KEY (`dis_id`);

--
-- Indexes for table `iop_intake_record`
--
ALTER TABLE `iop_intake_record`
  ADD PRIMARY KEY (`intake_id`);

--
-- Indexes for table `iop_laboratory`
--
ALTER TABLE `iop_laboratory`
  ADD PRIMARY KEY (`io_lab_id`);

--
-- Indexes for table `iop_medication`
--
ALTER TABLE `iop_medication`
  ADD PRIMARY KEY (`iop_med_id`);

--
-- Indexes for table `iop_nurse_notes`
--
ALTER TABLE `iop_nurse_notes`
  ADD PRIMARY KEY (`nurse_notes_id`);

--
-- Indexes for table `iop_operation_theater`
--
ALTER TABLE `iop_operation_theater`
  ADD PRIMARY KEY (`operation_id`);

--
-- Indexes for table `iop_output_record`
--
ALTER TABLE `iop_output_record`
  ADD PRIMARY KEY (`output_id`);

--
-- Indexes for table `iop_progress_note`
--
ALTER TABLE `iop_progress_note`
  ADD PRIMARY KEY (`progress_id`);

--
-- Indexes for table `iop_receipt`
--
ALTER TABLE `iop_receipt`
  ADD PRIMARY KEY (`receipt_id`);

--
-- Indexes for table `iop_room_transfer`
--
ALTER TABLE `iop_room_transfer`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `iop_vital_parameters`
--
ALTER TABLE `iop_vital_parameters`
  ADD PRIMARY KEY (`vital_id`);

--
-- Indexes for table `logfile`
--
ALTER TABLE `logfile`
  ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `medicine_category`
--
ALTER TABLE `medicine_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `medicine_drug_name`
--
ALTER TABLE `medicine_drug_name`
  ADD PRIMARY KEY (`drug_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `patient_appointment`
--
ALTER TABLE `patient_appointment`
  ADD PRIMARY KEY (`appID`);

--
-- Indexes for table `patient_attachment`
--
ALTER TABLE `patient_attachment`
  ADD PRIMARY KEY (`attach_id`);

--
-- Indexes for table `patient_details_iop`
--
ALTER TABLE `patient_details_iop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_personal_info`
--
ALTER TABLE `patient_personal_info`
  ADD PRIMARY KEY (`reg_no`);

--
-- Indexes for table `price_history`
--
ALTER TABLE `price_history`
  ADD PRIMARY KEY (`price_history_id`);

--
-- Indexes for table `room_beds`
--
ALTER TABLE `room_beds`
  ADD PRIMARY KEY (`room_bed_id`);

--
-- Indexes for table `room_category`
--
ALTER TABLE `room_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `room_master`
--
ALTER TABLE `room_master`
  ADD PRIMARY KEY (`room_master_id`);

--
-- Indexes for table `surgical_package`
--
ALTER TABLE `surgical_package`
  ADD PRIMARY KEY (`surgery_id`);

--
-- Indexes for table `surgical_package_t`
--
ALTER TABLE `surgical_package_t`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `system_option`
--
ALTER TABLE `system_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`param_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user_roles_pages`
--
ALTER TABLE `user_roles_pages`
  ADD PRIMARY KEY (`rollpages_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_group_name`
--
ALTER TABLE `bill_group_name`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `bill_particular`
--
ALTER TABLE `bill_particular`
  MODIFY `particular_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `complain`
--
ALTER TABLE `complain`
  MODIFY `complain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `declaredor`
--
ALTER TABLE `declaredor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `diagnosis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `doctors_fee`
--
ALTER TABLE `doctors_fee`
  MODIFY `doctorfeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `floor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `insurance_comp`
--
ALTER TABLE `insurance_comp`
  MODIFY `in_com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `iop_bed_side_procedure`
--
ALTER TABLE `iop_bed_side_procedure`
  MODIFY `bed_pro_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iop_billing`
--
ALTER TABLE `iop_billing`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iop_billing_t`
--
ALTER TABLE `iop_billing_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iop_complaints`
--
ALTER TABLE `iop_complaints`
  MODIFY `iop_comp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iop_diagnosis`
--
ALTER TABLE `iop_diagnosis`
  MODIFY `iop_diag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iop_discharge_summary`
--
ALTER TABLE `iop_discharge_summary`
  MODIFY `dis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iop_intake_record`
--
ALTER TABLE `iop_intake_record`
  MODIFY `intake_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iop_laboratory`
--
ALTER TABLE `iop_laboratory`
  MODIFY `io_lab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iop_medication`
--
ALTER TABLE `iop_medication`
  MODIFY `iop_med_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iop_nurse_notes`
--
ALTER TABLE `iop_nurse_notes`
  MODIFY `nurse_notes_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iop_operation_theater`
--
ALTER TABLE `iop_operation_theater`
  MODIFY `operation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iop_output_record`
--
ALTER TABLE `iop_output_record`
  MODIFY `output_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iop_progress_note`
--
ALTER TABLE `iop_progress_note`
  MODIFY `progress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iop_receipt`
--
ALTER TABLE `iop_receipt`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iop_room_transfer`
--
ALTER TABLE `iop_room_transfer`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iop_vital_parameters`
--
ALTER TABLE `iop_vital_parameters`
  MODIFY `vital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logfile`
--
ALTER TABLE `logfile`
  MODIFY `logid` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `medicine_category`
--
ALTER TABLE `medicine_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `medicine_drug_name`
--
ALTER TABLE `medicine_drug_name`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `patient_appointment`
--
ALTER TABLE `patient_appointment`
  MODIFY `appID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_attachment`
--
ALTER TABLE `patient_attachment`
  MODIFY `attach_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_details_iop`
--
ALTER TABLE `patient_details_iop`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient_personal_info`
--
ALTER TABLE `patient_personal_info`
  MODIFY `reg_no` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `price_history`
--
ALTER TABLE `price_history`
  MODIFY `price_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `room_beds`
--
ALTER TABLE `room_beds`
  MODIFY `room_bed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `room_category`
--
ALTER TABLE `room_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room_master`
--
ALTER TABLE `room_master`
  MODIFY `room_master_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `surgical_package`
--
ALTER TABLE `surgical_package`
  MODIFY `surgery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `surgical_package_t`
--
ALTER TABLE `surgical_package_t`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `system_option`
--
ALTER TABLE `system_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `param_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_roles_pages`
--
ALTER TABLE `user_roles_pages`
  MODIFY `rollpages_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9260;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
