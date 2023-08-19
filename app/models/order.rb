class Order < ApplicationRecord
  belongs_to :member
  has_many   :order_details, dependent: :destroy
  
  enum pay_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting: 0, confirm: 1, making: 2, preparing: 3, shipped: 4 }
end
