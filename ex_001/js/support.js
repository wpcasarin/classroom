function supportTicket () {
  const msg = $('#ticket-text').val()
  $.ajax({
    type: 'POST',
    url: './php/supportTicket.php',
    data: { msg: msg },
    cache: false,
    success: function (data) {
      // if (data === 'SUCCESS') {
      //   window.location = './index.php'
      // } else {
      //   $('#loginFeedback')
      //     .html(data)
      //     .css('display', 'block')
      // }
      alert(data)
    }
  })
  return false
}
