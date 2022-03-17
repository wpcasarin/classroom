<?php
require_once './connection/conectar.php';

$catId = $_POST['catId'];
$nome = $_POST['nome'];
$desc = $_POST['desc'];
$avali = $_POST['avali'];

if ($nome != '' && $desc != '') {
    $sql = "INSERT INTO jogos (nome_jogo, desc_jogo, aval_jogo, cat_jogo) VALUES (?, ?, ?, ?)";
} else {
    echo 'FALHOU';
}
$array = array($nome, $desc, $avali, $catId);
try {
    $query = $dbh->prepare($sql);
    if ($query->execute($array)) {
        echo 'SUCESSO';
    } else {
        echo 'FALHOU';
    }
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
