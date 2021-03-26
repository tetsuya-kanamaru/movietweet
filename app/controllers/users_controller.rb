class UsersController < ApplicationController
  def show
    @name = current_user.name
    @tweets = current_user.tweets
  end
end
