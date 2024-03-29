class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.integer :km
      t.string :blog
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
