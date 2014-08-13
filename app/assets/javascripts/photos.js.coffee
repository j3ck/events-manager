jQuery ->
  $('#photos').sortable
  	update: ->
  		$.post($(this).data('update-url'), $(this).sortable('serialize'))

  $('#photo_photo').fileupload
  	done: (e, data)->
  		$(".test").append(data.result.photo_html)
