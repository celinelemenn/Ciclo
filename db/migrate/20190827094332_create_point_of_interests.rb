class CreatePointOfInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :point_of_interests do |t|
      t.integer :lat
      t.integer :long
      t.integer :poi_type
      t.string :description
      t.references :user, foreign_key: true
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
