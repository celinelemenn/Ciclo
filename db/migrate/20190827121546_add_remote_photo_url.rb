class AddRemotePhotoUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remote_photo_url, :string
  end
end
