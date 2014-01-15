class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :query, :subject
end
