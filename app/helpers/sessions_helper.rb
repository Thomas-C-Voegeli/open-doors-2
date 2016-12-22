module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	# def current_user
	# 	@current_user ||= User.find_by(id: session[:user_id])
	# end

	def is_verified?
		current_user.id == params[:id].to_i
	end

	#The logged_in? method here is not accessible from our users controller, so I added it to our application controller.
	
	# def logged_in?
	# 	!current_user.nil?
	# end

end
