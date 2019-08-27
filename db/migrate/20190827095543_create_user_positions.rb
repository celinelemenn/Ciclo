class CreateUserPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_positions do |t|
      t.integer :lat
      t.integer :long
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
