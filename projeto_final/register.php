<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- online -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.js"></script>
    <!-- local -->
    <link rel="shortcut icon" href="./images/icon.svg" />
    <link rel="stylesheet" href="./css/style.css" />
    <script src="./javascript/scripts.js"></script>
    <title>Cadastrar</title>
</head>

<body class="bg-light-1 position-relative vh-100">
    <div class="container shadow rounded p-5 bg-light position-absolute top-50 start-50 translate-middle" style="max-width: 800px">
        <h2 class="mb-3 h2 fw-bold">Cadastro</h2>
        <form onsubmit="return userRegister()">
            <div class="mb-3">
                <label for="regName" class="form-label">Nome</label>
                <input type="text" class="form-control" name="regName" id="regName" placeholder="Usuário" onblur="nameValidation()" required />
            </div>
            <div class="mb-3 p-2 bg-danger text-white rounded reg-feed" id="regNameFeed"></div>
            <div class="mb-3">
                <label for="regEmail" class="form-label">Email</label>
                <input type="text" class="form-control" name="regEmail" id="regEmail" placeholder="email@provedor.com" onblur="emailValidation ()" required />
            </div>
            <div class="mb-3 p-2 bg-danger text-white rounded reg-feed" id="regEmailFeed"></div>
            <div class="mb-3">
                <label for="regCpf" class="form-label">CPF</label>
                <input type="text" class="form-control" name="regCpf" id="regCpf" placeholder="___.___.___-__" onblur="cpfValidation ()" required />
            </div>
            <div class="mb-3 p-2 bg-danger text-white rounded reg-feed" id="regCpfFeed"></div>
            <div class="mb-3">
                <label for="regPassword" class="form-label">Senha</label>
                <input type="password" class="form-control" name="regPassword" id="regPassword" placeholder="******" onblur="passValidation ()" required />
            </div>
            <div class="mb-3 p-2 bg-danger text-white rounded reg-feed" id="regPasswordFeed"></div>
            <div class="mb-3">
                <label for="regCPassword" class="form-label">Confirma Senha</label>
                <input type="password" class="form-control" name="regCPassword" id="regCPassword" placeholder="******" onblur="passValidation ()" required />
            </div>
            <div class="mb-3 bg-secondary text-white rounded" id="regFeedback"></div>
            <div class="d-grid gap-2">
                <button class="btn-lg btn-primary" type="submit">Cadastrar</button>
            </div>
        </form>
    </div>
</body>

</html>