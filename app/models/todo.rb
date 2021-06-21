class Todo < ApplicationRecord
  has_many :items, dependent: :destroy
  validate  :title, :descrip
  #validates_presence_of :title, :descrip
end
