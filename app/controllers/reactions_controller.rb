class ReactionsController < ApplicationController
  before_action :authenticate_user!
  
  # def like
  #   Reaction.create(to_user_id: params[:user_id], from_user_id: current_user.id, status: 1)
  # end

  # def nope
  #   reaction = Reaction.find_or_initialize_by(to_user_id: params[:user_id], from_user_id: current_user.id)
  #   reaction.update_attributes(
  #     status: 2
  #   )
  # end

  def create
    Reaction.create!(
      from_user_id: current_user.id,
      to_user_id: params[:id],
      status: params[:status]
    )
    redirect_to users_path
  end

  # def destroy
  #   @like = Like.find_by(
  #     by_user_id: current_user.id,
  #     to_user_id: params[:id]
  #   )
  #   @like.destroy
  #   redirect_to("/users/#{params[:id]}")
  # end
end