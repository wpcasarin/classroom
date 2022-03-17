<?php
session_start();
if(!isset($_SESSION['userAuthorized']) || ($_SESSION['userAuthorized'] != true)){
    session_destroy();
    header("location: ./login.php");
}