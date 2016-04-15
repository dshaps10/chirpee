get '/login' do
	erb :login
end

post '/login' do
	user = User.find_by(email: params[:email])
	if user && user.password == params[:password]
		puts "it works"
		login(user)
		redirect "/users/#{user.id}/feed"
	else
		puts "we suck"
		@login_failed = true
		redirect '/'
	end
end

get '/logout' do
	logout!
	redirect '/'
end

get '/users/:user_id/feed' do
	# @user = User.find(params[:user_id])
	# if current_user == @user
		erb :feed
	# else
	# 	redirect '/'
	# end
end

get '/users/:user_id/profile' do
	# @user = User.find(params[:user_id])
	# if current_user == @user
		erb :profile
	# else
	# 	flash[:warning] = "Sorry this page is private"
	#  	redirect '/'
	# end
end
