class OrderDetail < ApplicationRecord
  has_many :order
  has_many :item
end
