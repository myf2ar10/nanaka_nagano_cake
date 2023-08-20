class CartItem < ApplicationRecord
　# カート内の同一商品を追加する時、１０を超えることができてしまうのを阻止するための記述
  # validates :quantity, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  belongs_to :member
  belongs_to :item
  
  def subtotal
    item.add_tax_price * quantity
  end
  
end
