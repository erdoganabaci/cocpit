<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class AttributesAddValue extends Admin_Controller
{
    public function __construct()
    {
        parent::__construct();

        // $this->not_logged_in();

        //$this->data['page_title'] = 'Products';

        $this->load->model('model_attributes');
    }

    /*
    * It only redirects to the manage product page
    */
    public function index()
    {
        /*if(!in_array('viewProduct', $this->permission)) {
            redirect('dashboard', 'refresh');
        }*/
        //render templatede html head js dosyaları kayıyıor en alta source koddan bak görürsün.
        //$this->render_template('products/index', $this->data);
        //$this->content_view = 'products/create';

        //$this->content_view = 'products/index';
        //$this->render_template('blueline/products/index',$this->data);


    }

    public function addvalue($attribute_id = null)
    {

        if(!$attribute_id) {
            redirect('dashboard', 'refresh');
        }

        $this->data['attribute_data'] = $this->model_attributes->getAttributeData($attribute_id);
        //$this->render_template('blueline/attributes/index', $this->data);
        //print_r($this->data['attribute_data']);
        //$this->load->view('blueline/attributes/addvalue', $this->data);
        //$this->content_view = 'blueline/attributes/addvalue';
        $this->render_template('blueline/attributes/addvalue', $this->data);


    }

}