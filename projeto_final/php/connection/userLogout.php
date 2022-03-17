<?php
session_start();
unset($_SESSION['userAuthorized']);
session_destroy();
header('location: ../../login.php');