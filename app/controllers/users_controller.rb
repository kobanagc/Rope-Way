class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    query = "SELECT * FROM users"
    @users = User.find_by_sql(query)
  end

  def show
    @user = User.find(params[:id])
    # @likes_count = Like.where(to_user_id: @user.id).count
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(profile_params)
      redirect_to "/users/#{@user.id}"
    else
      render action: :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private

  def profile_params
    params.require(:user).permit(:self_pr, :age, :residence_id, :image)
  end
end
