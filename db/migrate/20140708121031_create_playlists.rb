class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :event_id

      t.timestamps
    end
  end
end
