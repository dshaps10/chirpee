get '/login' do 

	erb :login
end 

post 'login' do 
	user = User.where(email: params[:email]).first
	if user && user.password == params[:password]
		login(user)
		redirect '/users/:id/feed'
	else 
		@login_failed = true
		erb :login
	end 
end 

get '/logout' do 
	logout!
	redirect '/'
end 

