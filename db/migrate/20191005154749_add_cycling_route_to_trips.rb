class AddCyclingRouteToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :cycling_route, :string
  end
end
