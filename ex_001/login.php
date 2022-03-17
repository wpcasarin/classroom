<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Games - Login</title>
  <link rel="shortcut icon" type="image/svg" href="./image/icon.svg" />
  <link rel="stylesheet" href="./css/main.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="./js/login.js"></script>
</head>

<body class="d-flex flex-column vh-100 login-bg">
  <main class="flex-shrink-0">
    <div class="container-fluid">
      <div class="row align-items-start">
        <div class="col-5 bg-white vh-100 position-relative">
          <div class="container login-left mx-auto position-absolute">
            <div class="row vh-100">
              <div class="col-2"></div>
              <div class="col-8 mt-auto mb-auto">
                <h1>Login</h1>
                <p>Entre agora e faça parte da nossa comunidade.</p>
                <form onsubmit="return usuarioLogin()">
                  <div class="mb-3">
                    <label for="loginEmail" class="form-label">Email</label>
                    <input type="text" class="form-control" id="loginEmail" />
                    <div class="form-text">Suas informações não serão compartilhadas com terceiros.</div>
                  </div>
                  <div class="mb-3">
                    <label for="loginSenha" class="form-label">Senha</label>
                    <input type="password" class="form-control" id="loginSenha" />
                  </div>
                  <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" />
                    <label class="form-check-label" for="exampleCheck1">Manter conectado</label>
                  </div>
                  <div class="p-3 mb-3 bg-danger text-white rounded" id="loginFeedback">Retorno</div>
                  <div class="d-grid mb-3">
                    <button class="btn btn-primary btn-lg" type="submit">Entrar</button>
                  </div>
                  <div class="form-text fs-6">
                    Ainda não é cadastrado?
                    <button type="button" class="link-primary reg-link ms-2" onclick="abrirRegistro ()">
                      Registre-se
                    </button>
                  </div>
                </form>
              </div>
              <div class="col-2"></div>
            </div>
          </div>
          <div class="container login-left registro">
            <div class="row vh-100">
              <div class="col-2"></div>
              <div class="col-8 mt-auto mb-auto">
                <h1>Registrar</h1>
                <p>Crie sua conta agora mesmo.</p>
                <form method="POST" enctype="multipart/form-data" onsubmit="return usuarioRegistro()" id="regForm">
                  <div class="mb-3">
                    <label for="registroNome" class="form-label">Nome</label>
                    <input type="text" class="form-control" id="registroNome" required />
                  </div>
                  <div class="mb-3">
                    <label for="registroEmail" class="form-label">Email</label>
                    <input type="email" class="form-control" id="registroEmail" required />
                  </div>
                  <div class="mb-3">
                    <label for="registroSenha" class="form-label">Senha</label>
                    <input type="password" class="form-control" id="registroSenha" required />
                  </div>
                  <div class="mb-3">
                    <label for="registroSenhaC" class="form-label">Confirmar</label>
                    <input type="password" class="form-control" id="registroSenhaC" />
                  </div>
                  <div class="mb-3">
                    <label for="registroFoto" class="form-label">Foto</label>
                    <input type="file" class="form-control" id="registroFoto" />
                  </div>
                  <div class="p-3 mb-3 bg-danger text-white rounded" id="registroFeedback">Retorno</div>
                  <div class="form-text mb-3">Suas informações estão seguras conosco.</div>
                  <div class="container-fluid p-0">
                    <div class="row">
                      <div class="col-6">
                        <div class="d-grid">
                          <button class="btn btn-primary btn-lg" type="submit">Cadastrar</button>
                        </div>
                      </div>
                      <div class="col-6">
                        <div class="d-grid">
                          <button class="btn btn-danger btn-lg" type="button" onclick="fecharRegistro ()">
                            Voltar
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
              <div class="col-2"></div>
            </div>
          </div>
        </div>
        <div class="col-7 vh-100">
          <div class="container login-right">
            <h1><i class="bi bi-joystick me-3"></i>BEST GAMES</h1>
            <span>Jogos como você nunca viu antes</span>
          </div>
        </div>
      </div>
    </div>
  </main>
</body>

</html>