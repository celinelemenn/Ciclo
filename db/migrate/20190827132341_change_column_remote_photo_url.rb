class ChangeColumnRemotePhotoUrl < ActiveRecord::Migration[5.2]
  def change
        rename_column :users, :remote_photo_url, :photo
  end
end
