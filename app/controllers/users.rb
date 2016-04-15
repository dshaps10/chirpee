# get '/login' do
# 	erb :sign_in
# end

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
	user = User.new(last_name: params[:last_name], first_name: params[:first_name], handle: params[:handle], email: params[:email], city: params[:city], state: params[:state], password: params[:password])
	p user.save
		if user.save
			redirect "/users/#{user.id}/feed"
		else
			redirect '/'
		end
end

get '/logout' do
	logout!
	redirect '/'
end

get '/users/:user_id/feed' do
	@user = User.find(params[:user_id])
		erb :feed
end

get '/users/:user_id/profile' do
	@user = User.find(params[:user_id])
	@tweets = @user.tweets.all
	erb :profile
end

post '/users/:user_id/profile' do
	@user = User.find(params[:user_id])
	follower = User.find(session[:user_id])
	# if user != follower && !follower.followees.include?(user)
		@user.followers << follower
		follower.followees << @user
	# end
	redirect "/users/#{@user.id}/profile"
end
