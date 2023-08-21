class OrderDetail < ApplicationRecord
  has_many :order
  has_many :item

  enum making_status: { not_available: 0, waiting_for_makiing: 1, making: 2, made: 3 }

  def add_tax_price
    (self.price * 1.08).round
  end
end
