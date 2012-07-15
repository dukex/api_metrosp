UtopiaData.register :status do
  no_route true
  class_name "Status"
  table_name "status"

  model do
    belongs_to :line
  end
end
