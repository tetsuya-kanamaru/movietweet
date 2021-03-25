class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  private

    def tweet_params
      params.require(:tweet).permit(:title, :content, :image)
    end
end
