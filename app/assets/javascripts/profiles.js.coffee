jQuery ->
	$('.caption').hide();
	$('.profile__avatar').mouseleave( () -> $('.caption').fadeOut())
	$('.profile__avatar').mouseover( () -> $('.caption').fadeIn())
