require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context "ツイートが保存できる場合" do
      it "タイトルと画像（動画）があれば保存される" do
        expect(@tweet).to be_valid
      end

      it "説明が空欄でも保存される" do
        @tweet.content = ""
        expect(@tweet).to be_valid
      end
    end
    
    context 'ツイートが保存できない場合' do
      it "タイトルがないと保存できない" do
        @tweet.title = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end

      it "タイトルが11文字以上だと保存できない" do
        @tweet.title = "aaaaaaaaaaa"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title is too long (maximum is 10 characters)")
      end

      it "画像（動画）がないと保存できない" do
        @tweet.attachment = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Attachment can't be blank")
      end

      it "ユーザーが紐付いていないとツイートできない" do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("User must exist")
      end
    end
  end
end
