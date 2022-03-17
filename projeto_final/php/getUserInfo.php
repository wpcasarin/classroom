<?php
session_start();
if (!isset($_SESSION['userAuthorized']) || ($_SESSION['userAuthorized'] != true)) {
    session_destroy();
    header("location: ../login.php");
}
$userInfo = array($_SESSION['userName'], $_SESSION['userEmail'], $_SESSION['userCpf']);
$jsonData = json_encode($userInfo);
echo $jsonData;
