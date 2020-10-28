class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery
  belongs_to_active_hash :day
  belongs_to_active_hash :area
  belongs_to_active_hash :status
  belongs_to_active_hash :tag

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :delivery_id
    validates :day_id
    validates :price
    validates :area_id
    validates :status_id
    validates :tag_id
    validates :image
  end

  with_options numericality: { other_than: 1 } do
  validates :delivery_id
  validates :day_id
  validates :area_id
  validates :status_id
  validates :tag_id
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }, unless: :price_box?

  def price_box?
    price == ''
  end



end
