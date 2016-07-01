class Item < ActiveRecord::Base
  attr_accessible :name, :price
  
  has_many :customers, through: :orders
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders

  validates :price, numericality: { greater_than_or_equal_to: 0}
  validates :name, presence: true

end
