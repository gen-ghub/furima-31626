require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品投稿機能' do
    context '出品投稿がうまくいくとき' do
      it 'name,description,delivery_id,day_id,price,area_id,status_id,tag_id,が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it '価格の範囲が、¥300~¥9,999,999の間であれば登録できる' do
        @item.price = 400
        expect(@item).to be_valid
      end

    end

    context '出品投稿がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'tag_idが--では登録できない' do
        @item.tag_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Tag must be other than --")
      end
      it 'status_idが--では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than --")
      end
      it 'delivery_idが--では登録できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than --")
      end
      it 'area_idが--では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than --")
      end
      it 'day_idが--では登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than --")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが、¥300以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが、¥9999999以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = "４００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

     end
   end
end
