class User < ApplicationRecord
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_second_name, presence: true
  validates :birthday, presence: true
  # validates :email, unique: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'


  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :second_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン一-]+\z/, message: '全角（カタカナ）を使用してください' } do
    validates :first_name
    validates :second_name
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

