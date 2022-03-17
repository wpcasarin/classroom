<?php
require_once "./php/connection/checkLogin.php";
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- online -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <!-- local -->
    <link rel="shortcut icon" href="./images/icon.svg">
    <link rel="stylesheet" href="./css/style.css">
    <script src="./javascript/scripts.js"></script>
    <title>Aluguel</title>
</head>

<body class="bg-light-1 position-relative vh-100">
    <div class="container shadow rounded p-5 bg-light position-absolute top-50 start-50 translate-middle" style="max-width: 800px">
        <h2 class="mb-3 h2 fw-bold">Locação</h2>
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <div class="mb-3">
                        <div class="h5 fw-bold text-primary">Título</div>
                        <div class="h5" id="bookT"></div>
                    </div>
                    <div class="mb-3">
                        <div class="h5 fw-bold text-primary">Quantidade</div>
                        <div class="h5" id="bookQ"></div>
                    </div>
                    <button class="borrow-btn btn-lg btn-primary mt-3" type="button" onclick="finishBorrow()">Alugar</button>
                </div>
                <div class="col-6">
                    <div class="mb-3">
                        <div class="h5 fw-bold text-primary">Autor</div>
                        <div class="h5" id="bookA"></div>
                    </div>
                    <div class="mb-3">
                        <div class="h5 fw-bold text-primary">Devolução</div>
                        <div class="h5" id="bookR"></div>
                    </div>
                    <button class="borrow-btn btn-lg btn-danger mt-3" type="button" onclick="window.location = './index.php'">Voltar</button>
                </div>
                <div class="mt-3 p-3 bg-secondary text-white rounded reg-feed" id="borrowFeedBack"></div>
                <button class="btn-lg btn-danger mt-3 reg-feed" type="button" id="borrowBackBtn" onclick="window.location = './index.php'">Voltar</button>
            </div>
        </div>
    </div>
</body>

</html>