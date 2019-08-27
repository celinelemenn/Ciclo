class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :point_of_interest, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :issue_type
      t.text :content

      t.timestamps
    end
  end
end
