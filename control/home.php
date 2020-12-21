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
    }

    public function doi()
    {
        $this->load->view("header");
        $this->load->view("user");
        $this->load->view("doi");
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
    public function dm()
    {
        $xem["voucher1"] = $this->db->query("select * from  voucher");
        $this->load->view("header");
        if (isset($_GET['id'])) {
            $xem["danhmuc"] = $this->db->query("select * from  danhmuc where parent_id = " . $_GET['id'] . "");
            if (count($xem["danhmuc"]) == 0) {
                $xem["danhmuc"] = $this->db->query("select * from  danhmuc where id = " . $_GET['id'] . "");
            }
            foreach ($xem["danhmuc"] as $k => $v) {
                foreach ($xem["voucher1"] as $ka => $va) {
                    if ($va['danhmuc_id'] == $v['id']) {
                        $xem['voucher'][] = $va;
                    }
                }
            }
            $this->load->view("bar", $xem);
        }

        if (isset($xem['voucher']))
            $this->load->view("main", $xem);

        $this->load->view("footer");
    }
    public function timkiem()
    {
        $this->load->view("header");
        $xem["danhmuc"] = $this->db->query("SELECT * from danhmuc where parent_id = 0");
        $this->load->view("bar", $xem);

        if (isset($_POST['tim'])) {
            $n = trim($_POST['tim']);
            $xem["voucher"] = $this->db->query("SELECT * FROM voucher WHERE `name`like'%$n%'");
            $this->load->view("main", $xem);
        }

        $this->load->view("footer");
    }
    public function gio()
    {
        $this->load->view("header");
        $this->load->view("giohang");
        $this->load->view("footer");
    }
}
