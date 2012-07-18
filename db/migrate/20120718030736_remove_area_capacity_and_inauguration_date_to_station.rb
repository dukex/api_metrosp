class RemoveAreaCapacityAndInaugurationDateToStation < ActiveRecord::Migration
  def up
    remove_column :stations, :area
    remove_column :stations, :capacity
    remove_column :stations, :inauguration_date
  end

  def down
    add_column :stations, :inauguration_date, :string
    add_column :stations, :capacity, :string
    add_column :stations, :area, :string
  end
end
