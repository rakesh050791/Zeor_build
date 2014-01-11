class Category < ActiveRecord::Base
  attr_accessible :description, :title, :type
  has_many :sub_category
end
