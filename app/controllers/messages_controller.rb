class MessagesController < ApplicationController
  before_action: current_user_rooms only: [:index, :create]
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

  # def create
  #   @room = Room.find(params[:room_id])
  #   @message = @room.messages.new(message_params)
  #   if @message.save
  #     redirect_to room_messages_path(@room)
  #   else
  #     @messages = @room.messages.includes(:user)
  #     render :index
  #   end
  # end

  def create
    # 自分の持っているチャットルームからチャット相手のいるルームを探す
    room = RoomUser.where(room_id: @current_user_rooms, user_id: params[:user_id]).map(&:room).first
    # なければ作成する
    if room.blank?
      room = Room.create
      RoomUser.create(room_id: room, user_id: current_user.id)
      RoomUser.create(room_id: room, user_id: params[:user_id])
    end
    # チャットルームへ遷移させる
    redirect_to action: :show, id: room.id
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def current_user_rooms
    # 自分の持っているチャットルームを取得
    @current_user_rooms = RoomUser.where(user_id: current_user.id).map(&:room)
  end
end
