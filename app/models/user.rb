class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'

  validates :last_name, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
  validates :last_name_kana, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' }

  # def is_seller?(item)
  #   self.id == item.user_id
  # end

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
end
