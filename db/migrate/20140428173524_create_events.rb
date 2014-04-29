class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.boolean :status
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
