UtopiaData.register :station do
  model do
    belongs_to :line
    validates_presence_of :line_id
  end
end
