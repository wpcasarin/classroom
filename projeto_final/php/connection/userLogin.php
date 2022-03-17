<?php
session_start();
require_once './connect.php';

$email = $_POST['email'];
$password = $_POST['password'];
$sql = "SELECT * FROM users WHERE u_email=? AND u_passwd=?";
$array = array($email, $password);
try {
    $query = $dbh->prepare($sql);
    if ($query->execute($array)) {
        $resp = $query->fetch(PDO::FETCH_ASSOC);
    } else {
        echo 'Error: Query failed';
    }
    if ($resp) {
        $_SESSION['userAuthorized'] = true;
        $_SESSION['userName'] = $resp['u_name'];
        $_SESSION['userEmail'] = $resp['u_email'];
        $_SESSION['userCpf'] = $resp['u_cpf'];
        $_SESSION['userID'] = $resp['u_cod'];
        echo 'SUCESS';
        exit;
    } else {
        echo 'Usuário não cadastrado ou senha incorreta.';
    }
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}