<?php
class load
{
    public function __construct()
    {
        
    }
    public function view($finame, $xem=null)
    {
        include "./views/".$finame.".php";
    }

    public function view1($finame, $xem=null)
    {
        include "../views/".$finame.".php";
    }

}



?>