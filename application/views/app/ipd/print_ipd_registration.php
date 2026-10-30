<?php
/**
 * IPD registration print view.
 * Keeps the supplied nurse_vitals_form_a4.html layout.
 * Fields not available in opdReg.php intentionally remain blank for staff
 * to complete by hand after printing.
 */

$pd = isset($printData) && is_array($printData) ? $printData : array();

$value = function ($key) use ($pd) {
    return isset($pd[$key]) ? trim((string) $pd[$key]) : '';
};

$patientValue = function ($key) use ($patientInfo) {
    return (isset($patientInfo) && isset($patientInfo->$key))
        ? trim((string) $patientInfo->$key)
        : '';
};

$e = function ($text) {
    return html_escape((string) $text);
};

$patientNo   = $patientValue('patient_no');
$patientName = $patientValue('name');
$patientAge  = $patientValue('age');
$patientGender = $patientValue('gender');
$patientAddress = $patientValue('address');
$patientPhone = $patientInfo->phone_no ?? '';
$patientMobile = $patientInfo->mobile_no ?? '';
$patientOfficePhone = $patientInfo->phone_no_office ?? '';

$ipdNo = $value('iopNo');
$iopNo = $value('iopNo');
$departmentName = $value('department_name');
$doctorName = $value('doctor_name');
$roomName = $value('room_name');
$bedName = $value('bed_name');
$diagnosis = $value('prov_diagnosis');
$complaint = $value('complaint');

$bloodPressure = $value('bp');
$pulseRate = $value('pulse_rate');
$temperature = $value('temperature');
$respiration = $value('respiration');
$height = $value('height');
$weight = $value('weight');
$sao2 = $value('sao2');
$allergies = $value('allergies');

