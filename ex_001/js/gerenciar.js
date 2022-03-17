document.addEventListener('DOMContentLoaded', function () {
  getCategoria()
})

function getCategoria () {
  const url = './php/getCategoria.php'
  let html = ''
  $.getJSON(url, function (data) {
    $.each(data, function (index, data) {
      html =
        "<option value='" + data.id_cat + "'>" + data.nome_cat + '</option>'
      $('#catJogo').append(html)
    })
  })
}
function addJogo () {
  const catId = $('#catJogo').val()
  const nome = $('#jogoNome').val()
  const desc = $('#jogoDesc').val()
  const avali = $('#jogoAva').val()
  $.ajax({
    type: 'POST',
    url: './php/addJogos.php',
    data: { catId: catId, nome: nome, desc: desc, avali: avali },
    cache: false,
    success: function (data) {
      if (data === 'SUCESS') {
        alert(data)
      } else {
        alert(data)
      }
    }
  })
  $('#addJogoForm').each(function () {
    this.reset()
  })
  return false
}

function addCategoria () {
  const catName = $('#catNome').val()
  $.ajax({
    type: 'POST',
    url: './php/addCategoria.php',
    data: { catName: catName },
    cache: false,
    success: function (data) {
      if (data === 'SUCESS') {
        alert('sucesso!!!')
      } else {
        alert(data)
      }
    }
  })
  setTimeout(function () {
    window.location.reload(true)
  }, 1000)

  $('#addCatForm').each(function () {
    this.reset()
  })
  return false
}
