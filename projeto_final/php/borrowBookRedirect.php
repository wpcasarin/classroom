<?php
session_start();
require_once './connection/connect.php';

$_SESSION['bookID'] = $_POST['bookId'];

echo "SUCCESS";