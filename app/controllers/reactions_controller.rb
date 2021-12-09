class ReactionsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    reaction = Reaction.find_or_initialize_by(to_user_id: params[:user_id], from_user_id: current_user.id)
    reaction.update_attributes(
      status: params[:reaction]
    )
  end

  # def create
  #   @like = Like.new(
  #     by_user_id: current_user.id,
  #     to_user_id: params[:id]
  #   )
  #   @like.save
  #   redirect_to("/users/#{params[:id]}")
  # end

  # def destroy
  #   @like = Like.find_by(
  #     by_user_id: current_user.id,
  #     to_user_id: params[:id]
  #   )
  #   @like.destroy
  #   redirect_to("/users/#{params[:id]}")
  # end
end