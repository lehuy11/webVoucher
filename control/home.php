<?php
class home
{
    public function __construct()
    {
        include_once "model/Db.php";
        include_once "load.php";
        $this->db = new Db();
        $this->load = new load();
    }
    public function index()
    {
        $xem["danhmuc"] = $this->db->query("SELECT * from danhmuc where parent_id = 0");
        $xem["voucher"] = $this->db->query("SELECT * from voucher");
        $this->load->view("header");
        $this->load->view("bar", $xem);
        $this->load->view("main", $xem);
        $this->load->view("footer");
    }
    
}
