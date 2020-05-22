class ChangeDefaultModerationForPoiAndTrip < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :moderation
    add_column :trips, :moderation, :boolean, default: true
    remove_column :point_of_interests, :moderation
    add_column :point_of_interests, :moderation, :boolean, default: true
  end
end