$today = date('d/m/Y H:i:s');
?>
<!doctype html>
<html lang="km">
<head>
<meta charset="utf-8">
<title>IPD Registration Form</title>
<style>
@page{size:A4 portrait;margin:0}
*{box-sizing:border-box}
html,body{margin:0;padding:0;background:#eee}
body{font-family:Arial,"Noto Sans Khmer","Khmer OS",sans-serif;color:#24566c}
.page{width:210mm;height:297mm;margin:10mm auto;padding:10mm 15mm;background:white;overflow:hidden}
.header{height:25mm;display:grid;grid-template-columns:26mm 1fr 32mm}
.logo{width:25mm;height:19mm;display:flex;align-items:center;justify-content:center;color:#1684a0;font-size:8pt}
.header-center{text-align:center;padding-top:1mm}
.clinic-title{font-size:12pt;font-weight:bold;color:#176a80;margin-bottom:1mm}
.header-date{font-size:7pt;color:#708796}
.mrn{height:10mm;border:.35mm solid #c5d7e0;border-radius:1.5mm;display:flex;align-items:center;justify-content:center;color:#a8b7c1;font-size:10pt;font-weight:bold;margin-top:1mm;overflow:hidden}
.top-rule{height:.8mm;background:#176a7e;margin-bottom:3mm}
.section{margin-bottom:2.5mm}
.section-title{height:8mm;border-bottom:.35mm solid #cbdde5;display:flex;align-items:center;gap:3mm;color:#176a80;font-size:11pt;font-weight:bold}
.num{width:6mm;height:6mm;background:#edf5f7;border-radius:1.3mm;display:inline-flex;align-items:center;justify-content:center;font-size:8pt;flex-shrink:0}
.patient-grid{display:grid;grid-template-columns:1.4fr .85fr .85fr;gap:1mm 5mm;margin-top:2mm}
.field{min-height:9mm;min-width:0}
.label{font-size:7.2pt;color:#657f8d;line-height:1.25;min-height:4mm}
.dotted{min-height:4mm;border-bottom:.35mm dotted #b8cbd5;color:#354f60;font-size:8pt;padding-top:.5mm;overflow-wrap:anywhere}
.vitals-top{display:grid;grid-template-columns:1fr 1fr 1fr;gap:4mm;margin-top:3mm}
.vitals-bottom{display:grid;grid-template-columns:repeat(5,1fr);gap:3mm;margin-top:3mm}
.input-box{height:11mm;border:.35mm solid #c5d8e1;border-radius:1.5mm;margin-top:1mm;display:flex;align-items:center;padding:0 2mm;color:#354f60;font-size:8pt}
.long-label{font-size:7.2pt;color:#657f8d;margin-top:3mm}
.write-line{height:8mm;border-bottom:.35mm dotted #b8cbd5;margin-top:1mm;color:#354f60;font-size:8pt;padding-top:1mm;white-space:pre-wrap;overflow-wrap:anywhere}
.services{margin-top:2mm}
.service-grid{display:grid;grid-template-columns:repeat(5,1fr);column-gap:2mm;row-gap:1.8mm;padding-top:3mm}
.service{display:flex;align-items:center;gap:2mm;min-height:4.5mm;font-size:7.1pt;color:#354f60;white-space:nowrap}
.check{width:4mm;height:4mm;border:.35mm solid #7895a6;border-radius:.5mm;flex-shrink:0}
.notes-label{font-size:7.2pt;color:#657f8d;margin-top:4mm}
.footer-label{text-align:right;font-size:7pt;color:#657f8d;margin-top:4mm}
/* Slightly tighter vertical spacing to keep the additional IPD fields on one A4 page. */
.patient-grid .field{min-height:7mm}
.write-line{height:6mm}
.section{margin-bottom:1.8mm}
.print-toolbar{width:210mm;margin:10px auto;text-align:right}
.print-button{background:#1684a0;color:#fff;border:0;border-radius:4px;padding:9px 16px;cursor:pointer}
@media screen and (max-width:850px){.page{width:100%;height:auto;min-height:297mm;margin:0;padding:5vw}.print-toolbar{width:100%;padding:8px}}
@media screen and (max-width:600px){.header{grid-template-columns:18mm 1fr 25mm}.logo{width:18mm}.clinic-title{font-size:10pt}.patient-grid{gap:1mm 2mm}.service-grid{grid-template-columns:repeat(2,1fr)}}
@media print{html,body{background:white;-webkit-print-color-adjust:exact;print-color-adjust:exact}.page{width:210mm;height:297mm;margin:0;padding:10mm 15mm;page-break-after:avoid}.print-toolbar{display:none!important}}
</style>
</head>
<body>
<!-- <div class="print-toolbar">
    <button type="button" class="print-button" onclick="window.print()">Print Document</button>
</div> -->

<main class="page">
<header class="header">
    <div class="logo">
    <img src="<?php echo base_url()?>public/company_logo/camcare-logo-color-primary-portrait.png" height="100">
  </div>
    <div class="header-center">
        <div class="clinic-title">ព័ត៌មានអ្នកជំងឺ</div>
        <div class="header-date"><?php echo $e($ipdNo); ?> - កាលបរិច្ឆេទ៖ <?php echo $e($today); ?></div>
    </div>
    <div class="mrn"><?php echo $e($patientNo); ?></div>
</header>
<div class="top-rule"></div>

<section class="section">
    <div class="section-title"><span class="num">1</span><span>ព័ត៌មានអ្នកជំងឺ</span></div>
    <div class="patient-grid">
        <div class="field"><div class="label">ឈ្មោះពេញរបស់អ្នកជំងឺ</div><div class="dotted"><?php echo $e($patientName); ?></div></div>
        <div class="field"><div class="label">អាយុ</div><div class="dotted"><?php echo $e($patientAge); ?></div></div>
        <div class="field"><div class="label">ភេទ</div><div class="dotted"><?php echo $e($patientGender); ?></div></div>
        <div class="field"><div class="label">អាសយដ្ឋាន</div><div class="dotted"><?php echo $e($patientAddress); ?></div></div>
        <div class="field"><div class="label">លេខទូរស័ព្ទ</div><div class="dotted"><?php echo $e($patientPhone); ?></div></div>
        <div class="field"><div class="label">ជួបជាមួយគ្រូពេទ្យ</div><div class="dotted"><?php echo $e($doctorName); ?></div></div>
        <div class="field"><div class="label">ផ្នែក</div><div class="dotted"><?php echo $e($departmentName); ?></div></div>
        <div class="field"><div class="label">បន្ទប់</div><div class="dotted"><?php echo $e($roomName); ?></div></div>
        <div class="field"><div class="label">គ្រែ</div><div class="dotted"><?php echo $e($bedName); ?></div></div>
    </div>
</section>

<section class="section">
    <div class="section-title"><span class="num">2</span><span>សញ្ញាជីវិត</span></div>
    <div class="vitals-top">
        <div><div class="label">កម្ពស់</div><div class="input-box"><?php echo $e($height); ?><?php echo $height !== '' ? ' cm' : ''; ?></div></div>
        <div><div class="label">ទម្ងន់</div><div class="input-box"><?php echo $e($weight); ?><?php echo $weight !== '' ? ' kg' : ''; ?></div></div>
        <div><div class="label">សន្ទស្សន៍ម៉ាសរាងកាយ/bmi</div><div class="input-box"></div></div>
    </div>
    <div class="vitals-bottom">
        <div><div class="label">សម្ពាធឈាម</div><div class="input-box"><?php echo $e($bloodPressure); ?><?php echo $bloodPressure !== '' ? ' mmHg' : ''; ?></div></div>
        <div><div class="label">ចង្វាក់បេះដូង</div><div class="input-box"><?php echo $e($pulseRate); ?><?php echo $pulseRate !== '' ? ' /min' : ''; ?></div></div>
        <div><div class="label">អត្រាដកដង្ហើម</div><div class="input-box"><?php echo $e($respiration); ?><?php echo $respiration !== '' ? ' /min' : ''; ?></div></div>
        <div><div class="label">សីតុណ្ហភាព</div><div class="input-box"><?php echo $e($temperature); ?><?php echo $temperature !== '' ? ' °C' : ''; ?></div></div>
        <div><div class="label">SaO₂</div><div class="input-box"><?php echo $e($sao2); ?><?php echo $sao2 !== '' ? ' %' : ''; ?></div></div>
    </div>
    <div class="long-label">រោគវិនិច្ឆ័យបឋម</div>
    <div class="write-line"><?php echo $e($diagnosis); ?></div>
    <div class="long-label">រោគសញ្ញា / ការត្អូញត្អែរ</div>
    <div class="write-line"><?php echo $e($complaint); ?></div>
    <div class="long-label">ការអាលែកហ្ស៊ី (ឧ. PENICILLIN, LATEX)</div>
    <div class="write-line"><?php echo $e($allergies); ?></div>
    <div class="long-label">កំណត់ចំណាំ</div>
    <div class="write-line"></div>
</section>

<section class="section services">
    <div class="section-title"><span class="num">3</span><span>សេវាកម្ម</span></div>
    <div class="service-grid">
        <div class="service"><i class="check"></i>ECG</div>
        <div class="service"><i class="check"></i>Consultation 1st</div>
        <div class="service"><i class="check"></i>Echo Endovaginal</div>
        <div class="service"><i class="check"></i>Bone Scanning</div>
        <div class="service"><i class="check"></i>Echo Abdominal</div>

        <div class="service"><i class="check"></i>Echo Cardio</div>
        <div class="service"><i class="check"></i>Consultation 2nd</div>
        <div class="service"><i class="check"></i>Consultation ORL</div>
        <div class="service"><i class="check"></i>Small Surgery</div>
        <div class="service"><i class="check"></i>Colposcopy</div>

        <div class="service"><i class="check"></i>Pap Smear</div>
        <div class="service"><i class="check"></i>Consultation 3rd</div>
        <div class="service"><i class="check"></i>Medicine</div>
        <div class="service"><i class="check"></i>Medicine Injection</div>
        <div class="service"><i class="check"></i>Culture</div>

        <div class="service"><i class="check"></i>Labo</div>
        <div class="service"><i class="check"></i>Consultation Specialist</div>
        <div class="service"></div>
        <div class="service"><i class="check"></i>Echo Des Seins</div>
        <div class="service"><i class="check"></i>Short Stay</div>

        <div class="service"><i class="check"></i>Xray</div>
        <div class="service"><i class="check"></i>Respiratory Consult Level 1</div>
        <div class="service"></div>
        <div class="service"><i class="check"></i>Echo Obstetrique</div>
        <div class="service"></div>

        <div class="service"></div>
        <div class="service"><i class="check"></i>Respiratory Consult Level 2</div>
    </div>

    <div class="notes-label">សេវាកម្មផ្សេងៗ</div>
    <div class="write-line"></div>
    <div class="footer-label">ហត្ថលេខាគ្រូពេទ្យ</div>
</section>
</main>
</body>
</html>
