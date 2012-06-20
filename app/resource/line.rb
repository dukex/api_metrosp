UtopiaData.register :line do
  model do
    has_one :status
    has_many :stations
  end
end
