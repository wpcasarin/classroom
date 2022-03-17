<?php
require_once './connection/conectar.php';

$busca = $_POST['pesquisa'];

$sql = "SELECT id_jogo, nome_Jogo, desc_jogo, aval_jogo, nome_cat FROM jogos INNER JOIN categorias ON categorias.id_cat=jogos.cat_jogo WHERE jogos.nome_jogo ILIKE '%$busca%' ORDER BY jogos.nome_jogo";

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
