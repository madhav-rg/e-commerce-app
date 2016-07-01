class Order < ActiveRecord::Base
  attr_accessible :customer_id, :item_id, :user_id, :quantity
  
  belongs_to :customer
  has_one :item
  belongs_to :users



end
