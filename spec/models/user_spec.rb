require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it "nameとemail、passwrodとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "nameが10文字以下で登録できる" do
        @user.name = "aaaaaaaaaa"
        expect(@user).to be_valid
      end
      
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空では登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "nameが11文字以上では登録できない" do
        @user.name = "bbbbbbbbbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is too long (maximum is 10 characters)")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailでは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下では登録できない" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "654321"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
