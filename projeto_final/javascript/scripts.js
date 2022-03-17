window.onload = function () {
  $('#regName').attr('maxLength', '10')
  $('#regName').attr('minLength', '3')
  $('#regPassword').attr('maxLength', '10')
  $('#regPassword').attr('minLength', '4')
  $('#regCPassword').attr('maxLength', '10')
  $('#regCPassword').attr('minLength', '4')
  $('#regEmail').attr('maxLength', '30')
  $('#regCpf').mask('000.000.000-00', { reverse: true })
}

document.addEventListener('DOMContentLoaded', function () {
  getUserName()
  getBorrowBookInfo()
  getBooksInfo()
  getRowInfo()
  getBorrowBooksInfo()
})

function userLogin () {
  const email = $('#loginEmail').val()
  const password = $('#loginPassword').val()
  $.ajax({
    type: 'POST',
    url: './php/connection/userLogin.php',
    data: { email: email, password: password },
    cache: false,
    success: function (data) {
      if (data === 'SUCESS') {
        window.location = './index.php'
      } else {
        $('#loginFeedback')
          .html(data)
          .css('padding', '.5rem')
      }
    }
  })
  return false
}

function userRegister () {
  const name = $('#regName').val()
  const email = $('#regEmail').val()
  const cpf = $('#regCpf').val()
  const password = $('#regPassword').val()
  const validate = []
  validate[0] = nameValidation()
  validate[1] = cpfValidation()
  validate[2] = passValidation()
  validate[3] = emailValidation()
  if (validate.includes(false) === false) {
    $.ajax({
      type: 'POST',
      url: './php/connection/userRegister.php',
      data: { name: name, email: email, cpf: cpf, password: password },
      cache: false,
      success: function (data) {
        $('#regFeedback')
          .html(data)
          .css('padding', '.5rem')
      }
    })
  }
  return false
}

function getUserName () {
  const url = './php/getUserInfo.php'
  $.getJSON(url, function (data) {
    $('.navbar-brand').html(data[0])
  })
}

function getBooksInfo () {
  const url = './php/getBookInfo.php'
  let html = '<tr>'
  $.getJSON(url, function (data) {
    $.each(data, function (index, data) {
      html += '<td class="fw-bold">' + data.b_cod + '</td>\n'
      html += '<td>' + data.b_name + '</td>\n'
      html += '<td>' + data.b_author + '</td>\n'
      html += '<td>' + data.b_quant + '</td>\n'
      $('.books-list').append(html)
      html = '<tr>'
    })
  })
}

function getBorrowBooksInfo () {
  const url = './php/returnBookInfo.php'
  let html = '<tr>'
  $.getJSON(url, function (data) {
    $.each(data, function (index, data) {
      html += '<td class="fw-bold">' + data.l_cod + '</td>\n'
      html += '<td>' + data.b_name + '</td>\n'
      html += '<td>' + data.b_author + '</td>\n'
      html += '<td>' + data.date_return + '</td>\n'
      html +=
        '<td><button onclick="bookReturn(' +
        data.l_cod +
        ')" class="btn btn-primary">Devolver</button></td>\n'
      $('.books-list-borrow').append(html)
      html = '<tr>'
    })
  })
}

function bookReturn (loanId) {
  $.ajax({
    type: 'POST',
    url: './php/finishBookReturn.php',
    data: { loanId: loanId },
    success: function (data) {
      window.location.reload()
    }
  })
}

function returnBookDate () {
  const borrowD = new Date()
  const returnD = new Date()
  returnD.setDate(borrowD.getDate() + 7)

  return returnD
}

function getBorrowBookInfo () {
  const url = './php/borrowBookInfo.php'
  const returnDate = returnBookDate()
  $.getJSON(url, function (data) {
    $.each(data, function (index, data) {
      $('#bookT').html(data.b_name)
      $('#bookA').html(data.b_author)
      $('#bookQ').html(data.b_quant)
      $('#bookR').html(returnDate.toLocaleDateString())
    })
  })
}

