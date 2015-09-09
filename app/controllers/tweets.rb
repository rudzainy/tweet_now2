post '/post_tweet' do
	# byebug
	tweet = params[:tweet]
	user = TwitterUser.find_by(name: session[:name])
	$twitter.access_token = user.token
  $twitter.access_token_secret = user.token_secret
	$twitter.update(tweet)

	@flash = "Tweeted!"
	@flash.to_json
end