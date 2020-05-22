class AddDeleteAndModerationFlag < ActiveRecord::Migration[5.2]
  def change
    add_column :point_of_interests, :soft_deleted, :boolean, default: false
    add_column :point_of_interests, :moderation, :string, default: 'yes'
    change_column :trips, :moderation, :string, default: 'yes'
    add_column :trips, :soft_deleted, :boolean, default: false
  end
end
