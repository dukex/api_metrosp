UtopiaData.register :station do
  model do
    belongs_to :line
    validates_presence_of :line_id

    default_scope :include => [:line]
  end
end
