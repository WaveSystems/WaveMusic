class Api::V1::MusicController < ApplicationController
  before_filter :authenticate_user!

  def index
    @songs = Song.all
    render :json => @songs.collect { |p| p.to_jq_upload }.to_json
  end

  def create
    @song = Song.new(params[:song])
    if @song.save
      respond_to do |format|
        format.html {  
          render :json => [@song.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => [@song.to_jq_upload].to_json			
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    render :json => true
  end
end
