class Api::V1::StreamController < ApplicationController
  before_filter :authenticate_user

end
