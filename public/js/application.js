$(document).ready(function() {
  $('#tweet-form').submit(function(event){
  	event.preventDefault();
  	$('#form-container').hide();
  	$('#updating-container').show();
  	var tweet = $('#tweet-box').val();

  	$.ajax({
  		url: '/post_tweet',
  		method: 'POST',
  		data: { tweet: tweet },
  	}).done(function(response){
  		// debugger
  		var flash = JSON.parse(response);
  		$('.flash').replaceWith('<div class="flash">' + flash + '</div>');
  		$('.flash').show();
  		$('#updating-container').hide();
  		$('#form-container').show();
  		$('#tweet-box').val('');
  	});
  });
});
