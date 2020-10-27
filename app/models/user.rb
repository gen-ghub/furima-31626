class User < ApplicationRecord
  # validates :nickname, presence: true
  # validates :first_name, presence: true
  # validates :second_name, presence: true
  # validates :kana_first_name, presence: true
  # validates :kana_second_name, presence: true
  # validates :birthday, presence: true
  # validates :email, unique: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

