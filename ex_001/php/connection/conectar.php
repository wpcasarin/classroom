<?php
$user = "root";
$passwd = "root";
try {
    $dbh = new PDO("pgsql:host=172.18.0.3; dbname=games;options='--client_encoding=UTF8'", $user, $passwd);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
