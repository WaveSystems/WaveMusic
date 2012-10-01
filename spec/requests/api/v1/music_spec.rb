require 'spec_helper'

describe Api::V1::MusicController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @song = FactoryGirl.create(:song)
  end

  describe "GET /api/v1/music" do

    it 'should be success' do
      get api_v1_music_index_path(auth_token: @user.authentication_token, format: :json)
      response.should be_success
    end

    it 'should get songs info' do
      get api_v1_music_index_path(auth_token: @user.authentication_token, format: :json)
      ActiveSupport::JSON.decode(response.body)[0]['name'].should == 'La Negra Tomasa'
    end

  end

end
