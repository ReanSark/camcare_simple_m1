<!DOCTYPE html>
<html lang="km">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Print Prescription - <?php echo htmlspecialchars($patientInfo->patient_no, ENT_QUOTES, 'UTF-8'); ?></title>
    <style>
        @page { size: A4 portrait; margin: 12mm 14mm; }
        * { box-sizing: border-box; }
        body {
            margin: 0;
            color: #24404b;
            background: #eef2f4;
            font-family: "Khmer OS Battambang", "Khmer OS System", Arial, sans-serif;
            font-size: 11px;
            line-height: 1.55;
        }
        .toolbar {
            position: sticky;
            top: 0;
            z-index: 10;
            padding: 10px;
            text-align: center;
            background: #173f4a;
        }
        .toolbar button {
            border: 0;
            border-radius: 4px;
            padding: 9px 18px;
            margin: 0 4px;
            color: #fff;
            background: #1686bd;
            font-size: 14px;
            cursor: pointer;
        }
        .toolbar .close-button { background: #647782; }
        .sheet {
            width: 210mm;
            min-height: 297mm;
            margin: 16px auto;
            padding: 12mm 14mm;
            background: #fff;
            box-shadow: 0 2px 12px rgba(0,0,0,.12);
        }
        .header {
            display: grid;
            grid-template-columns: 34mm 1fr 34mm;
            align-items: center;
            gap: 5mm;
            min-height: 29mm;
            padding-bottom: 5mm;
            border-bottom: 3px solid #176274;
        }
        .clinic-logo { width: 31mm; height: auto; display: block; }
        .clinic-title { text-align: center; }
        .clinic-title .khmer-title { font-size: 18px; font-weight: bold; color: #176274; }
        .clinic-title .phone { margin-top: 3px; color: #788b94; font-size: 10px; }
        .mrn-box {
            min-height: 13mm;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #cbd7dc;
            border-radius: 5px;
            color: #607985;
            font-size: 12px;
            overflow-wrap: anywhere;
            padding: 2mm;
        }
        .section { margin-top: 5mm; }
        .section-title {
            margin: 0 0 3mm;
            padding: 1mm 0 1.5mm;
            border-bottom: 1px solid #ccd8dc;
            color: #176274;
            font-size: 15px;
            font-weight: bold;
        }
        .section-number {
            display: inline-block;
            min-width: 7mm;
            margin-right: 2mm;
            padding: 0 2mm;
            border-radius: 3px;
            background: #eaf4f6;
            text-align: center;
            color: #176274;
        }
        .patient-grid { display: grid; grid-template-columns: 1.4fr .9fr .8fr; gap: 6mm; }
        .field-label { color: #647b85; font-size: 10px; }
        .field-value { min-height: 9mm; padding: 1mm 0; border-bottom: 1px dotted #9eafb6; font-size: 12px; }
        .diagnosis-line { min-height: 10mm; padding: 1mm 0; border-bottom: 1px dotted #a9b8be; }
        .diagnosis-name { font-weight: bold; }
        .diagnosis-remarks { margin-left: 4mm; color: #526c77; }
        table { width: 100%; border-collapse: collapse; table-layout: fixed; }
        thead { display: table-header-group; }
        tr { page-break-inside: avoid; break-inside: avoid; }
        th, td { border: 1px solid #cbd7dc; padding: 2mm 1.3mm; vertical-align: middle; overflow-wrap: anywhere; }
        th { background: #edf5f7; color: #315d6b; font-size: 9px; text-align: center; }
        td { font-size: 10px; }
        td.center { text-align: center; }
        .col-no { width: 7%; }
        .col-drug { width: 24%; }
        .col-method { width: 13%; }
        .col-qty { width: 11%; }
        .col-meal { width: 10%; }
        .col-time { width: 8.75%; }
        .drug-name { font-weight: bold; }
        .drug-extra { margin-top: 1mm; color: #647b85; font-size: 9px; }
        .remove-row { display: block; margin: 1mm auto 0; padding: 1px 5px; border: 0; border-radius: 3px; color: #fff; background: #b94a48; font-size: 9px; cursor: pointer; }
        .empty-medication { padding: 7mm; text-align: center; color: #71858e; }
        .notes-label { margin: 4mm 0 1.5mm; color: #647b85; }
        .notes-box { height: 30mm; border: 1px solid #cbd7dc; border-radius: 2mm; }
        .footer { display: flex; justify-content: flex-end; gap: 20mm; margin-top: 12mm; page-break-inside: avoid; }
        .signature { width: 48%; text-align: center; }
        .signature-line { height: 12mm; border-bottom: 1px solid #9eafb6; }
        .signature-caption { display: flex; justify-content: space-between; margin-top: 2mm; color: #647b85; }
        @media print {
            body { background: #fff; -webkit-print-color-adjust: exact; print-color-adjust: exact; }
            .toolbar { display: none !important; }
            .sheet { width: auto; min-height: 0; margin: 0; padding: 0; box-shadow: none; }
            .remove-row { display: none !important; }
            .header { page-break-inside: avoid; }
            .notes-box { height: 30mm; }
        }
        @media screen and (max-width: 800px) {
            .sheet { width: 100%; min-height: 0; margin: 0; padding: 18px; overflow-x: auto; }
            .header { grid-template-columns: 25mm 1fr 25mm; }
            .clinic-title .khmer-title { font-size: 14px; }
            table { min-width: 680px; }
        }
    </style>
</head>
<body>
    <div class="toolbar">
        <button type="button" onclick="window.print()"><i>▣</i> Print Prescription</button>
        <button type="button" class="close-button" onclick="window.close()">Close Tab</button>
    </div>

    <main class="sheet">
        <header class="header">
            <div><img class="clinic-logo" src="<?php echo base_url('public/img/camcare-prescription-logo.png'); ?>" alt="Camcare Clinic"></div>
            <div class="clinic-title">
                <div class="khmer-title">វេជ្ជបញ្ជារបស់គ្រូពេទ្យ</div>
                <div class="phone">ទំនាក់ទំនង៖ 099 800068 / 096 280 0068</div>
            </div>
            <div class="mrn-box">MRN&nbsp; <?php echo htmlspecialchars($patientInfo->patient_no, ENT_QUOTES, 'UTF-8'); ?></div>
        </header>

        <section class="section">
            <h2 class="section-title"><span class="section-number">1</span>ព័ត៌មានអ្នកជំងឺ</h2>
            <div class="patient-grid">
                <div>
                    <div class="field-label">ឈ្មោះពេញរបស់អ្នកជំងឺ</div>
                    <div class="field-value"><?php echo htmlspecialchars($patientInfo->name, ENT_QUOTES, 'UTF-8'); ?></div>
                </div>
                <div>
                    <div class="field-label">អាយុ</div>
                    <div class="field-value"><?php echo htmlspecialchars($patientInfo->age, ENT_QUOTES, 'UTF-8'); ?></div>
                </div>
                <div>
                    <div class="field-label">ភេទ</div>
                    <div class="field-value"><?php echo htmlspecialchars($patientInfo->gender, ENT_QUOTES, 'UTF-8'); ?></div>
                </div>
            </div>
        </section>

        <section class="section">
            <h2 class="section-title"><span class="section-number">2</span>ការធ្វើរោគវិនិច្ឆ័យ</h2>
            <div class="field-label">រោគវិនិច្ឆ័យ</div>
            <?php if (!empty($patientDiagnosis)) { ?>
                <?php foreach ($patientDiagnosis as $diagnosis) { ?>
                    <div class="diagnosis-line">
                        <span class="diagnosis-name"><?php echo htmlspecialchars($diagnosis->diagnosis_name, ENT_QUOTES, 'UTF-8'); ?></span>
                        <?php if (trim((string)$diagnosis->remarks) !== '') { ?>
                            <span class="diagnosis-remarks">— <?php echo nl2br(htmlspecialchars($diagnosis->remarks, ENT_QUOTES, 'UTF-8')); ?></span>
                        <?php } ?>
                    </div>
                <?php } ?>
            <?php } else { ?>
                <div class="diagnosis-line"></div>
            <?php } ?>
            <div class="field-label" style="margin-top:2mm;">ការពិពណ៌នា</div>
            <div class="diagnosis-line"></div>
        </section>

        <section class="section">
            <h2 class="section-title"><span class="section-number">3</span>ព័ត៌មានលម្អិតអំពីវេជ្ជបញ្ជា</h2>
            <table>
                <thead>
                    <tr>
                        <th class="col-no">NO.</th>
                        <th class="col-drug">ឈ្មោះថ្នាំ</th>
                        <th class="col-method">វិធីប្រើ</th>
                        <th class="col-qty">បរិមាណ / ឯកតា</th>
                        <th class="col-meal">អាហារ</th>
                        <th class="col-time">ព្រឹក</th>
                        <th class="col-time">ថ្ងៃត្រង់</th>
                        <th class="col-time">ល្ងាច</th>
                        <th class="col-time">យប់</th>
                    </tr>
                </thead>
                <tbody id="medicationRows">
                    <?php if (!empty($patientMedication)) { ?>
                        <?php $rowNumber = 0; foreach ($patientMedication as $medication) { $rowNumber++; ?>
                            <tr class="medication-row">
                                <td class="center row-number"><?php echo $rowNumber; ?><button type="button" class="remove-row" onclick="removeMedicationRow(this)">Remove</button></td>
                                <td>
                                    <div class="drug-name"><?php echo htmlspecialchars($medication->drug_name, ENT_QUOTES, 'UTF-8'); ?></div>
                                    <?php if (trim((string)$medication->instruction) !== '') { ?><div class="drug-extra"><?php echo nl2br(htmlspecialchars($medication->instruction, ENT_QUOTES, 'UTF-8')); ?></div><?php } ?>
                                    <?php if (trim((string)$medication->advice) !== '') { ?><div class="drug-extra">ចំណាំ៖ <?php echo nl2br(htmlspecialchars($medication->advice, ENT_QUOTES, 'UTF-8')); ?></div><?php } ?>
                                    <?php if (!empty($medication->days)) { ?><div class="drug-extra">រយៈពេល៖ <?php echo htmlspecialchars($medication->days, ENT_QUOTES, 'UTF-8'); ?> ថ្ងៃ</div><?php } ?>
                                </td>
                                <td><?php echo htmlspecialchars($medication->method, ENT_QUOTES, 'UTF-8'); ?></td>
                                <td class="center">
                                    <?php if ($medication->total_qty !== null && $medication->total_qty !== '') { echo htmlspecialchars($medication->total_qty, ENT_QUOTES, 'UTF-8'); } ?>
                                    <?php if (!empty($medication->measurement)) { echo ' ' . htmlspecialchars($medication->measurement, ENT_QUOTES, 'UTF-8'); } ?>
                                </td>
                                <td class="center"><?php echo htmlspecialchars($medication->meal, ENT_QUOTES, 'UTF-8'); ?></td>
                                <td class="center"><?php echo ($medication->morning !== null && $medication->morning !== '') ? htmlspecialchars($medication->morning, ENT_QUOTES, 'UTF-8') : ''; ?></td>
                                <td class="center"><?php echo ($medication->afternoon !== null && $medication->afternoon !== '') ? htmlspecialchars($medication->afternoon, ENT_QUOTES, 'UTF-8') : ''; ?></td>
                                <td class="center"><?php echo ($medication->evening !== null && $medication->evening !== '') ? htmlspecialchars($medication->evening, ENT_QUOTES, 'UTF-8') : ''; ?></td>
                                <td class="center"><?php echo ($medication->night !== null && $medication->night !== '') ? htmlspecialchars($medication->night, ENT_QUOTES, 'UTF-8') : ''; ?></td>
                            </tr>
                        <?php } ?>
                    <?php } else { ?>
                        <tr><td colspan="9" class="empty-medication">មិនមានព័ត៌មានថ្នាំ</td></tr>
                    <?php } ?>
                </tbody>
            </table>
        </section>

        <section class="section">
            <div class="notes-label">កំណត់ចំណាំ</div>
            <div class="notes-box"></div>
        </section>

        <footer class="footer">
            <div class="signature">
                <div class="signature-line"></div>
                <div class="signature-caption"><span>គ្រូពេទ្យ</span><span>កាលបរិច្ឆេទ៖ <?php echo date('d / m / Y', strtotime($getOPDPatient->date_visit)); ?></span></div>
            </div>
        </footer>
    </main>

    <script>
        function removeMedicationRow(button) {
            var row = button.closest('tr');
            if (row) {
                row.parentNode.removeChild(row);
                updateMedicationNumbers();
            }
        }

        function updateMedicationNumbers() {
            var rows = document.querySelectorAll('#medicationRows tr.medication-row');
            for (var i = 0; i < rows.length; i++) {
                var numberCell = rows[i].querySelector('.row-number');
                if (numberCell) {
                    var removeButton = numberCell.querySelector('.remove-row');
                    numberCell.firstChild.nodeValue = (i + 1) + ' ';
                    if (removeButton) {
                        numberCell.appendChild(removeButton);
                    }
                }
            }
        }
    </script>
</body>
</html>
