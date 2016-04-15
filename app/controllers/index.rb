get '/' do
	if session[:user_id]
		user = User.find_by(id: session[:user_id])
		redirect "/users/#{user.id}/profile"
	else
		erb :sign_in
	end
	# else
	# 	redirect '/login'
	# end
end
