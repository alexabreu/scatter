class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_default_format
  
  def current_user
	  super || guest_user
  end

  private
  def set_default_format
  	#request.format = "json"
  end
  
  def sign_in_and_redirect( resource_or_scope, resource = nil)
  	render :json => "HELLO"
  end
  		
  def guest_user
    User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = create_guest_user.id : session[:guest_user_id])
  end
	
  def create_guest_user
    u = User.create(:guest => true, :email => "guest_#{Time.now.to_i}#{rand(99)}@example.com")
    u.save(:validate => false)
	u
  end
  
  def after_sign_in_path_for(resource)
  	if request.format == "json"
  		api_v1_token_path
  	else
  		root_path
  	end
  	
  end
  
end
