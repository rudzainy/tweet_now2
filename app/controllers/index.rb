get '/' do
  erb :index
end

get '/create_default' do

	TwitterUser.create(handle: @hollowaykeanho)
	erb :index
end

get '/flash' do

	@handler = TwitterUser.find_by_handle(@hollowaykeanho)
	@flash = "This is a test flash message."
	erb :index
end

