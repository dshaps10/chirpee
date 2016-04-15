get '/users/new_tweet' do
	@user = User.find(session[:user_id])
	erb :tweet
end

post '/users' do
	user = User.find(session[:user_id])
	user.tweets.create(body: params[:body])
	redirect "/users/#{user.id}/profile"
end
