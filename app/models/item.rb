class Item < ApplicationRecord
  belongs_to :genre
  has_many   :cart_items, dependent: :destroy
  has_many   :order_details, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: [true, false]

  def add_tax_price
    (self.price * 1.08).round
  end

  def self.looks(search, word)
    @item = Item.where("name LIKE?","%#{word}%")
  end
  
end
