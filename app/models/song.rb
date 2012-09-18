class Song < ActiveRecord::Base
  mount_uploader :song, SongUploader
  attr_accessible :name, :song, :song_cache
end
