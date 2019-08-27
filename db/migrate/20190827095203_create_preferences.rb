class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
      t.references :user, foreign_key: true
      t.boolean :water_refill, default: true
      t.boolean :camping, default: true
      t.boolean :caution, default: true
      t.boolean :landmark, default: true
      t.boolean :cyclists, default: true
      t.boolean :bookmarks, default: true

      t.timestamps
    end
  end
end
