class Item < ApplicationRecord
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



  belongs_to :user
  has_one_attached :image
end
