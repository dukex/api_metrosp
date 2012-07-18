class RemoveScheduleSundayToFridayScheduleSaturdayToStation < ActiveRecord::Migration
  def up
    remove_column :stations, :schedule_saturday
    remove_column :stations, :schedule_sunday_to_friday
  end

  def down
    add_column :stations, :schedule_sunday_to_friday, :string
    add_column :stations, :schedule_saturday, :string
  end
end
