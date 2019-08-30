class CreateBookmarksUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks_users do |t|

      t.timestamps
    end
  end
end
