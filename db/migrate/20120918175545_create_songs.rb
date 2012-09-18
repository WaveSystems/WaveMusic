class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string   :name
      t.string   :song

      t.timestamps
    end
  end
end
