require 'rails_helper'

RSpec.describe Shopping, type: :model do
  describe '購入情報の保存' do
    before do
      @shopping = FactoryBot.build(:shopping)
    end
    context '保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@shopping).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      it '郵便番号にハイフン（-）ないと保存できないこと' do
        @shopping.postal_code = "1234567"
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '電話番号にはハイフンは不要で、11桁以内でないと保存できないこと' do
        @shopping.phone_number = "123456789111"
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Phone number is enter within 11 digits")
      end

    end
  end

end
