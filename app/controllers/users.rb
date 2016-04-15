get '/login' do
	erb :sign_in
end

post '/login' do
	user = User.find_by(email: params[:email])
	if user && user.password == params[:password]
			login(user)
			redirect "/users/#{user.id}/feed"
		else
			erb :sign_in
	end 
end

get '/sign_up/new' do
	erb :sign_up
end

post '/sign_up' do
	User.create(last_name: params[:last_name], first_name: params[:first_name], handle: params[:handle], email: params[:email], city: params[:city], state: params[:state], password: params[:password])
	redirect '/login'
end

get '/logout' do
	logout!
	redirect '/'
end

get '/users/:user_id/feed' do
	@user = User.find(params[:user_id])
	@tweets =
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
