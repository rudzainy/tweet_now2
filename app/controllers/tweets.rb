post '/post_tweet' do
	# byebug
	@handler = TwitterUser.find_by_handle(@hollowaykeanho)
	tweet = params[:tweet]

	# $twitter.update(tweet)

	@flash = "Tweeted!"
	@flash.to_json
end