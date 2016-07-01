class Customer < ActiveRecord::Base
  attr_accessible :city, :email, :name, :pincode, :user_id

  has_many :items, through: :orders
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :city, presence: true
  validates :pincode, numericality: { only_integer: true }, allow_nil: true


=begin
  before_destroy :delete_orders

  def delete_orders 

  	Rails.logger.debug "In delete_ordersssssssssssssssss methoddddddd: #{self.inspect}"
  	cust = Customer.find(self.id)
  	@orders_del = cust.orders
  	@orders_del.each do |k|
  		Rails.logger.debug "In delete_ordersssssssssssssssss methoddddddd: #{k.inspect}"
  		k.destroy

  	end

  end
=end  

end
