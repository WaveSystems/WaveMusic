require 'spec_helper'

describe Api::V1::SessionsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe 'POST /api/v1/sessions' do

    it 'should login if user is valid' do
      post api_v1_sessions_path(user_login: { email: @user.email, password: @user.password } )
      ActiveSupport::JSON.decode(response.body)['success'].should be_true
    end

    it 'should reject login attempt if not valid' do
      post api_v1_sessions_path(user_login: { email: @user.email, password: 'not password' } )
      response.should_not be_success
    end

    it 'should get authentication token for keep logged in' do
      post api_v1_sessions_path(user_login: { email: @user.email, password: @user.password } )
      ActiveSupport::JSON.decode(response.body)['auth_token'].should == 'an authentication_token'
    end

  end

  describe 'DELETE /api/v1/session' do

    it 'should destroy session' do
      post api_v1_sessions_path(user_login: { email: @user.email, password: @user.password } )
      delete api_v1_session_path(@user)
      response.should be_success
    end

    it 'should get meesage when logged out' do
      post api_v1_sessions_path(user_login: { email: @user.email, password: @user.password } )
      delete api_v1_session_path(@user)
      ActiveSupport::JSON.decode(response.body)['message'].should == 'Successfully logged out'
    end

  end

end
