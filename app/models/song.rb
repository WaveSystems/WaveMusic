class Song < ActiveRecord::Base
  mount_uploader :song, SongUploader
end
