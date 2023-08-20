class Item < ApplicationRecord
  belongs_to :genre
  has_many   :cart_items, dependent: :destroy
  has_many   :order_details, dependent: :destroy
  
  has_one_attached :image
  
  validates :is_active, inclusion: [true, false]
  
  def add_tax_price
    (self.price * 1.08).round
  end
end
