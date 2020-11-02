class PriceRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :home_address
end
