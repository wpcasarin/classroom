<?php
session_start();
require_once './connection/connect.php';
if (!isset($_SESSION['userAuthorized']) || ($_SESSION['userAuthorized'] != true)) {
    session_destroy();
    header("location: ../login.php");
}
$cod = $_POST['bookCod'];
$name = $_POST['bookName'];
$author = $_POST['bookAuthor'];
$quant = $_POST['bookQuant'];
$sql = "UPDATE books SET b_name = ?, b_author = ?, b_quant = ? WHERE b_cod = ?";
$array = array($name, $author, $quant, $cod);

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
