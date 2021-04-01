class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_root_path, except: [:index, :show, :search]

  def index
    if user_signed_in?
      @tweets = Tweet.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to root_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private

    def tweet_params
      params.require(:tweet).permit(:title, :content, :attachment).merge(user_id: current_user.id)
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def move_to_root_path
      unless user_signed_in?
        redirect_to root_path
      end
    end
end
