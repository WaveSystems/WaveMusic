class Api::V1::SessionsController < ApplicationController

  respond_to :json

  def create

    return invalid_login_attempt if params[:user_login].nil?

    resource = User.find_for_database_authentication(email: params[:user_login][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password? (params[:user_login][:password])
      sign_in("user", resource)
      render json: { success: true, auth_token: resource.authentication_token }
    else
      invalid_login_attempt
    end
  end

  def destroy
    if sign_out(params[:user])
      render json: { success: true, message: 'Successfully logged out' }
    else
      respond_with success: false
    end
  end

  private
  
  def invalid_login_attempt
    respond_with success: false
  end

end
