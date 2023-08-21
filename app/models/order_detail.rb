class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { not_available: 0, waiting_for_makiing: 1, making: 2, made: 3 }
end
