class AddRestoToPreferences < ActiveRecord::Migration[5.2]
  def change
    add_column :preferences, :resto, :boolean, default: true
  end
end
