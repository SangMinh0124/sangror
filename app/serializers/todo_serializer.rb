class TodoSerializer < ActiveModel::Serializer
	include FastJsonapi::ObjectSerializer
   # attributes to be serialized
  attributes :title, :descrip, :created_at, :updated_at
  # model association
  has_many :items
end
