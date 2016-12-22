module SessionsHelper

	def logged_in?
		!current_user.nil?
	end

	def log_in(user)
		session[:user_id] = user.id
	end

	def is_verified?
		current_user.id == params[:id].to_i
	end

end

