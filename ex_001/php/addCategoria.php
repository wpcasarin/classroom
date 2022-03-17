<?php
require_once './connection/conectar.php';

$cat = $_POST['catName'];

if($cat != '') {
    $sql = "INSERT INTO categorias (nome_cat) VALUES (?)";
}else { 
    echo 'FALHOU';
}
$array = array($cat);
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
