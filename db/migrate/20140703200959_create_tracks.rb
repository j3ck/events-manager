class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :track_id
      t.integer :event_id

      t.timestamps
    end
  end
end
