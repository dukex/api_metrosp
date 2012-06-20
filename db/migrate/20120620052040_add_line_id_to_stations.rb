class AddLineIdToStations < ActiveRecord::Migration
  def change
    add_column :stations, :line_id, :integer
  end
end
