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

  validates :delivery_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :tag_id, numericality: { other_than: 1 }


end
