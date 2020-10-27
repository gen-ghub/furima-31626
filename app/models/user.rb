class User < ApplicationRecord
  validates :nickname, presence: true
  validates :birthday, presence: true


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'


  validates :kana_first_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }, unless: :first_box?

  def first_box?
    first_name == ""
  end

  validates :kana_second_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }, unless: :second_box?

  def second_box?
    second_name == ""
  end

  validates :kana_first_name, presence: true,format: { with: /\A[ァ-ン一-]+\z/, message: '全角（カタカナ）を使用してください' }, unless: :kana_first_box?

  def kana_first_box?
    kana_first_name == ""
  end

  validates :kana_second_name, presence: true,format: { with: /\A[ァ-ン一-]+\z/, message: '全角（カタカナ）を使用してください' }, unless: :kana_second_box?

  def kana_second_box?
    kana_second_name == ""
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

