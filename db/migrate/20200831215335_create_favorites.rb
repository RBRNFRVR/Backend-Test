class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :song_id
      t.integer :playlist_id
      t.timestamps
    end
  end
end
