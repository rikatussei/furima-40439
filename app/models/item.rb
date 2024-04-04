class Item < ApplicationRecord

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_time_id, presence: true
  validates :price, presence: true

  has_one_attached :image


  # validates :content, presence: true, unless: :was_attached?

  # def was_attached?
    # self.image.attached?
  # end

  belongs_to :user
  # 後で有効化
  # has_one    :order, dependent: :destroy
end
