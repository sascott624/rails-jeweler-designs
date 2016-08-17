class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :location
  has_many :designs
end
