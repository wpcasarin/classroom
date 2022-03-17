<?php
session_start();
require_once './connection/connect.php';
if (!isset($_SESSION['userAuthorized']) || ($_SESSION['userAuthorized'] != true)) {
    session_destroy();
    header("location: ../login.php");
}


$imgData = file_get_contents($_FILES['file']['tmp_name']);

$cod = $_SESSION['userEmail'];
$sql = "UPDATE users SET u_img = ? WHERE u_email = ?";
$array = array($imgData, $cod);
try {
    $query = $dbh->prepare($sql);
    if ($query->execute($array)) {
        echo 'SUCESS';
    } else {
        echo 'Error: Query failed';
    }
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
