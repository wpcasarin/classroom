<?php
session_start();
if(!isset($_SESSION['autorizado']) || ($_SESSION['autorizado'] != true)){
    session_destroy();
    header("location: ./login.php");
}