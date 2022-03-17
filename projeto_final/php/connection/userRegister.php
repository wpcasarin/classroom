<?php
require_once './connect.php';

$name = $_POST['name'];
$email = $_POST['email'];
$cpf = $_POST['cpf'];
$password = $_POST['password'];
$cpf = preg_replace("~\D~", "", $cpf);


$sql = "SELECT * FROM users WHERE u_email LIKE ?";
$array = array($email);

try {
    $query = $dbh->prepare($sql);
    if ($query->execute($array)) {
        $resp = $query->fetch(PDO::FETCH_ASSOC);
    } else {
        echo 'Error: Query failed';
    }
    if ($resp) {
        echo 'Error: Email já cadastrado no sistema';
    }
    if (!$resp) {
        $sql = "INSERT INTO users (u_name,u_email,u_cpf,u_passwd) VALUE (?,?,?,?)";
        $array = array($name, $email, $cpf, $password);
        try {
            $query = $dbh->prepare($sql);
            if ($query->execute($array)) {
                echo 'Usuário cadastrado com sucesso.';
            } else {
                echo 'Error: Query failed';
            }
        } catch (PDOException $e) {
            echo 'Error: ' . $e->getMessage();
        }
    }
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
