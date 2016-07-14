class Stone < ApplicationRecord

  has_many :designs
  has_many :users, through: :designs

  validates :name, :weight, :cost, presence: true

end
