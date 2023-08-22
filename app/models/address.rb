class Address < ApplicationRecord
  belongs_to :member

  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
end
