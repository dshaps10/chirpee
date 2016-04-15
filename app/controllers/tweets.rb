get '/users/:user_id/new_tweet' do
	erb :tweet
end

post '/users/:user_id/new_tweet' do
	user = User.find(session[:user_id])
	user.tweets.create(body: params[:body])
	redirect '/users/#{user.id}/profile'
end