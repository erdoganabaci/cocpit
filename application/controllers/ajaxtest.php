<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class ajaxtest extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();

        // $this->not_logged_in();

        // $this->data['page_title'] = 'Products';

        $this->load->model('model_products');
        $this->load->model('model_brands');
        $this->load->model('model_category');
        $this->load->model('model_stores');
        $this->load->model('model_attributes');
    }
    public function index()
    {
        $this->load->view("blueline/siparis/ajaxtest");
    }


    public function fetchProductData()
    {
        $result = array('data' => array());

        $data = $this->model_products->getProductData();

        foreach ($data as $key => $value) {

            $store_data = $this->model_stores->getStoresData($value['store_id']);
            // button
            $buttons = '';

            $buttons .= '<a href="'.site_url('/products/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';



            $buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';



            $img = '<img src="'.base_url($value['image']).'" alt="'.$value['name'].'" class="img-circle" width="50" height="50" />';

            $availability = ($value['availability'] == 1) ? '<span class="label label-success">Active</span>' : '<span class="label label-warning">Inactive</span>';

            $qty_status = '';
            if($value['qty'] <= 10) {
                $qty_status = '<span class="label label-warning">Low !</span>';
            } else if($value['qty'] <= 0) {
                $qty_status = '<span class="label label-danger">Out of stock !</span>';
            }


            $result['data'][$key] = array(
                $img,
                $value['sku'],
                $value['name'],
                $value['price'],
                $value['qty'] . ' ' . $qty_status,
                $store_data['name'],
                $availability,
                $buttons
            );
        } // /foreach

        echo json_encode($result);
        // return response()->json($result);

    }


}
