class AddDetailsToEventsStatus < ActiveRecord::Migration
  def change
  	remove_column :events, :status, :boolean
  	add_column :events, :status, :boolean, default: true
  end
end
