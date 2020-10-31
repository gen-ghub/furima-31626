class PriceRecord < ApplicationRecord
  beiongs_to :user
  beiongs_to :item
  has_one :home_address

end

