UtopiaData.register :line do
  model do
    has_one :status
    has_many :stations

    validates_presence_of :raw_name
    validates_uniqueness_of :raw_name

    default_scope :include => [:stations, :status]
  end
end
