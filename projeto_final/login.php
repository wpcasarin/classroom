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
    <script src="./javascript/validators.js"></script>
    <title>Login</title>
</head>

<body class="bg-light-1 position-relative vh-100">
    <div class="container shadow rounded p-5 bg-light position-absolute top-50 start-50 translate-middle" style="max-width: 800px;">
        <h2 class="mb-3 h2 fw-bold">Login</h2>
        <form onsubmit="return userLogin ()">
            <div class="mb-3">
                <label for="loginEmail" class="form-label">Email</label>
                <input type="text" class="form-control" name="loginEmail" id="loginEmail">
            </div>
            <div class="mb-3">
                <label for="loginPassword" class="form-label">Senha</label>
                <input type="password" class="form-control" name="loginPassword" id="loginPassword">
            </div>
            <div class="mb-3 form-text">Ainda não tem cadastro? <a href="./register.php" class="link-primary text-decoration-none">Clique aqui.</a></div>
            <div class="mb-3 bg-danger text-white rounded" id="loginFeedback"></div>
            <div class="d-grid gap-2">
                <button class="btn-lg btn-primary" type="submit">Entrar</button>
            </div>
        </form>
    </div>
</body>

</html>