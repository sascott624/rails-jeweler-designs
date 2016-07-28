class Design < ApplicationRecord

  belongs_to :user
  belongs_to :stone

  validates :model, :metal, :stone_id, presence: true

  def stone_attributes=(attributes)
    @stone = self.build_stone(name: attributes[:name], weight: attributes[:weight], cost: attributes[:cost])
  end

  def price
    (self.metal_cost * self.model_cost) * self.stone.cost
  end

  def metal_cost
    case self.metal
    when "Yellow Gold"
      2.0
    when "White Gold"
      2.2
    when "Pink Gold"
      2
    when "Sterling Silver"
      1.2
    when "Platinum"
      3
    else
      nil
    end
  end

  def model_cost
    case self.model
    when "Necklace"
      2.6
    when "Bracelet"
      1.7
    when "Earrings"
      2
    when "Ring"
      1.2
    else
      nil
    end
  end

  def self.necklaces
    self.where(model: "Necklace")
  end

  def self.bracelets
    self.where(model: "Bracelet")
  end

  def self.rings
    self.where(model: "Ring")
  end

  def self.earrings
    self.where(model: "Earrings")
  end
end
