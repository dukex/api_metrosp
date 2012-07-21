class RemoveBicycleRackToStations < ActiveRecord::Migration
  def up
    remove_column :stations, :bicycle_rack
  end

  def down
    add_column :stations, :bicycle_rack, :string
  end
end
