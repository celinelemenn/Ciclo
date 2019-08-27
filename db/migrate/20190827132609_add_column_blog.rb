class AddColumnBlog < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :blog, :string
  end
end
