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
    <title>Usuário</title>
</head>

<body class="bg-light-1">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light-1 mt-4">
            <div class="container-fluid p-0">
                <a class="navbar-brand fw-bold text-primary fs-4" href="./index.php">Username</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link fs-5" aria-current="page" href="./index.php">Home</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link fs-5 active" href="./users.php">Usuário</a>
                        </li>
                        <li class="nav-item fs-5 dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Acervo
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="./listBooks.php">Pesquisar</a></li>
                                <li><a class="dropdown-item" href="./manageBooks.php">Gerenciar</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fs-5" href="./php/connection/userLogout.php">Sair</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="container-fluid mt-4 p-0 shadow-sm custom-bg">
        <div class="container pt-4 pb-4">
            <h1 class="fw-bold text-white">Bem-vindo a Biblioteca</h1>
            <p class="text-white-50 fs-4 mb-0">Conhecimento liberta.</p>
        </div>
    </div>
    <div class="container" style="max-width: 800px">
        <div class="mb-3 mt-5 shadow rounded p-5 bg-light">
            <div class="container">
                <h2 class="mb-3 h2 fw-bold">Perfil do usuário</h2>
                <div class="text-center mb-3">
                    <?php
                    require_once './php/showUserImg.php'
                    ?>
                </div>
                <form onsubmit="return changeUser()">
                    <div class="mb-3">
                        <label for="imgUpload" class="form-label">Alterar imagem de perfil</label>
                        <input type="file" class="form-control" name="imgUpload" id="imgUpload">
                    </div>
                    <div class="mb-3">
                        <div class="d-grid gap-2">
                            <button class="btn-lg btn-primary" type="submit">Alterar</button>
                        </div>
                    </div>
                </form>
                <div class="mb-3 p-2 bg-danger text-white rounded reg-feed" id="upImgResp"></div>
            </div>


            <div class="container mt-4">
                <h2 class="mb-3 h2 fw-bold">Livros alugados</h2>
                <table class="table table-hover align-middle" id="resulTable">
                    <thead>
                        <tr>
                            <th scope="col">Cod.</th>
                            <th scope="col">Título</th>
                            <th scope="col">Autor</th>
                            <th scope="col">Praso</th>
                            <th scope="col">#</th>
                        </tr>
                    </thead>
                    <tbody class="books-list-borrow">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>