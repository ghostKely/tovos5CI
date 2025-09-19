<?php 
    if ($this->session->has_userdata('logValue')) {
        $value = $this->session->userdata('logValue');
        $navbarUser = "component/navbar/Navbar_".$value;
        $this->load->view($navbarUser);
    } else {
        $this->load->view('component/navbar/Navbar_Home');
    }
?>