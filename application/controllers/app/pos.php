<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH.'controllers/general.php'; 

class Pos extends General{

	private $limit = 10;

	public function __construct(){
		parent::__construct();
		$this->load->model("app/general_model");
		$this->load->model("app/billing_model");
		$this->load->model("app/opd_model");
		$this->load->model("app/patient_model");
		if(General::is_logged_in() == FALSE){
            redirect(base_url().'login');    
        }
		General::variable();	
	}

	/**
	 * Restrict POS endpoints to users granted POS page access.
	 */
	private function require_pos_access(){
		$userInfo = $this->general_model->getUserLoggedIn($this->session->userdata('username'));
		if(!$userInfo || !isset($userInfo->user_role) || !General::has_rights_to_access('84', $userInfo->user_role)){
			redirect(base_url().'access_denied');
			exit;
		}
	}
	
	public function index(){
		$this->require_pos_access();
				
$this->posPage();
	}
	
	public function posPage(){
		$this->require_pos_access();
		$this->data['particular_cat'] = $this->billing_model->particular_cat();
		$this->data['insurance_company'] = $this->billing_model->insurance_company();
		
		$this->data['medicine_cat'] = $this->billing_model->medicine_cat();
		
		
		$this->data['reason_dicount'] = $this->general_model->reason_dicount();
		$this->data['invoice_no'] = $this->billing_model->invoice_no();
		$this->data['receipt_no2'] = $this->billing_model->receipt_no();
		
		$this->load->view("app/pos/index",$this->data);
	}

	function pos_patient($patient_no){
		$this->require_pos_access();
		$this->data['particular_cat'] = $this->billing_model->particular_cat();
		$this->data['insurance_company'] = $this->billing_model->insurance_company();
		$this->data['medicine_cat'] = $this->billing_model->medicine_cat();
		$this->data['reason_dicount'] = $this->general_model->reason_dicount();
		$this->data['invoice_no'] = $this->billing_model->invoice_no();
		$this->data['receipt_no2'] = $this->billing_model->receipt_no();
		
		$this->data['direct'] = TRUE;
		$this->data['patient_rows'] = $this->patient_model->getPatientInfo($patient_no);
		$this->load->view("app/pos/index",$this->data);
	}
	
	function test(){
		$this->require_pos_access();
		$this->data['particular_cat'] = $this->billing_model->particular_cat();
		//$this->data['itemList'] = $this->billing_model->itemList();
		
		$this->load->view("app/pos/test",$this->data);
	}
	
	public function showPatients($val = NULL){
		$this->require_pos_access();
		//$cFrom = $this->uri->segment("4");
		//$cTo = $this->uri->segment("5");
		
		$this->data['showPatients'] = $this->billing_model->showPatients($val);
		$this->load->view("app/pos/showPatients",$this->data);
		
	}
	
	public function patientDetials($id){
		$this->require_pos_access();
		
		$this->data['patientDetials'] = $this->billing_model->loadPatientInfo($id);
		$this->load->view("app/pos/patientDetials",$this->data);
		
	}

	public function getDoctorFee($invoiceno)
	{
		$this->require_pos_access();

		$result = $this->db->query("select * from doctors_fee where invoice_no = '".$invoiceno."'");
		$aso_arr = $result->row_array(); // assoc. array w/o numeric indexes
		$user_id = $aso_arr[ 'user_id' ];
		$feeType = $aso_arr[ 'feeType' ];
		$value = $aso_arr[ 'value' ];
		$totalFee = $aso_arr[ 'totalFee' ];
		$notes = $aso_arr[ 'notes' ];
		echo json_encode($aso_arr);

	}

