<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class Billing_model extends CI_Model{
	
	public function __construct(){
		parent::__construct();	
	}
	
	public function getOPDPatient(){
		$this->db->select("
			A.IO_ID,
			concat(B.firstname,' ',B.lastname) as patient
		",false);
		$this->db->order_by("B.lastname","ASC");
		$this->db->where(array(
			'A.nStatus'		=>		'Pending',
			'A.InActive'	=>		0
		));
		$this->db->join("patient_personal_info B","B.patient_no = A.patient_no","left outer");
		$query = $this->db->get("patient_details_iop A");
		return $query->result();	
	}
	
	
	public function loadPatientInfo($IO_ID){
		$this->db->select("
				A.IO_ID,
				A.patient_no,
				A.patient_type,
				B.picture,
				A.date_visit,
				A.time_visit,
				B.age,
				concat(B.firstname,' ',B.lastname) as patient
		",false);
		$this->db->where("A.IO_ID", $IO_ID);
		$this->db->join("patient_personal_info B","B.patient_no = A.patient_no","left outer");
		$query = $this->db->get("patient_details_iop A");
		return $query->row();
	}
	
	
	public function particular_cat(){
		$this->db->order_by("group_name","ASC");
		$this->db->where("InActive","0");	
		$query = $this->db->get("bill_group_name");
		return $query->result();
	}
	
	public function itemList($id){
		$this->db->order_by("particular_name","ASC");
		$this->db->where(array(
			'InActive'		=>		0,
			'group_id'		=>		$id
		));	
		$query = $this->db->get("bill_particular");
		return $query->result();
	}
	
	public function particularName($id){
		$this->db->select("group_name");
		$this->db->where('group_id',$id);	
		$query = $this->db->get("bill_group_name");
		return $query->row();
	}
	
	public function getRate($id){
		$this->db->select("charge_amount,particular_name");
		$query = $this->db->get_where("bill_particular",array('particular_id' => $id));	
		return $query->row();
	}
	
	public function insurance_company(){
		$this->db->order_by("company_name","ASC");	
		$query = $this->db->get_where("insurance_comp", array('InActive' => '0'));
		return $query->result();
	}
	
	public function payment_type(){
		$this->db->order_by("cValue","ASC");	
		$query = $this->db->get_where("system_parameters", array('cCode' => 'payment_type', 'InActive' => '0'));
		return $query->result();
	}
	
	public function invoice_no(){
		$this->db->select("(cValue + 1) as invoice_no");
		$this->db->where("cCode","invoice_no");
		$query = $this->db->get("system_option");	
		return $query->row();	
	}
	
	public function receipt_no(){
		$this->db->select("(cValue + 1) as receipt_no");
		$this->db->where("cCode","receipt_no");
		$query = $this->db->get("system_option");	
		return $query->row();	
	}
	
	/** Validate a percentage input used by invoice and item discounts. */
	private function validatedDiscountPercent($raw, $label){
		$value = trim((string)$raw);
		if ($value === '' || !preg_match('/^\\d+(\\.\\d{1,2})?$/', $value)) {
			return $label.' must be a number between 0 and 100.';
		}
		$percent = (float)$value;
		if ($percent < 0 || $percent > 100) {
			return $label.' must be between 0 and 100%.';
		}
		return round($percent, 2);
	}

	/**
	 * Create a new invoice using catalogue prices from the database.
	 * Browser-submitted rate, amount, subtotal and total are never trusted.
	 */
	public function saveNewInvoice(){
		$opdNo = trim((string)$this->input->post('opd_no'));
		$patientNo = trim((string)$this->input->post('patient_no'));
		$invoiceNo = trim((string)$this->input->post('invoiceno'));
		$rowCount = $this->input->post('hdnrowcnt');
		$counter = $this->input->post('invoiceno2');

		if ($opdNo === '' || $patientNo === '' || $invoiceNo === '' || !ctype_digit((string)$rowCount) || (int)$rowCount < 1 || (int)$rowCount > 200) {
			return 'Invalid invoice or item information.';
		}

		$visit = $this->db->get_where('patient_details_iop', array('IO_ID' => $opdNo, 'patient_no' => $patientNo, 'InActive' => 0))->row();
		if (!$visit) return 'The selected patient visit could not be verified.';

		$details = array();
		$subtotal = 0.0;
		for ($i = 1; $i <= (int)$rowCount; $i++) {
			$type = trim((string)$this->input->post('item_type'.$i));
			$itemId = trim((string)$this->input->post('item_id'.$i));
			$qtyRaw = trim((string)$this->input->post('qty'.$i));
			if (!in_array($type, array('particular', 'medicine', 'room', 'surgery'), true) || !ctype_digit($itemId) || (int)$itemId < 1 || !is_numeric($qtyRaw) || (float)$qtyRaw <= 0 || floor((float)$qtyRaw) != (float)$qtyRaw || (float)$qtyRaw > 100000) {
				return 'Invalid item source or quantity on row '.$i.'. Please remove the row and add it again.';
			}

			if ($type === 'particular') {
				$item = $this->db->get_where('bill_particular', array('particular_id' => (int)$itemId, 'InActive' => 0))->row();
				if (!$item) return 'A selected billing item is no longer available. Please refresh and add it again.';
				$name = $item->particular_name; $rate = (float)$item->charge_amount;
			} elseif ($type === 'medicine') {
				$item = $this->db->get_where('medicine_drug_name', array('drug_id' => (int)$itemId, 'InActive' => 0))->row();
				if (!$item) return 'A selected medicine is no longer available. Please refresh and add it again.';
				$name = $item->drug_name; $rate = (float)$item->nPrice;
			} elseif ($type === 'room') {
				$item = $this->db->get_where('room_master', array('room_master_id' => (int)$itemId))->row();
				if (!$item) return 'A selected room charge is no longer available.';
				$name = 'Rm. '.$item->room_name; $rate = (float)$item->room_rates;
			} else {
				$item = $this->db->get_where('surgical_package', array('surgery_id' => (int)$itemId))->row();
				if (!$item) return 'A selected operation package is no longer available.';
				$name = $item->surgery_name; $rate = (float)$item->total_costs;
			}

			if ($rate < 0) return 'Invalid catalogue price on row '.$i.'.';
			$discountPercent = $this->validatedDiscountPercent($this->input->post('discount_percent'.$i), 'Item discount on row '.$i);
			if (!is_numeric($discountPercent)) return $discountPercent;

			$qty = (int)$qtyRaw;
			$gross = round($qty * $rate, 2);
			$discountAmount = round($gross * ((float)$discountPercent / 100), 2);
			$amount = round($gross - $discountAmount, 2);
			$subtotal += $amount;
			$details[] = array(
				'invoice_no' => $invoiceNo, 'iop_id' => $opdNo, 'bill_name' => $name,
				'qty' => $qty, 'rate' => $rate, 'amount' => $amount,
				'discount_percent' => $discountPercent, 'discount_amount' => $discountAmount,
				'note' => (string)$this->input->post('note'.$i),
				'isPackage' => ($type === 'surgery' ? 1 : 0), 'item_type' => $type,
				'item_id' => (int)$itemId, 'InActive' => 0
			);
		}

		$subtotal = round($subtotal, 2);
		$invoiceDiscountPercent = $this->validatedDiscountPercent($this->input->post('discount_percent'), 'Invoice discount');
		if (!is_numeric($invoiceDiscountPercent)) return $invoiceDiscountPercent;
		$discount = round($subtotal * ((float)$invoiceDiscountPercent / 100), 2);
		$total = round($subtotal - $discount, 2);

		$this->db->trans_begin();
		$header = array(
			'iop_id' => $opdNo, 'patient_no' => $patientNo,
			'payment_type' => $this->input->post('paymentType'),
			'invoice_no' => $invoiceNo, 'dDate' => date('Y-m-d'),
			'discount' => $discount, 'discount_percent' => $invoiceDiscountPercent,
			'reason_discount' => $this->input->post('reason_dicount'),
			'sub_total' => $subtotal, 'total_amount' => $total,
			'total_purchased' => count($details), 'creditCardNo' => $this->input->post('creditCardNo'),
			'creditCardHolder' => '', 'insurance_company' => $this->input->post('insurance_company'),
			'remarks' => $this->input->post('remarks'), 'InActive' => 0
		);
		$this->db->insert('iop_billing', $header);
		if ($this->db->affected_rows() !== 1) { $this->db->trans_rollback(); return 'Unable to save invoice header.'; }
		foreach ($details as $detail) {
			$this->db->insert('iop_billing_t', $detail);
			if ($this->db->affected_rows() !== 1) { $this->db->trans_rollback(); return 'Unable to save all invoice items. No invoice changes were kept.'; }
		}
		if (is_numeric($counter) && (int)$counter > 0) {
			$this->db->where('cCode', 'invoice_no')->update('system_option', array('cValue' => (int)$counter));
		}
		if ($this->db->trans_status() === FALSE) { $this->db->trans_rollback(); return 'Invoice could not be saved. No invoice changes were kept.'; }
		$this->db->trans_commit();
		return TRUE;
	}

	/**
	 * Update an existing unpaid invoice safely.
	 * All item prices and names are reloaded from their catalogue source.
	 */
	public function updateExistingInvoice(){
		$invoiceNo = trim((string)$this->input->post('invoiceno'));
		$opdNo = trim((string)$this->input->post('opd_no'));
		$patientNo = trim((string)$this->input->post('patient_no'));
		$rowCount = $this->input->post('hdnrowcnt');
		$rowCountNumeric = is_numeric($rowCount) ? (float)$rowCount : 0;
		if ($invoiceNo === '' || $opdNo === '' || $patientNo === '' || $rowCountNumeric < 1 || floor($rowCountNumeric) != $rowCountNumeric || $rowCountNumeric > 200) {
			return 'Invalid invoice or item information. Please refresh the invoice and try again.';
		}
		$rowCount = (int)$rowCountNumeric;

		$details = array();
		$subtotal = 0.0;
		for ($i = 1; $i <= $rowCount; $i++) {
			$type = trim((string)$this->input->post('item_type'.$i));
			$itemId = trim((string)$this->input->post('item_id'.$i));
			$qtyRaw = trim((string)$this->input->post('qty'.$i));
			if (!in_array($type, array('particular', 'medicine', 'room', 'surgery'), true) || !ctype_digit($itemId) || (int)$itemId < 1 || !is_numeric($qtyRaw) || (float)$qtyRaw <= 0 || floor((float)$qtyRaw) != (float)$qtyRaw || (float)$qtyRaw > 100000) {
				return 'Invalid item source or quantity on row '.$i.'. Please remove the row and add it again.';
			}

			if ($type === 'particular') {
				$item = $this->db->get_where('bill_particular', array('particular_id' => (int)$itemId, 'InActive' => 0))->row();
				if (!$item) return 'A selected billing item is no longer available.';
				$name = $item->particular_name; $rate = (float)$item->charge_amount;
			} elseif ($type === 'medicine') {
				$item = $this->db->get_where('medicine_drug_name', array('drug_id' => (int)$itemId, 'InActive' => 0))->row();
				if (!$item) return 'A selected medicine is no longer available.';
				$name = $item->drug_name; $rate = (float)$item->nPrice;
			} elseif ($type === 'room') {
				$item = $this->db->get_where('room_master', array('room_master_id' => (int)$itemId))->row();
				if (!$item) return 'A selected room charge is no longer available.';
				$name = 'Rm. '.$item->room_name; $rate = (float)$item->room_rates;
			} else {
				$item = $this->db->get_where('surgical_package', array('surgery_id' => (int)$itemId))->row();
				if (!$item) return 'A selected operation package is no longer available.';
				$name = $item->surgery_name; $rate = (float)$item->total_costs;
			}

			if ($rate < 0) return 'Invalid catalogue price on row '.$i.'.';
			$discountPercent = $this->validatedDiscountPercent($this->input->post('discount_percent'.$i), 'Item discount on row '.$i);
			if (!is_numeric($discountPercent)) return $discountPercent;
			$qty = (int)$qtyRaw;
			$gross = round($qty * $rate, 2);
			$discountAmount = round($gross * ((float)$discountPercent / 100), 2);
			$amount = round($gross - $discountAmount, 2);
			$subtotal += $amount;
			$details[] = array(
				'invoice_no' => $invoiceNo, 'iop_id' => $opdNo, 'bill_name' => $name,
				'qty' => $qty, 'rate' => $rate, 'amount' => $amount,
				'discount_percent' => $discountPercent, 'discount_amount' => $discountAmount,
				'note' => (string)$this->input->post('note'.$i),
				'isPackage' => ($type === 'surgery' ? 1 : 0),
				'item_type' => $type, 'item_id' => (int)$itemId, 'InActive' => 0
			);
		}

		$subtotal = round($subtotal, 2);
		$invoiceDiscountPercent = $this->validatedDiscountPercent($this->input->post('discount_percent'), 'Invoice discount');
		if (!is_numeric($invoiceDiscountPercent)) return $invoiceDiscountPercent;
		$discount = round($subtotal * ((float)$invoiceDiscountPercent / 100), 2);
		$total = round($subtotal - $discount, 2);

		$this->db->trans_begin();
		$header = $this->db->query(
			"SELECT * FROM iop_billing WHERE invoice_no = ? AND iop_id = ? AND patient_no = ? AND InActive = 0 FOR UPDATE",
			array($invoiceNo, $opdNo, $patientNo)
		)->row();
		if (!$header) { $this->db->trans_rollback(); return 'Invoice not found or is no longer active.'; }

		$receipt = $this->db->get_where('iop_receipt', array('invoice_no' => $invoiceNo))->row();
		$receiptRef = isset($header->receipt_no) ? trim((string)$header->receipt_no) : '';
		if ($receipt || ($receiptRef !== '' && $receiptRef !== '-')) {
			$this->db->trans_rollback();
			return 'This invoice has a payment or receipt and can no longer be edited.';
		}
		$visit = $this->db->get_where('patient_details_iop', array('IO_ID' => $opdNo, 'patient_no' => $patientNo, 'InActive' => 0))->row();
		if (!$visit) { $this->db->trans_rollback(); return 'The patient visit could not be verified.'; }

		$headerUpdate = array(
			'discount' => $discount, 'discount_percent' => $invoiceDiscountPercent,
			'reason_discount' => $this->input->post('reason_dicount'),
			'sub_total' => $subtotal, 'total_amount' => $total,
			'total_purchased' => count($details), 'remarks' => $this->input->post('remarks')
		);
		$this->db->where('invoice_no', $invoiceNo)->where('iop_id', $opdNo)->where('patient_no', $patientNo)->update('iop_billing', $headerUpdate);
		if ($this->db->trans_status() === FALSE) { $this->db->trans_rollback(); return 'Invoice update failed. No changes were kept.'; }

		$this->db->where('invoice_no', $invoiceNo)->delete('iop_billing_t');
		if ($this->db->trans_status() === FALSE) { $this->db->trans_rollback(); return 'Unable to replace invoice items. No changes were kept.'; }
		foreach ($details as $detail) {
			$this->db->insert('iop_billing_t', $detail);
			if ($this->db->affected_rows() !== 1 || $this->db->trans_status() === FALSE) {
				$this->db->trans_rollback();
				return 'Unable to save all invoice items. No changes were kept.';
			}
		}
		if ($this->db->trans_status() === FALSE) { $this->db->trans_rollback(); return 'Invoice update failed. No changes were kept.'; }
		$this->db->trans_commit();
		return TRUE;
	}

	public function checkInvoice($iop_no){
		$this->db->where(array(
			'iop_id'		=>		$iop_no,
			'InActive'		=>		0
		));
		$query = $this->db->get("iop_billing");
		if($query->num_rows() > 0){
			return true;
		}else{
			return false;
		}
	}
	
	public function headerInv($iop_no,$invoiceno){
		$this->db->where(array(
			'iop_id'		=>		$iop_no,
			'invoice_no'	=>		$invoiceno
		));
		$query = $this->db->get('iop_billing');
		return $query->row();
	}
	
	public function detailsInv($iop_no,$invoiceno){
		$this->db->where(array(
			'iop_id'	=>		$iop_no,
			'invoice_no'	=>		$invoiceno
		));
		$this->db->order_by("id","ASC");
		$query = $this->db->get('iop_billing_t');
		return $query->result();
	}
	
	public function headerInv2($InvNo){
		$this->db->where(array(
			'invoice_no'	=>		$InvNo
		));
		$query = $this->db->get('iop_billing');
		return $query->row();
	}
	
	public function detailsInv2($InvNo){
		$this->db->where(array(
			'invoice_no'	=>		$InvNo
		));
		$this->db->order_by("id","ASC");
		$query = $this->db->get('iop_billing_t');
		return $query->result();
	}
	
	public function showPatients($val){
		$this->db->select("
				A.IO_ID,
				A.patient_no,
				A.patient_type,
				B.picture,
				A.date_visit,
				A.time_visit,
				B.age,
				concat(B.firstname,' ',B.lastname) as patient
		",false);
		$where = "A.nStatus = 'Pending' and 
			(
				A.IO_ID like '%".$val."%' or 
				A.patient_no like '%".$val."%' or 
				A.patient_type like '%".$val."%' or 
				B.firstname like '%".$val."%' or 
				B.lastname like '%".$val."%'
			)
			";
		$this->db->where($where);
		$this->db->order_by("A.IO_ID","ASC");
		$this->db->join("patient_personal_info B","B.patient_no = A.patient_no","left outer");
		$query = $this->db->get("patient_details_iop A");
		return $query->result();
	}
	
	/** Record a full payment; totals and receipt numbering are server-authoritative. */
	public function recordFullPayment($invoiceNo, $opdNo, $patientNo, $amountPaidRaw, $paymentType, $otherMethod, $paymentCurrency, $exchangeRateRaw){
		$invoiceNo = trim((string)$invoiceNo);
		$opdNo = trim((string)$opdNo);
		$patientNo = trim((string)$patientNo);
		$paymentType = trim((string)$paymentType);
		$otherMethod = trim((string)$otherMethod);
		$paymentCurrency = strtoupper(trim((string)$paymentCurrency));
		$allowedMethods = array('cash', 'bank_transfer', 'khqr', 'card', 'other');
		if ($invoiceNo === '' || $opdNo === '' || $patientNo === '') return 'Invalid invoice or patient information.';
		if (!in_array($paymentType, $allowedMethods, true)) return 'Please select a valid payment method.';
		if ($paymentType === 'other' && $otherMethod === '') return 'Please describe the other payment method.';
		if (strlen($otherMethod) > 100) return 'The other payment method description is too long.';
		if (!in_array($paymentCurrency, array('USD', 'KHR'), true)) return 'Please select USD or KHR as the payment currency.';

		$amountPaidRaw = trim((string)$amountPaidRaw);
		if ($paymentCurrency === 'USD') {
			if (!preg_match('/^\\d+(\\.\\d{1,2})?$/', $amountPaidRaw)) return 'Enter a valid USD amount with no more than two decimal places.';
		} else {
			if (!preg_match('/^\\d+$/', $amountPaidRaw)) return 'KHR payment must be entered as a whole-Riel amount.';
			if (((int)$amountPaidRaw % 100) !== 0) return 'KHR payment must be a multiple of 100 Riel.';
		}
		$amountPaid = (float)$amountPaidRaw;
		if ($amountPaid <= 0) return 'Amount paid must be greater than zero.';
		if ($amountPaid > 999999999.99) return 'Amount paid exceeds the supported receipt amount.';

		if ($paymentCurrency === 'USD') {
			$exchangeRate = 1.0000;
		} else {
			$exchangeRateRaw = trim((string)$exchangeRateRaw);
			if (!preg_match('/^\\d+(\\.\\d{1,4})?$/', $exchangeRateRaw)) return 'Enter a valid exchange rate with no more than four decimal places.';
			$exchangeRate = round((float)$exchangeRateRaw, 4);
			if ($exchangeRate <= 0 || $exchangeRate > 99999999.9999) return 'Exchange rate must be greater than zero and within the supported range.';
		}

		$this->db->trans_begin();
		$invoice = $this->db->query(
			"SELECT * FROM iop_billing WHERE invoice_no = ? AND iop_id = ? AND patient_no = ? AND InActive = 0 FOR UPDATE",
			array($invoiceNo, $opdNo, $patientNo)
		)->row();
		if (!$invoice) { $this->db->trans_rollback(); return 'Invoice not found or is no longer active.'; }
		$receiptRef = isset($invoice->receipt_no) ? trim((string)$invoice->receipt_no) : '';
		$existingReceipt = $this->db->get_where('iop_receipt', array('invoice_no' => $invoiceNo))->row();
		if ($existingReceipt || ($receiptRef !== '' && $receiptRef !== '-')) {
			$this->db->trans_rollback();
			return 'This invoice has already been paid.';
		}
		$visit = $this->db->get_where('patient_details_iop', array('IO_ID' => $opdNo, 'patient_no' => $patientNo, 'InActive' => 0))->row();
		if (!$visit) { $this->db->trans_rollback(); return 'The patient visit could not be verified.'; }

		$totalAmount = round((float)$invoice->total_amount, 2);
		if ($totalAmount <= 0) { $this->db->trans_rollback(); return 'This invoice has an invalid total and cannot be paid.'; }
		if ($paymentCurrency === 'USD') {
			$amountDue = $totalAmount;
		} else {
			$amountDue = round(($totalAmount * $exchangeRate) / 100) * 100;
		}
		if ($amountPaid < $amountDue) {
			$this->db->trans_rollback();
			return 'Full payment is required. Amount received must be at least the amount due.';
		}
		$change = ($paymentCurrency === 'USD')
			? round($amountPaid - $amountDue, 2)
			: round($amountPaid - $amountDue, 0);

		$counterRows = $this->db->query("SELECT option_id, cValue FROM system_option WHERE cCode = ? FOR UPDATE", array('receipt_no'))->result();
		if (count($counterRows) !== 1) { $this->db->trans_rollback(); return 'Receipt numbering is not configured correctly. Please contact the administrator.'; }
		$counter = $counterRows[0];
		if (!is_numeric($counter->cValue) || (int)$counter->cValue < 0) { $this->db->trans_rollback(); return 'Receipt numbering is invalid. Please contact the administrator.'; }
		$nextReceiptNo = (int)$counter->cValue + 1;
		$receiptNo = 'OR-' . str_pad((string)$nextReceiptNo, 6, '0', STR_PAD_LEFT);
		$remarks = ($paymentType === 'other') ? 'Other payment method: ' . $otherMethod : '';
		$receiptData = array(
			'receipt_no' => $receiptNo, 'invoice_no' => $invoiceNo,
			'dDate' => date('Y-m-d H:i:s'), 'iop_id' => $opdNo, 'patient_no' => $patientNo,
			'payment_type' => $paymentType, 'total_amount' => $totalAmount,
			'change' => $change, 'amountPaid' => $amountPaid,
			'payment_currency' => $paymentCurrency, 'exchange_rate' => $exchangeRate,
			'total_purchased' => $invoice->total_purchased, 'discount' => $invoice->discount,
			'subtotal' => $invoice->sub_total, 'creditCardNo' => '',
			'creditCardHolder' => '', 'insurance_company' => '', 'remarks' => $remarks, 'InActive' => 0
		);
		$this->db->insert('iop_receipt', $receiptData);
		if ($this->db->affected_rows() !== 1 || $this->db->trans_status() === FALSE) {
			$this->db->trans_rollback();
			return 'Payment could not be recorded. No payment changes were kept.';
		}
		$this->db->where(array('invoice_no' => $invoiceNo, 'iop_id' => $opdNo, 'patient_no' => $patientNo, 'InActive' => 0));
		$this->db->update('iop_billing', array('receipt_no' => $receiptNo));
		if ($this->db->affected_rows() !== 1 || $this->db->trans_status() === FALSE) {
			$this->db->trans_rollback();
			return 'Payment could not be linked to the invoice. No payment changes were kept.';
		}
		$this->db->where('option_id', $counter->option_id)->update('system_option', array('cValue' => $nextReceiptNo));
		if ($this->db->affected_rows() !== 1 || $this->db->trans_status() === FALSE) {
			$this->db->trans_rollback();
			return 'Receipt number could not be updated. No payment changes were kept.';
		}
		if ($this->db->trans_status() === FALSE) { $this->db->trans_rollback(); return 'Payment failed. No payment changes were kept.'; }
		$this->db->trans_commit();
		return TRUE;
	}

	public function getOR($invoiceno){
		$query = $this->db->get_where('iop_receipt',array('invoice_no' => $invoiceno));
		if($query->num_rows() > 0){
			return true;
		}else{
			return false;
		}
	}
	
	public function OR_num($invoiceno){
		$query = $this->db->get_where('iop_receipt', array('invoice_no' => $invoiceno));	
		return $query->row();
	}
	
	public function medicine_cat(){
		$query = $this->db->get_where("medicine_category", array('InActive' => 0));	
		return $query->result();
	}
	
	public function drug_list($id){
		$query = $this->db->get_where("medicine_drug_name", array(
			'InActive' 		=> 	0,
			'med_cat_id'	=>	$id));	
		return $query->result();
	}
	
	public function medicineName($id){
		$query = $this->db->get_where("medicine_category", array('cat_id' => $id));	
		return $query->row();
	}
	
	public function getDrugRate($id){
		$this->db->select("nPrice,drug_name");
		$query = $this->db->get_where("medicine_drug_name",array('drug_id' => $id));	
		return $query->row();
	}
	
	
	public function patientMedication($patientNo,$iopNo){
		$queries = array();
		$queries[] = "SELECT B.drug_id AS item_id, B.drug_name AS drug_name, B.nPrice AS nPrice, A.total_qty AS total_qty, '0' AS isPackage, 'medicine' AS item_type FROM iop_medication A INNER JOIN medicine_drug_name B ON B.drug_id = A.medicine_id WHERE A.iop_id = ? AND A.InActive = 0 AND B.InActive = 0";
		$queries[] = "SELECT B.room_master_id AS item_id, CONCAT('Rm. ',B.room_name) AS drug_name, B.room_rates AS nPrice, 1 AS total_qty, '0' AS isPackage, 'room' AS item_type FROM iop_room_transfer A INNER JOIN room_master B ON B.room_master_id = A.room_master_id WHERE A.iop_id = ? AND A.InActive = 0";
		$queries[] = "SELECT B.particular_id AS item_id, B.particular_name AS drug_name, B.charge_amount AS nPrice, A.qty AS total_qty, '0' AS isPackage, 'particular' AS item_type FROM iop_bed_side_procedure A INNER JOIN bill_particular B ON B.particular_id = A.cItem_id WHERE A.iop_id = ? AND A.InActive = 0 AND B.InActive = 0";
		$queries[] = "SELECT B.surgery_id AS item_id, B.surgery_name AS drug_name, B.total_costs AS nPrice, 1 AS total_qty, '1' AS isPackage, 'surgery' AS item_type FROM iop_operation_theater A INNER JOIN surgical_package B ON B.surgery_id = A.operation_name WHERE A.iop_id = ? AND A.InActive = 0";
		$sql = implode(' UNION ALL ', $queries);
		$query = $this->db->query($sql, array($iopNo, $iopNo, $iopNo, $iopNo));
		return $query->result();
	}

	public function getAll($limit = 10, $offset = 0){
		$this->db->select("
					A.invoice_no,
					A.receipt_no,
					A.iop_id,
					A.patient_no,
					A.dDate,
					A.total_amount,
					A.total_purchased,
					concat(B.firstname,' ',B.lastname) as patient
					",false);
		$where = "(
				A.invoice_no like '%".$this->input->post('search')."%' or 
				A.iop_id like '%".$this->input->post('search')."%' or 
				A.patient_no like '%".$this->input->post('search')."%' or 
				B.firstname like '%".$this->input->post('search')."%' or
				B.lastname like '%".$this->input->post('search')."%'
				) and 
				A.dDate between '".$this->input->post('cFrom')."' and '".$this->input->post('cTo')."' 
				and A.InActive = 0";
		$this->db->where($where);
		$this->db->order_by('A.invoice_no','asc');
		$this->db->join("patient_personal_info B","B.patient_no = A.patient_no","left outer");
		$query = $this->db->get("iop_billing A", $limit, $offset);
		return $query->result();
	}
	
	
	
	
	
	
	
	
	
	
	
}