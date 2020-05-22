class ChangeDefaultModerationForPoi < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:point_of_interests, :moderation, nil)
    change_column_default(:trips, :moderation, nil)
  end
end
