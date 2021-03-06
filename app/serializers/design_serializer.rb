class DesignSerializer < ActiveModel::Serializer
  attributes :id, :metal, :model
  has_one :stone, serializer: DesignStoneSerializer
  has_one :user, serializer: DesignUserSerializer
end
