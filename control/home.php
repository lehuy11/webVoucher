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
    public function dangnhap()
    {

        unset($_SESSION['name']);

        $xem["user"] = $this->db->query("select * from  user");

        $this->load->view("header");
        $this->load->view("login", $xem);
        $this->load->view("footer");
    }
    public function dangky()
    {

        $xem["user"] = $this->db->query("select * from  user");
        $this->load->view("header");
        $this->load->view("dangky", $xem);
        $this->load->view("footer");
    }
    public function user()
    {
        $xem["user"] = $this->db->query("select * from  user");
        $check = true;
        foreach ($xem["user"] as $k => $v) {
            if ($_SESSION["name"] == $v['name']) {
                $check = false;
            }
        }
        if (isset($_SESSION["check"]) &&  $check == true) {
            $created = date('Y/m/d H:i:s ', time());
            $data  = array(
                'name' => $_SESSION["name"],
                'email' => $_SESSION["user_mail"],
                'password' => $_SESSION["user_pass"],
                'phone' => $_SESSION["user_phone"],
                'address' => $_SESSION["user_ar"],
                'created' => $created
            );
            $this->db->them("user", $data);
        }
        $this->load->view("header");
        $this->load->view("user");
        $this->load->view("lichsu");
        $this->load->view("footer");
    }

}
