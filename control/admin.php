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
    public function danhmuc()
    {
        $xem["danhmuc"] = $this->db->query("SELECT * from danhmuc where parent_id = 0");
        $xem["voucher"] = $this->db->query("SELECT * from voucher");
        $this->load->view1("admin/header");
        $this->load->view1("admin/bar", $xem);
        $this->load->view1("admin/dm", $xem);
        $this->load->view1("admin/footer");
    }
    public function voucher()
    {

        $xem["voucher1"] = $this->db->query("select * from  voucher");
        $this->load->view1("admin/header");

        if (isset($_GET['id'])) {
            $xem["danhmuc"] = $this->db->query("select * from  danhmuc where parent_id = " . $_GET['id'] . "");
            if(count($xem["danhmuc"])==0){
                $xem["danhmuc"] = $this->db->query("select * from  danhmuc where id = " . $_GET['id'] . "");
            }
            if(count($xem["danhmuc"])==0){
                $xem["danhmuc"] = $this->db->query("select * from  danhmuc");
            }
            foreach($xem["danhmuc"] as $k=>$v){
                foreach($xem["voucher1"] as $ka=>$va){
                    if($va['danhmuc_id'] == $v['id']){
                        $xem['voucher'][] = $va;
                    }
                }
            }
            $this->load->view1("admin/bar",$xem);

        }
        $this->load->view1("admin/dm",$xem);
        
        $this->load->view1("admin/footer"); 
    }
    
    public function khach()
    {
        $this->load->view1("admin/header");
        $xem["user"] = $this->db->query("select * from user");
        $this->load->view1("admin/khach",$xem);

        $this->load->view1("admin/footer"); 
    }
}





?>