class RemoveCollumnsToStations < ActiveRecord::Migration
  def up
    remove_column :stations, :elevator
    remove_column :stations, :elevator_for_people_with_disabilities
    remove_column :stations, :information_desk
    remove_column :stations, :suggestioni_box
    remove_column :stations, :toilets
  end

  def down
    add_column :stations, :toilets, :string
    add_column :stations, :suggestioni_box, :string
    add_column :stations, :information_desk, :string
    add_column :stations, :elevator_for_people_with_disabilities, :string
    add_column :stations, :elevator, :string
  end
end
