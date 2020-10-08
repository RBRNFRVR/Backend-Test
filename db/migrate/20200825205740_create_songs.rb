class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :cover
      t.string :title
      t.string :artist
      t.string :preview
      t.timestamps
    end
  end
end
