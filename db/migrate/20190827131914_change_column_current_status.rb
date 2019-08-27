class ChangeColumnCurrentStatus < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :current_status, :bio
  end
end
