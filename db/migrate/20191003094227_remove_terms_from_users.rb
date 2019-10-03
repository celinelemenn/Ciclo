class RemoveTermsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :terms, :boolean
  end
end
