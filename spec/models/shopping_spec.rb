require 'rails_helper'

RSpec.describe Shopping, type: :model do
  describe '購入情報の保存' do
    before do
      @shopping = FactoryBot.build(:shopping)
    end
    context '保存がうまくいくとき' do
      it 'tokenと住所情報があれば保存できること' do
        expect(@shopping).to be_valid
      end
      it '建物名が存在しなくても保存ができること' do
        @shopping.building_name = nil
        expect(@shopping).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      it '郵便番号が空だと保存できないこと' do
        @shopping.postal_code = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフン（-）ないと保存できないこと' do
        @shopping.postal_code = "1234567"
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空だと保存できないこと' do
        @shopping.area_id = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @shopping.town = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Town can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @shopping.town_number = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Town number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @shopping.phone_number = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にはハイフンは不要で、11桁以内でないと保存できないこと' do
        @shopping.phone_number = "123456789111"
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Phone number is enter within 11 digits")
      end
      it "tokenが空では登録できないこと" do
        @shopping.token = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Token can't be blank")
      end

    end
  end

end
