$(document).ready(function() {
	PrivatePub.subscribe("/comments/new", function(data, channel) {
	  appendComment(data.create_status, data.form_html, data.comment_html)
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