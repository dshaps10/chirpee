get '/login' do 
	erb :login
end 

post '/login' do 
	user = User.where(email: params[:email]).first
	if user && user.password == params[:password]
		login(user)
		redirect "/users/#{user.id}/feed"
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
	@user = User.find(params[:user_id])
	if current_user == @user
		erb :feed
	else
		flash[:warning] = "Sorry this page is private"
		redirect '/'
	end
end 

get '/users/:user_id/profile' do 
	@user = User.find(params[:user_id])
	if current_user == @user
		erb :feed
	else
		flash[:warning] = "Sorry this page is private"
		redirect '/'
	end
end 


