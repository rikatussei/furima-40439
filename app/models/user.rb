class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true

  validate  :password_complexity

  private

  def password_complexity
    return if password.blank? || password =~ /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/

    errors.add :password, 'is invalid. Include both letters and numbers'
  end

  # 後で有効化
  # has_many :items, dependent: :destroy
  # has_many :orders, dependent: :destroy

end
