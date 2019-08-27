class AddPhotoToPointOfInterests < ActiveRecord::Migration[5.2]
  def change
    add_column :point_of_interests, :photo, :string
  end
end
