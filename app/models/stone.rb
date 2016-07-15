class Stone < ApplicationRecord

  has_many :designs
  has_many :users, through: :designs

  validates :name, :weight, :cost, presence: true

  def designs_attributes=(design_attributes)
    design_attributes.values.each do |design_attribute|
      design = Design.find_or_create_by(design_attribute)
      self.designs.build(design)
    end
  end

  def self.most_expensive
    Stone.order(cost: :desc).limit(1)[0]
  end

  def self.least_expensive
    Stone.order(cost: :asc).limit(1)[0]
  end

end
