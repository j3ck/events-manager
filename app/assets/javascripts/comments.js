$(document).ready(function() {
    $('.new_comment').on('ajax:success', function(e, data, textStatus, xhr) {
        appendComment(data.create_status, data.form_html, data.comment_html)
    })
})

function appendComment(status, formHTML, commentHTML, book) {
    if (status) {
        var commentDiv = $(commentHTML)
        $(".comments").append(commentDiv)
        commentDiv.hide().fadeIn("slow")
    }

    $('.new_comment').closest('.to_comment').replaceWith(formHTML)
}