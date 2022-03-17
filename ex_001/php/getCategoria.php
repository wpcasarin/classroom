<?php
require_once './connection/conectar.php';

$sql = "SELECT * FROM categorias ORDER BY nome_cat";

try {
    $query = $dbh->prepare($sql);
    if ($query->execute()) {
        $catInfo = $query->fetchAll(PDO::FETCH_ASSOC);
    } else {
        echo 'FALHOU';
    }
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
$jsonData = json_encode($catInfo);
echo $jsonData;
