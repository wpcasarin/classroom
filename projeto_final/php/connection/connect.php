<?php
$user = "welly";
$passwd = "1996";
try {
    $dbh = new PDO("mysql:host=localhost; dbname=library; charset=utf8", $user, $passwd);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
