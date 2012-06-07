class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :name
      t.string :color
      t.string :raw_name

      t.timestamps
    end
  end
end
