class CartItem < ApplicationRecord

  belongs_to :member
  belongs_to :item

  validates :quantity, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  # カート内の同一商品を追加する時１０を超えることができてしまうのを阻止するための記述

  def subtotal
    item.add_tax_price * quantity
  end

end
