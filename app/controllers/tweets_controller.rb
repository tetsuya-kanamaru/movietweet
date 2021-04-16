class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_root_path, except: [:index, :show, :search]
  before_action :set_group, except: :show

  def index
    if user_signed_in?
      # @tweets = Tweet.where(user_id: current_user.id).includes(:user).order("created_at DESC")
      @tweets = @group.tweets.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    end
  end

  # def new
  #   @tweet = Tweet.new
  # end

  def create
    # Tweet.create(tweet_params)
    # redirect_to root_path
    @tweet = @group.tweets.new(tweet_params)

    if @tweet.save
      redirect_to group_tweets_path
    end
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
    @comments = @tweet.comments.includes(:user).order("created_at DESC")
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

    def set_group
      @group = Group.find(params[:group_id])
    end

    def move_to_root_path
      unless user_signed_in?
        redirect_to root_path
      end
    end
end
