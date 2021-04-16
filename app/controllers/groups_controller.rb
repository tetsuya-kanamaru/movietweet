class GroupsController < ApplicationController

  def index
    @groups = current_user.groups

    if user_signed_in?
      @tweets = Tweet.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    end
  end

  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end
  
  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

end
