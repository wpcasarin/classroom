<?php
session_start();
require_once './connection/connect.php';

$bookId = $_SESSION['bookID'];
$sql = "SELECT * FROM books WHERE b_cod = ?";
$array = array($bookId);

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
