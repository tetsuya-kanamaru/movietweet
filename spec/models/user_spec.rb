require 'rails_helper'

describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nameが空だと登録できない" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "nameが20文字以上だと登録できない" do
      @user.name = "abcdefghijklmnopqrstu"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is too long (maximum is 20 characters)")
    end

    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空だと登録できず、password_confirmationと一致しなければならない" do
      @user.password = ""
      @user.password == @user.password_confirmation
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end

    it "password_confirmationが空だと登録できず、passwordと一致しなければならない" do
      @user.password_confirmation = ""
      @user.password_confirmation == @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password confirmation can't be blank")
    end
  end
end
