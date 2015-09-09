

get '/sign_in' do
	redirect to("/auth/twitter")
end

get '/auth/twitter/callback' do
  # env['omniauth.auth'] ? session[:admin] = true : halt(401,'Not Authorized')
  
  # session[:handle] = "@" + env['omniauth.auth']['info']['nickname']
  
  # session[:name] = env['omniauth.auth']['info']['name']
  # session[:token] = env['omniauth.auth']['credentials']['token']
  # session[:token_secret] = env['omniauth.auth']['credentials']['secret']

  user = TwitterUser.find_or_create_by(name:  env['omniauth.auth']['info']['name'])
  # user.update(name: session[:name], token: session[:token], token_secret: session[:token_secret]) 
	  user.token = env['omniauth.auth']['credentials']['token']
	  user.token_secret = env['omniauth.auth']['credentials']['secret']
  user.save

  session[:name] = user.name

  erb :index
end

get '/auth/failure' do
  params[:message]
end

get '/sign_out' do
	session.clear
	erb :index
end