function finishBorrow () {
  $.ajax({
    url: './php/finishBorrow.php',
    success: function (data) {
      $('#borrowFeedBack').html(data)
      $('#borrowFeedBack').css('display', 'block')
      $('#borrowBackBtn').css('display', 'block')
      $('.borrow-btn').css('display', 'none')
    }
  })
}

function getRowInfo () {
  const table = document.getElementsByTagName('table')[0]
  const tbody = table.getElementsByTagName('tbody')[0]
  tbody.onclick = function (e) {
    e = e || window.event
    const data = []
    let target = e.srcElement || e.target
    while (target && target.nodeName !== 'TR') {
      target = target.parentNode
    }
    if (target) {
      const cells = target.getElementsByTagName('td')
      for (let i = 0; i < cells.length; i++) {
        data.push(cells[i].innerHTML)
      }
    }
    $('#bookCodDisplay').html(data[0])
    $('#bookCod').val(data[0])
    $('#bookName').val(data[1])
    $('#bookAuthor').val(data[2])
    $('#bookQuant').val(data[3])
  }
}

function changeBookInfo () {
  const bookCod = $('#bookCod').val()
  const bookName = $('#bookName').val()
  const bookAuthor = $('#bookAuthor').val()
  const bookQuant = $('#bookQuant').val()
  $.ajax({
    type: 'POST',
    url: './php/changeBookInfo.php',
    data: {
      bookCod: bookCod,
      bookName: bookName,
      bookAuthor: bookAuthor,
      bookQuant: bookQuant
    },
    success: function (data) {
      if (data === 'SUCCESS') {
        window.location.reload()
      } else {
        $('#booksFeedback')
          .html(data)
          .css('padding', '.5rem')
      }
    }
  })
  return false
}

function deleteBookEntry () {
  const bookCod = $('#bookCod').val()
  $.ajax({
    type: 'POST',
    url: './php/deleteBookEntry.php',
    data: { bookCod: bookCod },
    success: function (data) {
      if (data === 'SUCCESS') {
        alert('Livro exluido com sucesso.')
        window.location.reload()
      } else {
        $('#booksFeedback')
          .html(data)
          .css('padding', '.5rem')
      }
    }
  })
}

function addNewBookEntry () {
  const bookName = $('#newBookName').val()
  const bookAuthor = $('#newBookAuthor').val()
  const bookQuant = $('#newBookQuant').val()
  $.ajax({
    type: 'POST',
    url: './php/addNewBookEntry.php',
    data: {
      bookName: bookName,
      bookAuthor: bookAuthor,
      bookQuant: bookQuant
    },
    success: function (data) {
      if (data === 'SUCCESS') {
        window.location.reload()
      } else {
        $('#newBookFeedback')
          .html(data)
          .css('padding', '.5rem')
      }
    }
  })
  return false
}

function searchBooks () {
  const searchName = $('#searchBar').val()
  $('#resulTable').load(window.location.href + ' #resulTable')
  $.ajax({
    type: 'POST',
    url: './php/searchBook.php',
    data: { searchName: searchName },
    dataType: 'json',
    success: function (data) {
      $('.result-div').css('display', 'block')
      let html = '<tr>'
      $.each(data, function (i, data) {
        html += '<td class="fw-bold">' + data.b_cod + '</td>\n'
        html += '<td>' + data.b_name + '</td>\n'
        html += '<td>' + data.b_author + '</td>\n'
        html += '<td>' + data.b_quant + '</td>\n'
        if (data.b_quant > 0) {
          html +=
            '<td><button onclick="toBorrow(' +
            data.b_cod +
            ')" class="btn btn-primary">Alugar</button></td>\n'
          $('.books-list-search').append(html)
        } else {
          html += '<td><button) class="btn btn-danger">Alugar</button></td>\n'
          $('.books-list-search').append(html)
        }
        html = '<tr>'
      })
    }
  })
}

