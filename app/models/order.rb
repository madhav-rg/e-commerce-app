class Order < ActiveRecord::Base
  attr_accessible :customer_id, :item_id
  
  belongs_to :customer
  belongs_to :item


end
