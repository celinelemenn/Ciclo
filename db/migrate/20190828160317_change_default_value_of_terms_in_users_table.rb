class ChangeDefaultValueOfTermsInUsersTable < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :terms, :boolean, default: nil
  end
end