	public function saveDoctorFee($invoiceno)
	{
		$this->require_pos_access();

		$isExist = $this->db->query("select * from doctors_fee where user_id = '".$this->input->post('doctor')."' and invoice_no = '".$invoiceno."'");

		if($isExist->num_rows == 0)
		{
			$this->data = array(
				'user_id'			=>	$this->input->post('doctor'),
				'date'				=>	date("Y-m-d"),
				'invoice_no'		=>	$invoiceno,
				'completeDate'		=>	date("Y-m-d h:i:s a"),
				'feeType'			=>	$this->input->post('cType'),
				'value'				=>	$this->input->post('valueFee'),
				'totalFee'			=>	$this->input->post('totalFee'),
				'notes'				=>	$this->input->post('notes')
			);
			$this->db->insert('doctors_fee',$this->data);
		}
		else
		{
			$this->db->query("UPDATE doctors_fee SET 
							`date` = '".date("Y-m-d")."',
							`completeDate` = '".date("Y-m-d h:i:s a")."',
							`feeType` = '".$this->input->post('cType')."',
							`value` = '".$this->input->post('valueFee')."',
							`totalFee` = '".$this->input->post('totalFee')."',
							`notes` = '".$this->input->post('notes')."' 
							WHERE user_id = '".$this->input->post('doctor')."' 
							and invoice_no = '".$invoiceno."'");
		}

		// echo $isExist->num_rows;

		

	}
	
	public function saved(){
		$this->require_pos_access();
		$iop_no = $this->uri->segment("4");
		$patient_no = $this->uri->segment("5");
		$invoiceno = $this->uri->segment("6");
		
		$this->data['getOPDPatient'] = $this->opd_model->getOPDPatient($iop_no);
		$this->data['patientInfo'] = $this->patient_model->getPatientInfo($patient_no);
		$this->data['patientDetials'] = $this->billing_model->loadPatientInfo($iop_no);
		
		$this->data['headerInv'] = $this->billing_model->headerInv($iop_no,$invoiceno);
		$this->data['detailsInv'] = $this->billing_model->detailsInv($iop_no,$invoiceno);
		
		$this->data['message'] = $this->session->flashdata('message');
		
		$this->data['payment_type'] = $this->billing_model->payment_type();
		$this->data['insurance_company'] = $this->billing_model->insurance_company();
		$this->data['particular_cat'] = $this->billing_model->particular_cat();
		$this->data['invoice_no'] = $this->billing_model->invoice_no();
		
		$this->data['medicine_cat'] = $this->billing_model->medicine_cat();
		
		$this->data['reason_dicount'] = $this->general_model->reason_dicount();
		
		if($this->billing_model->getOR($invoiceno)){
			$this->data['hasOR'] = "1";
			$OR_num = $this->billing_model->OR_num($invoiceno);
			$this->data['OR_number'] = $OR_num->receipt_no;
			$this->data['paymentReceipt'] = $OR_num;
		}else{
			$this->data['hasOR'] = "0";
			$this->data['OR_number'] = "-";
			$this->data['paymentReceipt'] = NULL;
		}
		
		
		$this->load->view("app/pos/saved",$this->data);	
		
	}
	
	public function save_payment(){
		$this->require_pos_access();
		$iop_no = trim((string)$this->input->post('opd_no'));
		$patient_no = trim((string)$this->input->post('patient_no'));
		$invoiceno = trim((string)$this->input->post('invoiceno'));
		$result = $this->billing_model->recordFullPayment(
			$invoiceno,
			$iop_no,
			$patient_no,
			$this->input->post('amountPaid'),
			$this->input->post('paymentType'),
			$this->input->post('otherPaymentMethod'),
			$this->input->post('paymentCurrency'),
			$this->input->post('exchangeRate')
		);
		if ($result === TRUE) {
			$this->session->set_flashdata('message', "<div class='alert alert-success alert-dismissable'>Payment successfully recorded. Invoice marked as PAID.</div>");
		} else {
			$this->session->set_flashdata('message', "<div class='alert alert-danger alert-dismissable'>" . html_escape($result) . "</div>");
		}
		redirect(base_url().'app/pos/saved/'.$iop_no.'/'.$patient_no.'/'.$invoiceno);
	}

	public function getPatientMedication($patientNo,$iopNo){
		$this->require_pos_access();
		$this->data['patientMedication']  = $this->billing_model->patientMedication($patientNo,$iopNo);
		$this->load->view("app/pos/getpatientMedication",$this->data);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}