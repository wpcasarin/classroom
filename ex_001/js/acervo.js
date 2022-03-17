document.addEventListener('DOMContentLoaded', function () {
  buscarJogos()
})

function buscarJogos () {
  const pesquisa = $('#pesquisa').val()
  $('.resultado').load(document.URL + ' .result-table')
  $('.resultado').css('visibility', 'visible')
  $.ajax({
    type: 'POST',
    url: './php/getJogos.php',
    data: { pesquisa: pesquisa },
    cache: false,
    dataType: 'json',
    success: function (data) {
      let html = '<tr>'
      $.each(data, function (index, data) {
        html += '<td>' + data.id_jogo + '</td>\n'
        html += '<td>' + data.nome_jogo + '</td>\n'
        html += '<td>' + data.desc_jogo + '</td>\n'
        html += '<td>' + data.aval_jogo + '</td>\n'
        html += '<td>' + data.nome_cat + '</td>\n'
        $('.result-table').append(html)
        html = '<tr>'
      })
    }
  })
  return false
}
