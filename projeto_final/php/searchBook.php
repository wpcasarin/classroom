<?php
session_start();
require_once './connection/connect.php';
if (!isset($_SESSION['userAuthorized']) || ($_SESSION['userAuthorized'] != true)) {
    session_destroy();
    header("location: ../login.php");
}
$name = $_POST['searchName'];
$sql = "SELECT * FROM books WHERE b_name LIKE '%' ? '%'";
$array = array($name);

try {
    $query = $dbh->prepare($sql);
    if ($query->execute($array)) {
        $bookInfo = $query->fetchAll(PDO::FETCH_ASSOC);
    } else {
        echo 'Error: Query failed';
    }
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
$jsonData = json_encode($bookInfo);
echo $jsonData;
