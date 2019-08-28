class AddTitleToPointOfInterests < ActiveRecord::Migration[5.2]
  def change
    add_column :point_of_interests, :title, :string
  end
end
