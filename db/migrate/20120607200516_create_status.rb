class CreateStatus < ActiveRecord::Migration
  def change
    create_table :status do |t|
      t.string :name
      t.text :description

      t.datetime :updated_at
    end
  end
end
