class AddFeaturesToStations < ActiveRecord::Migration
  def change
    add_column :stations, :features, :text
  end
end
