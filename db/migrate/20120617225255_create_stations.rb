class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :address
      t.text :description
      t.boolean :suggestioni_box
      t.boolean :elevator
      t.boolean :toilets
      t.boolean :information_desk
      t.boolean :bicycle_rack
      t.string :photo_url
      t.string :capacity
      t.string :area
      t.date :inauguration_date
      t.boolean :elevator_for_people_with_disabilities
      t.string :schedule_sunday_to_friday
      t.string :schedule_saturday
      t.string :map_url

      t.timestamps
    end
  end
end
