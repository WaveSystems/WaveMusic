class Api::V1::StreamController < ApplicationController
  before_filter :authenticate_user!

  def index
    @songs = Song.all
  end

  def upload
    @song = Song.new
  end

  def save
    @song = Song.new(params[:song])
    if @song.save
      flash[:notice]="Successfully uploaded song"
      redirect_to api_v1_stream_index_path
    else
      flash[:alert]="Couldn't save the song"
      redirect_to upload_api_v1_stream_index_path
    end
  end

  def download
    song = Song.find(params[:id])
    send_file "#{Rails.root}/public#{song.song.url}", type: MIME::Types.type_for(song.song.url).first.to_s
  end

  def play
  end

end
