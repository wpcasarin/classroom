<?php
require_once './connection/conectar.php';

if (isset($_REQUEST['auth'])) {

    $hash = $_REQUEST['auth'];
    $sql = "UPDATE usuarios SET status_usuario = true WHERE hash_usuario = '$hash'";

    try {
        $query = $dbh->prepare($sql);
        $query->execute();
    } catch (PDOException $e) {
        echo "ERRO: " . $e->getMessage();
    }
}
header("location:../index.php");
