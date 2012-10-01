class Song < ActiveRecord::Base
  validates_uniqueness_of :name
  mount_uploader :song, SongUploader
  attr_accessible :name, :song, :song_cache

  def json_format
    {name: name, filename: read_attribute(:song), size: song.size, url: song.url, delete_url: "/api/v1/music/#{id}", delete_type: "DELETE"}
  end

  class << self
    def info
      all.map { |song| song.json_format }
    end
  end
end
