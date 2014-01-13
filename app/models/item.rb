class Item < ActiveRecord::Base
  attr_accessible :amount, :description, :item_type, :sub_category_id, :title
  belongs_to :sub_category
end
