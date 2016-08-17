class StoneSerializer < ActiveModel::Serializer
  attributes :id, :name, :cost, :weight
  has_many :designs 
end
