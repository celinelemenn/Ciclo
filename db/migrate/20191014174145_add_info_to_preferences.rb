class AddInfoToPreferences < ActiveRecord::Migration[5.2]
  def change
    add_column :preferences, :info_point, :boolean, default: true
    add_column :preferences, :electricity, :boolean, default: true
  end
end
