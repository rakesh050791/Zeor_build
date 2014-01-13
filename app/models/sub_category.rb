class SubCategory < ActiveRecord::Base
  attr_accessible :description, :title, :category_id
  belongs_to :category
  has_many :items
end
