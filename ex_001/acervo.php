<?php
require_once "./php/connection/verificaUsuario.php";
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Games - Acervo</title>
    <link rel="shortcut icon" type="image/svg" href="./image/icon.svg" />
    <link rel="stylesheet" href="./css/main.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./js/acervo.js"></script>
</head>

<body class="d-flex flex-column vh-100">
    <header>
        <div class="container-fluid header-bg p-0">
            <nav class="navbar navbar-expand-lg navbar-dark nav-bg-color">
                <div class="container">
                    <a class="navbar-brand pe-4" href="#">Games</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="./index.php">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="./acervo.php">Acervo</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./gerenciar.php">Gerenciar</a>
                            </li>
                        </ul>
                        <ul class="navbar-nav flex-row flex-wrap ms-md-auto">
                            <li class="nav-item">
                                <a class="nav-link pe-4" href="#"><i class="bi bi-cart"></i></a>
                            </li>
                            <li class="nav-item col-6 col-md-auto">
                                <a class="nav-link ps-4" href="#"><i class="bi bi-search"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container pt-5">
                <div class="header-content">
                    <h1 class="fw-bold text-light">Best Games</h1>
                    <p>O maior acervo de jogos do mundo e talvez do Brasil</p>
                    <div class="d-grid gap-2">
                        <button class="btn btn-success btn-lg fw-bold" type="button" onclick="location.reload()">
                            Explorar agora<i class="ps-5 bi bi-arrow-right-circle"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <main class="flex-shrink-0">
        <div class="container">
            <form onsubmit="return buscarJogos ()">
                <div class="input-group my-3 pesquisa">
                    <input type="text" class="form-control" placeholder="Título do jogo..." id="pesquisa">
                    <button class="btn btn-success" type="submit"><i class="bi bi-search me-3"></i>Pesquisar</button>
                </div>
            </form>
            <div class="resultado mt-3">
                <table class="table table-light table-striped table-hover result-table">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Avaliação</th>
                        <th>Categoria</th>
                    </tr>
                </table>
            </div>
        </div>
    </main>
    <footer class="footer mt-auto footer-bg">
        <div class="container d-flex flex-wrap justify-content-between align-items-center py-2">
            <div class="col-md-4 d-inline align-items-center">
                <a href="#" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1 fs-3"><i class="bi bi-joystick"></i></a>
                <span class="text-muted">© 2021 Best Games, Inc</span>
            </div>
            <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
                <li class="ms-4">
                    <a class="text-muted fs-3" href="#"><i class="bi bi-github"></i></a>
                </li>
                <li class="ms-4">
                    <a class="text-muted fs-3" href="#"><i class="bi bi-twitter"></i></a>
                </li>
                <li class="ms-4">
                    <a class="text-muted fs-3" href="#"><i class="bi bi-instagram"></i></a>
                </li>
            </ul>
        </div>
    </footer>
</body>

</html>