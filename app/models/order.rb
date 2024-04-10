class Order < ApplicationRecord
  belongs_to :user
  has_one :delivery_address
  belongs_to :item
end
