class CreateTagships < ActiveRecord::Migration
  def change
    create_table :tagships do |t|
    	t.belongs_to :event
    	t.belongs_to :tag

      t.timestamps
    end
    add_index :tagships, :event_id
    add_index :tagships, :tag_id
  end
end
