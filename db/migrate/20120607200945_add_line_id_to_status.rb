class AddLineIdToStatus < ActiveRecord::Migration
  def change
    add_column :status, :line_id, :integer
  end
end
