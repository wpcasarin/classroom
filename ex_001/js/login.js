function usuarioLogin () {
  const email = $('#loginEmail').val()
  const password = $('#loginSenha').val()
  $.ajax({
    type: 'POST',
    url: './php/connection/verificaLogin.php',
    data: { email: email, password: password },
    cache: false,
    success: function (data) {
      if (data === 'SUCCESS') {
        window.location = './index.php'
      } else {
        $('#loginFeedback')
          .html(data)
          .css('display', 'block')
      }
    }
  })
  return false
}

function usuarioRegistro () {
  const fd = new FormData()
  const files = $('#registroFoto')[0].files
  fd.append('file', files[0])
  fd.append('nome', $('#registroNome').val())
  fd.append('email', $('#registroEmail').val())
  fd.append('senha', $('#registroSenha').val())
  $.ajax({
    type: 'POST',
    url: './php/regUsuario.php',
    data: fd,
    contentType: false,
    processData: false,
    success: function (data) {
      $('#registroFeedback')
        .html(data)
        .css('display', 'block')
        .css('background', 'black')
    }
  })
  $('#regForm').each(function () {
    this.reset()
  })
  return false
}

function fecharRegistro () {
  $('.registro').css('visibility', 'hidden')
  $('.registro').css('display', 'none')
}

function abrirRegistro () {
  $('.registro').css('visibility', 'visible')
  $('.registro').css('display', 'block')
}
