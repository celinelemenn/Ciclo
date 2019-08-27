class CreateDownvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :downvotes do |t|
      t.references :point_of_interest, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
