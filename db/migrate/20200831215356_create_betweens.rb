class CreateBetweens < ActiveRecord::Migration[6.0]
  def change
    create_table :betweens do |t|
      t.integer :user_id
      t.integer :playlist_id
      t.timestamps
    end
  end
end
