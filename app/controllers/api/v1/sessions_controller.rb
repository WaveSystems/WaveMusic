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
    sign_out(resource_name)
  end

  private
  
  def invalid_login_attempt
    render json: { success: false, message: 'Invalid login attempt' }
  end

end
