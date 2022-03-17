<?php
session_start();
require_once './connection/connect.php';
if (!isset($_SESSION['userAuthorized']) || ($_SESSION['userAuthorized'] != true)) {
    session_destroy();
    header("location: ../login.php");
}
$cod = $_POST['bookCod'];
$sql = "DELETE FROM books WHERE b_cod = ?";
$array = array($cod);
try {
    $query = $dbh->prepare($sql);
    if ($query->execute($array)) {
        echo 'SUCCESS';
    } else {
        echo 'Error: Query failed';
    }
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
