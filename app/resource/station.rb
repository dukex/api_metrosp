UtopiaData.register :station do
  model do
    belongs_to :line

    default_scope :include => [:line]
  end
end
