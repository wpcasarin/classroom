<?php
session_start();
require_once './connection/connect.php';
if (!isset($_SESSION['userAuthorized']) || ($_SESSION['userAuthorized'] != true)) {
    session_destroy();
    header("location: ../login.php");
}
$userId = $_SESSION['userID'];
$sql = "SELECT loan.l_cod, loan.b_cod, date_return, b_name, b_author 
        FROM loan INNER JOIN books ON loan.b_cod = books.b_cod AND loan.u_cod = ?";
$array = array($userId);

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