function toBorrow (bookId) {
  $.ajax({
    type: 'POST',
    url: './php/borrowBookRedirect.php',
    data: { bookId: bookId },
    success: function (data) {
      if (data === 'SUCCESS') {
        window.location = './borrow.php'
      }
    }
  })
}

function nameValidation () {
  const accept = /^[a-z A-Z]*$/
  const name = document.getElementById('regName').value
  if (!accept.test(name) || name === '') {
    $('#regNameFeed').html('Nome de usuário inválido.')
    $('#regNameFeed').css('display', 'block')
    return false
  } else {
    $('#regNameFeed').css('display', 'none')
    return true
  }
}

function emailValidation () {
  const accept = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  const name = document.getElementById('regEmail').value
  if (!accept.test(name)) {
    $('#regEmailFeed').html('Email inválido.')
    $('#regEmailFeed').css('display', 'block')
    return false
  } else {
    $('#regEmailFeed').css('display', 'none')
    return true
  }
}

function cpfValidation () {
  let cpfNum = document.getElementById('regCpf').value
  let valid
  if (typeof cpfNum !== 'string') {
    valid = false
  }
  cpfNum = cpfNum.replace(/[\s.-]*/gim, '')
  if (
    !cpfNum ||
    cpfNum.length != 11 ||
    cpfNum == '00000000000' ||
    cpfNum == '11111111111' ||
    cpfNum == '22222222222' ||
    cpfNum == '33333333333' ||
    cpfNum == '44444444444' ||
    cpfNum == '55555555555' ||
    cpfNum == '66666666666' ||
    cpfNum == '77777777777' ||
    cpfNum == '88888888888' ||
    cpfNum == '99999999999'
  ) {
    valid = false
  }
  var sum = 0
  var rest
  for (var i = 1; i <= 9; i++)
    sum = sum + parseInt(cpfNum.substring(i - 1, i)) * (11 - i)
  rest = (sum * 10) % 11
  if (rest == 10 || rest == 11) rest = 0
  if (rest != parseInt(cpfNum.substring(9, 10))) valid = false
  sum = 0
  for (var i = 1; i <= 10; i++)
    sum = sum + parseInt(cpfNum.substring(i - 1, i)) * (12 - i)
  rest = (sum * 10) % 11
  if (rest == 10 || rest == 11) rest = 0
  if (rest != parseInt(cpfNum.substring(10, 11))) valid = false

  if (valid === false) {
    $('#regCpfFeed').html('CPF inválido.')
    $('#regCpfFeed').css('display', 'block')
    return false
  } else {
    $('#regCpfFeed').css('display', 'none')
    return true
  }
}

function passValidation () {
  const pass = document.getElementById('regPassword').value
  const cpass = document.getElementById('regCPassword').value
  if (pass !== cpass) {
    $('#regPasswordFeed').html('As senhas precisam ser iguais.')
    $('#regPasswordFeed').css('display', 'block')
    return false
  }
  if (pass === '' || cpass === '') {
    $('#regPasswordFeed').html('Senha inválida.')
    $('#regPasswordFeed').css('display', 'block')
    return false
  } else {
    $('#regPasswordFeed').css('display', 'none')
    return true
  }
}

function changeUser () {
  const fileData = $('#imgUpload').prop('files')[0]
  const formData = new FormData()
  formData.append('file', fileData)

  $.ajax({
    type: 'POST',
    url: './php/changeUserData.php',
    data: formData,
    contentType: false,
    processData: false,
    success: function (data) {
      if (data === 'SUCESS') {
        $('#upImgResp').css('display', 'block')
        $('#upImgResp').html('Imagem alterada com sucesso.')
      } else {
        $('#upImgResp').css('display', 'block')
        $('#upImgResp').html(data)
      }
    }
  })
  $('#imgUpload').val('')
  return false
}
