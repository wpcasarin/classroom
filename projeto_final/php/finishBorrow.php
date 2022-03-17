<?php
session_start();
require_once './connection/connect.php';

$userId = $_SESSION['userID'];
$bookId = $_SESSION['bookID'];
$borrowDate = date('Y-m-d H:i:s');
$returnDate = date('Y-m-d H:i:s', strtotime($borrowDate . ' + 7 days'));

$sql = "SELECT * FROM books WHERE b_cod = ? ";
$array = array($bookId);

try {
    $query = $dbh->prepare($sql);
    if ($query->execute($array)) {
        $bookInfo = $query->fetchAll(PDO::FETCH_ASSOC);
        if ($bookInfo[0]['b_quant'] <= 0) {
            echo 'Livro indisponível.';
            exit;
        }
        $sql = "INSERT INTO loan (u_cod, b_cod, date_borrow, date_return) VALUES (? , ? , ? , ?)";
        $array = array($userId, $bookId, $borrowDate, $returnDate);

        try {
            $query = $dbh->prepare($sql);
            if ($query->execute($array)) {
                $sql = "UPDATE books SET b_quant = b_quant - 1 WHERE b_cod = ?";
                $array = array($bookId);
                try {
                    $query = $dbh->prepare($sql);
                    if ($query->execute($array)) {
                        echo 'Livro alugado com sucesso.';
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
