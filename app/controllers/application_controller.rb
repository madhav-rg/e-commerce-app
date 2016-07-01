class ApplicationController < ActionController::Base
  protect_from_forgery


def after_sign_out_path_for(resource)
	new_user_session_path(current_user)

end

def after_sign_in_path_for(resource)
 	users_path() #your path
end

def after_update_path_for(resource)
	customer_path(current_user)

end

end
