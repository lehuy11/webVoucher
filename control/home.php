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
    
    public function chitiet()
    {
        $xem["voucher"] = $this->db->query("select * from  voucher");
        $this->load->view("header");
        if (isset($_SESSION['id_danhmuc'])) {
            unset($_SESSION['id_danhmuc']);
        }

        if (isset($_GET['id'])) {
            foreach ($xem['voucher'] as $k => $v) {
                if ($_GET['id'] == $v['id']) {
                    $_SESSION['id_danhmuc'] = $v['danhmuc_id'];
                }
            }
        }


        if (isset($_SESSION['id_danhmuc'])) {
            $xem["danhmuc"] = $this->db->query("select * from  danhmuc where id = " . $_SESSION['id_danhmuc'] . "");
            $this->load->view("bar", $xem);
        }


        $this->load->view("chitiet", $xem);
        $this->load->view("footer");
    }

}
