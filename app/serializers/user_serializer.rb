class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :location
end
