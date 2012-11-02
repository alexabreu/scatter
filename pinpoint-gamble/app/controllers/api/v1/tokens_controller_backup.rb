class Api::V1::TokensController < ApplicationController
    skip_before_filter :verify_authenticity_token
    respond_to :json
    def create
      email = params[:email]
      password = params[:password]
      password = params[:uuid]
      
      if request.format != :json
        render :status=>406, :json=>{:message=>"The request must be json", :request=>request.content_type}
        return
       end

    if email.nil? or password.nil?
       render :status=>400,
              :json=>{:message=>"The request must contain the Player email and password."}
       return
    end

    @Player=Player.find_by_email(email.downcase)

    if @Player.nil? and not email.empty?
      logger.info("Player #{email} failed signin, Player cannot be found.")
      logger.info("Creating new account for #{email}")
      # Create Player and return auth token
      @Player = Player.new({:email=>email, :password=>password, :password_confirmation=>password}).save(:validate => false)
      render :status=>200, :json=>{:token=>p.authentication_token}
      return
    else 
    	
    end

    # http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
    @Player.ensure_authentication_token!

    if not @Player.valid_password?(password)
      logger.info("Player #{email} failed signin, password \"#{password}\" is invalid")
      render :status=>401, :json=>{:message=>"Invalid email or password."}
    else
      render :status=>200, :json=>{:token=>@Player.authentication_token}
    end
  end

  def destroy
    @Player=Player.find_by_authentication_token(params[:id])
    if @Player.nil?
      logger.info("Token not found.")
      render :status=>404, :json=>{:message=>"Invalid token."}
    else
      @Player.reset_authentication_token!
      render :status=>200, :json=>{:token=>params[:id]}
    end
  end

end
