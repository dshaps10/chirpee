get '/' do
	if logged_in?
		user = current_user
		redirect "/users/#{user.id}/profile"
	else
		redirect '/login'
	end
end