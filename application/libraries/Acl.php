<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class MY_Acl
{
		public $CI;
		public $permission=array();
		public function __construct()
		{
			$this->CI=&get_instance();
			$this->CI->load->library('session');
		}
		
		public function check_acl($menu,$action)
		{
			if((int)$this->session->userdata('userid')<=0)
			{	return false;	}
			
		}
}
