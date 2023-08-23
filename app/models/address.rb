class Address < ApplicationRecord
  belongs_to :member

  validates :post_code,   presence: true, length: {is: 7},numericality: {only_integer: true}
  validates :address,     presence: true, length: {maximum: 50}
  validates :name,        presence: true, length: {maximum: 40}
end
