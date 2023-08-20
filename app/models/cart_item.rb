class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :item
  
  def subtotal
    item.add_tax_price * count
  end
  
end
