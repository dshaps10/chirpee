get '/' do
	if logged_in?
		redirect "/users/#{user.id}/profile"
	else
		redirect '/login'
	end
end