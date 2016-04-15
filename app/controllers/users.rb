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

get '/users/:id/feed' do 
	redirect '/' unless session[:user_id]
	flash[:warning] = "Sorry this page is private"
	erb :feed
end 

get '/users/:id/profile' do 
	redirect '/' unless session[:user_id]
	flash[:warning] = "Sorry this page is private"
	erb :profile
end 