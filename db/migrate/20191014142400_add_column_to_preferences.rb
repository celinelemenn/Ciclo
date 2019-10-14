class AddColumnToPreferences < ActiveRecord::Migration[5.2]
  def change
    add_column :preferences, :hotel, :boolean, default: true
    add_column :preferences, :toilet, :boolean, default: true
    add_column :preferences, :wild_camping, :boolean, default: true
    add_column :preferences, :bar, :boolean, default: true
    add_column :preferences, :shopping, :boolean, default: true
    add_column :preferences, :wifi, :boolean, default: true
    add_column :preferences, :picnic, :boolean, default: true
    add_column :preferences, :repair, :boolean, default: true
  end
end
