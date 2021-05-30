require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe "コメントの保存" do
    context "コメントが保存できる場合" do
      it "コメントが書かれていれば保存できる" do
        expect(@comment).to be_valid
      end
    end

    context "コメントが保存できない場合" do
      it "コメントが空欄だと保できない" do
        @comment.comment = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end

      it "ツイートに紐付いていないと保存できない" do
        @comment.tweet = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Tweet must exist")
      end

      it "ユーザーに紐付いていないと保存できない" do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
    end
  end
end
