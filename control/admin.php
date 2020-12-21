<?php
class admin {
    public function __construct()
    {
        include_once "../model/Db.php";
        include_once "load.php";
        $this->db = new Db();
        $this->load = new load();

    }
    public function login()
    { 
        $xem["admin"] = $this->db->query("select * from admin");
        $this->load->view1("admin/login",$xem);  

    }
    public function main()
    {
        $this->load->view1("admin/header");
        $this->load->view1("admin/main");
        $this->load->view1("admin/footer"); 
    }

}





?>