get '/login' do 
	erb :login
end 

post 'login' do 
	user = User.where(email: params[:email]).first
	if user && user.password == params[:password]
		login(user)
		redirect '/users/:user_id/feed'
	else 
		@login_failed = true
		erb :login
	end 
end 

get '/logout' do 
	logout!
	redirect '/'
end 

get '/users/:user_id/feed' do 
	redirect '/' unless current_user
	flash[:warning] = "Sorry this page is private"
	erb :feed
end 

get '/users/:user_id/profile' do 
	redirect '/' unless current_user
	flash[:warning] = "Sorry this page is private"
	erb :profile
end 


