class ItemSerializer < ActiveModel::Serializer
	include FastJsonapi::ObjectSerializer
 # attributes to be serialized
  attributes :name,:created_at,:updated_at
  belongs_to :todo
end
