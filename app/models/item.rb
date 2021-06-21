class Item < ApplicationRecord
  belongs_to :todo
  validate :name
  #validates_presence_of :name
end
