<?php
session_start();
require_once './connection/connect.php';
if (!isset($_SESSION['userAuthorized']) || ($_SESSION['userAuthorized'] != true)) {
    session_destroy();
    header("location: ../login.php");
}
$sql = "SELECT * FROM books ORDER BY b_cod";

try {
    $query = $dbh->prepare($sql);
    if ($query->execute()) {
        $bookInfo = $query->fetchAll(PDO::FETCH_ASSOC);
    } else {
        echo 'Error: Query failed';
    }
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
$jsonData = json_encode($bookInfo);
echo $jsonData;
