$(document).ready(function() {
	PrivatePub.subscribe("/comments/new", function(data, channel) {
	  appendComment(data.create_status, data.form_html, data.comment_html)
	})
    PrivatePub.subscribe("/comments", function(data, channel) {
      $('li[data-id=data.comment.id]').fadeOut('slow', function() {
        $(this).remove();
      })
    })
})

function appendComment(status, formHTML, commentHTML, book) {
    if (status) {
        var commentDiv = $(commentHTML)
        $(".comments").append(commentDiv)
        commentDiv.hide().fadeIn("slow")
    }
    /*$('.new_comment').closest('.to_comment').replaceWith(formHTML)*/
    $('.new_comment').replaceWith(formHTML)
}