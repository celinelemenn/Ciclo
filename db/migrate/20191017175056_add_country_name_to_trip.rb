class AddCountryNameToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column  :point_of_interests, :country_name, :string
  end
end
