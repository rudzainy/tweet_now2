post '/post_tweet' do
	# byebug
	tweet = params[:tweet]

	$twitter.access_token = session[:token]
  $twitter.access_token_secret = session[:token_secret]
	$twitter.update(tweet)

	@flash = "Tweeted!"
	@flash.to_json
end