class Song < ActiveRecord::Base
  validates_uniqueness_of :name
  mount_uploader :song, SongUploader
  attr_accessible :name, :song, :song_cache

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:song),
      "size" => song.size,
      "url" => song.url,
      "song_url" => song.thumb.url,
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
