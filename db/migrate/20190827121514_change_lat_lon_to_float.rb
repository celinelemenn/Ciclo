class ChangeLatLonToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :point_of_interests, :lat, :decimal, { precision: 10, scale: 6 }
    change_column :point_of_interests, :long, :decimal, { precision: 10, scale: 6 }
  end
end
