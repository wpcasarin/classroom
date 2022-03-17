<?php
session_start();
require_once './connection/connect.php';
if (!isset($_SESSION['userAuthorized']) || ($_SESSION['userAuthorized'] != true)) {
    session_destroy();
    header("location: ../login.php");
}
$name = $_POST['bookName'];
$author = $_POST['bookAuthor'];
$quant = $_POST['bookQuant'];
$sql = "INSERT INTO books (b_name, b_author, b_quant) VALUE (?, ?, ?)";
$array = array($name, $author, $quant);

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
