<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

session_start();
require_once './connection/conectar.php';

require '../vendor/autoload.php';
require './private/authInfo.php';

$msg = $_POST['msg'];
$userEmail = $_SESSION['userEmail'];
$supportEmail = 'support.4haor@slmail.me';

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
    $mail->setFrom($authEmail, "Ticket");
    //Destinatário
    $mail->addAddress($supportEmail, $nome);
    //Resposta
    $mail->addReplyTo($userEmail, "Ticket");
    //Conteúdo
    $mail->CharSet = "utf-8";
    $mail->isHTML(true);
    $mail->Subject = "Abertura de ticket.";
    $mail->Body = $msg;
    //Enviar
    $mail->send();
    echo 'SUCCESS';
} catch (Exception $e) {
    echo $e->errorMessage();
}
