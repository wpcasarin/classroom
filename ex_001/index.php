<?php
require_once "./php/connection/verificaUsuario.php";
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Games</title>
  <link rel="shortcut icon" type="image/svg" href="./image/icon.svg" />
  <link rel="stylesheet" href="./css/main.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="./js/support.js"></script>
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
                <a class="nav-link active" aria-current="page" href="./index.php">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="./acervo.php">Acervo</a>
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
            <button class="btn btn-success btn-lg fw-bold" type="button" onclick="document.location.href = './acervo.php'">
              Explorar agora<i class="ps-5 bi bi-arrow-right-circle"></i>
            </button>
          </div>
        </div>
      </div>
    </div>
  </header>
  <main class="flex-shrink-0">
    <div class="container ms-auto me-auto mb-auto p-0">
      <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner mt-3">
          <div class="carousel-item active">
            <img src="./data/001.jpg" class="d-block w-100 carousel-img" alt="..." />
            <div class="carousel-box d-flex flex-row justify-content-center">
              <div class="fs-2 mt-auto mb-2 flex-fill carousel-box-item">
                <span class="carousel-text">Spider-Man Remastered</span>
              </div>
              <div class="fs-2 mt-auto mb-2 carousel-box-item">
                <span class="carousel-text">R$ 99,00</span>
              </div>
              <div class="mt-auto mb-2 carousel-box-item">
                <button class="btn btn-primary btn-lg carousel-button">
                  <i class="bi bi-cart-plus pe-2"></i>Adicionar
                </button>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img src="./data/002.jpg" class="d-block w-100 carousel-img" alt="..." />
            <div class="carousel-box d-flex flex-row justify-content-center">
              <div class="fs-2 mt-auto mb-2 flex-fill carousel-box-item">
                <span class="carousel-text">TES V: Skyrim</span>
              </div>
              <div class="fs-2 mt-auto mb-2 carousel-box-item">
                <span class="carousel-text">R$ 79,00</span>
              </div>
              <div class="mt-auto mb-2 carousel-box-item">
                <button class="btn btn-primary btn-lg carousel-button">
                  <i class="bi bi-cart-plus pe-2"></i>Adicionar
                </button>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img src="./data/003.jpg" class="d-block w-100 carousel-img" alt="..." />
            <div class="carousel-box d-flex flex-row justify-content-center">
              <div class="fs-2 mt-auto mb-2 flex-fill carousel-box-item">
                <span class="carousel-text">World of Warcraft</span>
              </div>
              <div class="fs-2 mt-auto mb-2 carousel-box-item">
                <span class="carousel-text">R$ 199,00</span>
              </div>
              <div class="mt-auto mb-2 carousel-box-item">
                <button class="btn btn-primary btn-lg carousel-button">
                  <i class="bi bi-cart-plus pe-2"></i>Adicionar
                </button>
              </div>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </div>
  </main>
  <!-- ticket support button -->
  <section class="container-fluid d-flex justify-content-end mb-4"><button class="btn btn-success rounded-circle get-help" data-bs-toggle="modal" data-bs-target="#support"><i class="fs-3 bi bi-chat-dots-fill"></i></button>
  </section>
  <footer class="footer mt-auto footer-bg">
    <div class="
          container
          d-flex
          flex-wrap
          justify-content-between
          align-items-center
          py-2
          my-2
        ">
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
  <!-- ticket support -->
  <div class="modal fade" id="support" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Novo ticket</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <form onsubmit="return supportTicket()">
            <div class="mb-3">
              <label for="ticket-text" class="col-form-label">Mensagem:</label>
              <textarea class="form-control" id="ticket-text"></textarea>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                Fechar
              </button>
              <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Abrir ticked</button>
            </div>
          </form>
        </div>

      </div>
    </div>
  </div>
</body>

</html>