class Design < ApplicationRecord

  belongs_to :user
  belongs_to :stone

  validates :model, presence: true

  def price
    # TODO - update based on design.metal and design.type
  end

  def stones_attributes=(stone_attributes)
    stone_attributes.values.each do |stone_attribute|
      stone = Stone.find_or_create_by(stone_attribute)
      self.stone.build(stone)
    end
  end

end
