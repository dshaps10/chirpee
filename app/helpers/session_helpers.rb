helpers do 

	def login(user)
		session[:user_id] = user.id
	end 

	def logout!
		session[:user_id] = nil
	end 

	def logged_in?
		!!current_user
	end 

	def current_user 
		if session[:user_id]
			@current_user ||= User.where(id: session[:user_id])
		end 
	end 
end 