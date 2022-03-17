<?php
session_start();
require_once './php/connection/connect.php';

$cod = $_SESSION['userEmail'];
$sql = "SELECT * FROM users WHERE u_email = ?";
$array = array($cod);
try {
    $query = $dbh->prepare($sql);
    if ($query->execute($array)) {
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result['u_img'] == NULL) {
            echo '<img width="100" height="100" src="./images/user.svg">';
        } else
            echo '<img width="100" height="100" src="data:image/png;base64,' . base64_encode($result['u_img']) . '"/>';
    } else {
        echo 'Error: Query failed';
    }
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
?>