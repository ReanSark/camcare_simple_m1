<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH.'controllers/general.php'; 

class Billing extends General{

	private $limit = 10;

	public function __construct(){
		parent::__construct();
		$this->load->model("app/billing_model");
		$this->load->model("app/opd_model");
		$this->load->model("app/patient_model");
		if(General::is_logged_in() == FALSE){
            redirect(base_url().'login');    
        }
		General::variable();	
	}

	/**
	 * Restrict billing/POS endpoints to users granted POS page access.
	 */
	private function require_pos_access(){
		$userInfo = $this->general_model->getUserLoggedIn($this->session->userdata('username'));
		if(!$userInfo || !isset($userInfo->user_role) || !General::has_rights_to_access('84', $userInfo->user_role)){
			redirect(base_url().'access_denied');
			exit;
		}
	}
	
	
	public function pointOfSale(){
		$this->require_pos_access();
		
		$this->data['patientInfo'] = $this->billing_model->loadPatientInfo($this->input->post('patiIO_IDent'));
		$this->data['particular_cat'] = $this->billing_model->particular_cat();
		
		$this->load->view("app/billing/pos",$this->data);		
		
	}
	
	public function searchPatient(){
		$this->require_pos_access();
				
		$this->session->set_userdata(array(
				 'tab'			=>		'billing',
				 'module'		=>		'pos',
				 'subtab'		=>		'',
				 'submodule'	=>		''));	
		
		$this->data['patientLists'] = $this->billing_model->getOPDPatient();
		
		$this->load->view("app/billing/searchPatient",$this->data);		
	}
	
	public function getItem($id){
		$this->require_pos_access();
		$this->data['itemList'] = $this->billing_model->itemList($id);
		$this->data['particularName'] = $this->billing_model->particularName($id);
		$this->load->view("app/billing/itemList",$this->data);	
	}	
	
	
	
	public function getRate($id){
		$this->require_pos_access();
		$this->data['getRate'] = $this->billing_model->getRate($id);
		$this->load->view("app/billing/getRate",$this->data);	
	}	
	
	
	public function save_invoice(){
		$this->require_pos_access();
		$result = $this->billing_model->saveNewInvoice();
		if ($result !== TRUE) {
			$this->session->set_flashdata('message', "<div class='alert alert-danger alert-dismissable'>".html_escape($result)."</div>");
			redirect(base_url()."app/pos");
			return;
		}
		$this->session->set_flashdata('message',"<div class='alert alert-success alert-dismissable'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>Transaction successfully Saved!</div>");
		redirect(base_url()."app/pos/saved/".$this->input->post('opd_no')."/".$this->input->post('patient_no')."/".$this->input->post('invoiceno'));
	}

	public function update_invoice(){
		$this->require_pos_access();
		$result = $this->billing_model->updateExistingInvoice();
		$invoiceNo = $this->input->post('invoiceno');
		$opdNo = $this->input->post('opd_no');
		$patientNo = $this->input->post('patient_no');

		if ($result !== TRUE) {
			$this->session->set_flashdata('message', "<div class='alert alert-danger alert-dismissable'>".html_escape($result)."</div>");
		} else {
			$this->session->set_flashdata('message', "<div class='alert alert-success alert-dismissable'>Invoice successfully updated.</div>");
		}
		redirect(base_url()."app/pos/saved/".$opdNo."/".$patientNo."/".$invoiceNo);
	}

	public function billingpdf(){
		$this->require_pos_access();
		$iop_no = $this->uri->segment("4");
		$patient_no = $this->uri->segment("5");
		$InvNo = $this->uri->segment("6");
		
		$this->load->helper('file');
        $this->load->helper('dompdf');  
		
		$this->data['getOPDPatient'] = $this->opd_model->getOPDPatient($iop_no);
		$this->data['patientInfo'] = $this->patient_model->getPatientInfo($patient_no);
		$patientInfo = $this->patient_model->getPatientInfo($patient_no);
		
		$this->data['payment_type'] = $this->billing_model->payment_type();
		$this->data['insurance_company'] = $this->billing_model->insurance_company();
		$this->data['particular_cat'] = $this->billing_model->particular_cat();
		$this->data['invoice_no'] = $this->billing_model->invoice_no();
		
		$this->data['headerInv'] = $this->billing_model->headerInv2($InvNo);
		$this->data['detailsInv'] = $this->billing_model->detailsInv2($InvNo);
		
		$filename = $InvNo."_".date("mdY");
        
        $html = $this->load->view("app/opd/printInv2",$this->data,true);		
        pdf_create($html, $filename, TRUE);
		
		
	}
	
	public function drug_list($id){
		$this->require_pos_access();
		$this->data['drug_list'] = $this->billing_model->drug_list($id);
		$this->data['medicineName'] = $this->billing_model->medicineName($id);
		$this->load->view("app/billing/drug_list",$this->data);		
	}
	
	public function getDrugRate($id){
		$this->require_pos_access();
		$this->data['getDrugRate'] = $this->billing_model->getDrugRate($id);
		$this->load->view("app/billing/getDrugRate",$this->data);	
	}
	
	
	
	
	
	
}