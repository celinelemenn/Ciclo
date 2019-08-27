class AddColumnShareLocation < ActiveRecord::Migration[5.2]
  def change
        add_column :users, :share_location, :boolean
  end
end
