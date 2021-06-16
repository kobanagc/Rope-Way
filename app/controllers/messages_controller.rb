class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    # current_user_likes = Like.where(by_user_id: current_user.id) 
    # "カレントユーザーがいいねした相手たち" = User.where(id: current_user_likes.to_user_id)
    # likes_current_user = Like.where(to_user_id: current_user.id)
    # "カレントユーザーにいいねした相手のIDたち" = User.where(id: likes_current_user.by_user_id)
    #ヒント .not(id: current_user.id)
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
