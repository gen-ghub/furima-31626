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
  validates :delivery_id, numericality: { message: "must be other than --" }
  validates :day_id, numericality: { message: "must be other than --" }
  validates :area_id, numericality: { message: "must be other than --" }
  validates :status_id, numericality: { message: "must be other than --" }
  validates :tag_id, numericality: { message: "must be other than --" }
  end

  validates :price, numericality: { greater_than_or_equal_to: 300,      less_than_or_equal_to: 9999999, }

end
