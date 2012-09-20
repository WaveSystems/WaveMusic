class Song < ActiveRecord::Base
  validates_uniqueness_of :name
  mount_uploader :song, SongUploader
  attr_accessible :name, :song, :song_cache
end
