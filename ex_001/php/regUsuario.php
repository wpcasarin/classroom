<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once './connection/conectar.php';

$nome = $_POST['nome'];
$email = $_POST['email'];
$senha = $_POST['senha'];
$senha = md5($senha);
$hash = md5(uniqid());
$img = basename($_FILES['file']['name']);
$imgId = uniqid();
$ext = pathinfo($img, PATHINFO_EXTENSION);
$diretorio = "upload/";
$imgNome = strtolower($nome) . "_" . $imgId . "." . $ext;
$imgFormatos = array("jpg", "jpeg", "png");

if (isset($_FILES['file'])) {
    if (in_array(strtolower($ext), $imgFormatos)) {
        if (move_uploaded_file($_FILES['file']['tmp_name'], "../$diretorio/$imgNome")) {
        
            $sql = "INSERT INTO usuarios (nome_usuario,email_usuario,senha_usuario,foto_usuario, hash_usuario) VALUES (?,?,?,?,?)";
            $array = array($nome, $email, $senha, $imgNome, $hash);
            try {
                $query = $dbh->prepare($sql);
                if ($query->execute($array)) {
                    emailValidator($nome, $email, $hash);
                    echo "Usuário cadastrado com sucesso.<br>";
                    echo "Um link de confirmação foi enviado para o seu e-mail.";
                    exit;
                } else {
                    echo 'ERRO: Falha ao cadastrar usuário.';
                }
            } catch (PDOException $e) {
                echo 'ERRO: ' . $e->getMessage();
            }
        }
        echo 'ERRO: Falha ao enviar o arquivo.';
    } else {
        echo 'ERRO: Formato de imagem inválido.';
    }
} else {
    $sql = "INSERT INTO usuarios (nome_usuario,email_usuario,senha_usuario, hash_usuario) VALUES (?,?,?,?)";
    $array = array($nome, $email, $senha, $hash);
    try {
        $query = $dbh->prepare($sql);
        if ($query->execute($array)) {
            emailValidator($nome, $email, $hash);
            echo "Usuário cadastrado com sucesso.<br>";
            echo "Um link de confirmação foi enviado para o seu e-mail.";
            exit;
        } else {
            echo "ERRO: Falha ao cadastrar usuário.";
        }
    } catch (PDOException $e) {
        echo "ERRO: " . $e->getMessage();
    }
}

function emailValidator($nome, $email, $hash)
{
    require '../vendor/autoload.php';
    require './private/authInfo.php';

    $link = "http://localhost/~welly/git/dpw-atividade/php/validaEmail.php?auth=$hash";
    $msg = "Olá $nome! <br>"
    . "Por favor clique no link abaixo para completar o seu cadastro.<br>"
    . "Você irá ser redirecionado para a página de login.<br><br>"            
    . "<a href='$link'>Completar Cadastro</a>";

    $mail = new PHPMailer(true);
    try {
        $mail->isSMTP();
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->SMTPDebug = 0;
        $mail->SMTPAuth = true;
        $mail->Host = "smtp.gmail.com";
        $mail->Port = 587;
        $mail->SMTPOptions = [
            "ssl" => [
                "verify_peer" => false,
                "verify_peer_name" => false,
                "allow_self_signed" => true,
            ]
        ];
        //Autorização
        $mail->Username = $authEmail;
        $mail->Password = $authPass;
        //Remetente
        $mail->setFrom($authEmail, "Best Games");
        //Destinatário
        $mail->addAddress($email, $nome);
        //Conteúdo
        $mail->CharSet = "utf-8";
        $mail->isHTML(true);
        $mail->Subject = "Confirmação de cadastro.";
        $mail->Body = $msg;
        //Enviar
        $mail->send();
    } catch (Exception $e) {
        echo $e->errorMessage();
    }
}
