class Order < ApplicationRecord
  belongs_to :user
  has_one :delivery_address
end
