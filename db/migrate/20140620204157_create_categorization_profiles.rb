class CreateCategorizationProfiles < ActiveRecord::Migration
  def change
    create_table :categorization_profiles do |t|
    	t.integer :category_id, index: true
    	t.integer :profile_id, index: true

      t.timestamps
    end
  end
end
