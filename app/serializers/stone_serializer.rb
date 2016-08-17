class StoneSerializer < ActiveModel::Serializer
  attributes :id, :name, :cost, :weight
  has_many :designs
  has_many :users
end
