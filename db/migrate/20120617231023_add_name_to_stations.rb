class AddNameToStations < ActiveRecord::Migration
  def change
    add_column :stations, :name, :string
  end
end
