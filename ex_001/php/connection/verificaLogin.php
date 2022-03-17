<?php
session_start();
require_once './conectar.php';

$email = $_POST['email'];
$senha = $_POST['password'];
$senha = md5($senha);
$sql = "SELECT email_usuario, senha_usuario FROM usuarios WHERE email_usuario=? AND senha_usuario=?";
$array = array($email, $senha);
try {
    $query = $dbh->prepare($sql);
    if ($query->execute($array)) {
        $resp = $query->fetch(PDO::FETCH_ASSOC);
    } else {
        echo 'Error: Query failed';
    }
    if ($resp) {
        $_SESSION['autorizado'] = true;
        $_SESSION['userEmail'] = $email;
        echo 'SUCCESS';
        exit;
    } else {
        echo 'Usuário não cadastrado ou senha incorreta.';
    }
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
