class ChangeLatLongToFloatofUserPosition < ActiveRecord::Migration[5.2]
  def change
    change_column :user_positions, :lat, :decimal, { precision: 10, scale: 6 }
    change_column :user_positions, :long, :decimal, { precision: 10, scale: 6 }
  end
end
