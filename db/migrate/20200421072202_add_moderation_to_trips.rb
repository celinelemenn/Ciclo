class AddModerationToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :moderation, :boolean, default: true
  end
end
