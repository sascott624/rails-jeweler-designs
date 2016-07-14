class Design < ApplicationRecord

  belongs_to :user
  belongs_to :stone

  validates :type, presence: true

  def price
    self.stone.cost
    # TODO - update based on design.metal and design.type
  end

end
