<?php foreach ($patientMedication as $item) { ?>
<script>
(function () {
 var table = window.opener.document.getElementById('myTable');
 var rowNo = table.getElementsByTagName('tr').length;
 var itemName = <?php echo json_encode($item->drug_name); ?>;
 var itemType = <?php echo json_encode($item->item_type); ?>;
 var itemId = <?php echo (int)$item->item_id; ?>;
 var qty = <?php echo (int)$item->total_qty; ?>;
 var rate = <?php echo json_encode((float)$item->nPrice); ?>;
 var packageFlag = <?php echo (int)$item->isPackage; ?>;
 var amount = (qty * Number(rate)).toFixed(2);
 var row = table.insertRow(-1);
 var cells = []; for (var i=0;i<7;i++) cells.push(row.insertCell(i));
 cells[0].innerHTML = '<input type="hidden" name="isPackage'+rowNo+'" id="isPackage'+rowNo+'" value="'+packageFlag+'"><input type="hidden" name="item_type'+rowNo+'" id="item_type'+rowNo+'" value="'+itemType+'"><input type="hidden" name="item_id'+rowNo+'" id="item_id'+rowNo+'" value="'+itemId+'"><input type="text" style="width:98%;text-align:right" name="id'+rowNo+'" id="id'+rowNo+'" value="'+rowNo+'." readonly>';
 cells[1].innerHTML = '<input type="text" style="width:98%" name="bill_name'+rowNo+'" id="bill_name'+rowNo+'" value="'+ String(itemName).replace(/[&<>\"']/g, function (c) { return {'&':'&amp;','<':'&lt;','>':'&gt;','\"':'&quot;',"'":'&#39;'}[c]; }) +'" readonly>';
 cells[2].innerHTML = '<input type="text" style="width:98%;text-align:right" name="qty'+rowNo+'" id="qty'+rowNo+'" class="'+rowNo+'" value="'+qty+'" onBlur="return validate_input(this.className,\'qty\')" onkeyup="validate_gross(this.className,\'qty\')" onkeypress="return isNumberKey(event)">';
 cells[3].innerHTML = '<input type="text" style="width:98%;text-align:right;background:#F9F9F9" name="rate'+rowNo+'" id="rate'+rowNo+'" value="'+Number(rate).toFixed(2)+'" readonly>';
 cells[4].innerHTML = '<input type="text" style="width:98%;text-align:right" name="amount'+rowNo+'" id="amount'+rowNo+'" value="'+amount+'" readonly>';
 cells[5].innerHTML = '<input type="text" style="width:98%" name="note'+rowNo+'" id="note'+rowNo+'" value="">';
 cells[6].innerHTML = '<img src="<?php echo base_url()?>public/img/b_drop.png" onclick="deleteRow(this)" style="cursor:pointer;">';
 window.opener.document.getElementById('hdnrowcnt').value = rowNo; window.opener.getGross();
})();
</script>
<?php } ?>
<script>window.opener.closeModal(); window.close();</script>
