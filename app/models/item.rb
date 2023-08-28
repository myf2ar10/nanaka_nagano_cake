class Item < ApplicationRecord
  belongs_to :genre
  has_many   :cart_items,     dependent: :destroy
  has_many   :order_details,  dependent: :destroy

  has_one_attached :image

  validates :image,       presence: true
  validates :name,        presence: true, length: {maximum: 40}
  validates :detail,      presence: true, length: {maximum: 250}
  validates :price,       presence: true, numericality: {only_integer: true}
  validates :is_active,   inclusion: [true, false]

  def add_tax_price
    (self.price * 1.08).round
  end

  def self.looks(search, word, include_inactive = false)
    items = where("name LIKE ?", "%#{word}%")
    items = items.where(is_active: true) unless include_inactive
    items
  end

end
