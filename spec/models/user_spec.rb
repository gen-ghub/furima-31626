require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとfirst_name、second_name、kana_first_name、kana_second_nameとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は全角（漢字、ひらがな、カタカナ）であれば登録できる' do
        @user.first_name = '手すト'
        @user.second_name = '手すト'
        expect(@user).to be_valid
      end
      it 'ユーザー本名（フリガナ）は全角（カタカナ）であれば登録できる' do
        @user.kana_first_name = 'テスト'
        @user.kana_second_name = 'テスト'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'b12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは入力が半角英数字混同でないと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'second_nameが空だと登録できない' do
        @user.second_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name can't be blank")
      end
      it 'first_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'second_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない' do
        @user.second_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name 全角文字を使用してください')
      end
      it 'kana_first_nameが空だと登録できない' do
        @user.kana_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_second_nameが空だと登録できない' do
        @user.kana_second_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana second name can't be blank")
      end
      it 'kana_first_nameは全角（カタカナ）でないと登録できない' do
        @user.kana_first_name = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name 全角（カタカナ）を使用してください')
      end
      it 'kana_second_nameは全角（カタカナ）でないと登録できない' do
        @user.kana_second_name = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana second name 全角（カタカナ）を使用してください')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
