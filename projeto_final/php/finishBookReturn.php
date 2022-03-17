<?php
session_start();
require_once './connection/connect.php';

$loanId = $_POST['loanId'];
$sql = "SELECT * FROM loan WHERE l_cod = ? ";
$array = array($loanId);

try {
    $query = $dbh->prepare($sql);
    if ($query->execute($array)) {
        $loanInfo = $query->fetchAll(PDO::FETCH_ASSOC);
        $sql = "UPDATE books SET b_quant = b_quant + 1 WHERE b_cod = ?";
        $array = array($loanInfo[0]['b_cod']);
        try {
            $query = $dbh->prepare($sql);
            if ($query->execute($array)) {
                $sql = "DELETE FROM loan WHERE l_cod = ?";
                $array = array($loanId);
                try {
                    $query = $dbh->prepare($sql);
                    if ($query->execute($array)) {
                        echo 'SUCCESS';
                    } else {
                        echo 'Error: Query failed';
                    }
                } catch (PDOException $e) {
                    echo 'Error: ' . $e->getMessage();
                }
            } else {
                echo 'Error: Query failed';
            }
        } catch (PDOException $e) {
            echo 'Error: ' . $e->getMessage();
        }
    } else {
        echo 'Error: Query failed';
    }
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}
