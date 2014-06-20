jQuery ->
  $('#event_tag_tokens').tokenInput '/tags.json',
    theme: 'facebook'
    prePopulate: $('#event_tag_tokens').data('load')