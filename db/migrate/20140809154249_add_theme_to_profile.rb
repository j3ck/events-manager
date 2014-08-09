class AddThemeToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :theme, :string, default: "application"
  end
end
