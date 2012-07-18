class AddSchedulesToStations < ActiveRecord::Migration
  def change
    add_column :stations, :schedules, :text
  end
end
