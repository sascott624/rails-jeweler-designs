class Design < ApplicationRecord

  belongs_to :user
  belongs_to :stone

  validates :model, presence: true

  def price
    # TODO - update based on design.metal and design.type
  end

end
