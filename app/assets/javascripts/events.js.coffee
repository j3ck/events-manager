jQuery ->
  $('#event_tag_tokens').tokenInput '/tags.json',
    theme: 'facebook'
    prePopulate: $('#event_tag_tokens').data('load')

  $('.map').hide()

  $('#showmap').on('click', () -> $('.map').toggle())

  $('#datetimepicker').datetimepicker
  	format:'Y-m-d H:i'
