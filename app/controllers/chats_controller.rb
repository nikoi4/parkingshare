class ChatsController < ApplicationController
  before_action :set_booking, only: [:index, :create]

  def index
    @chats = policy_scope(Chat).where(booking: @booking)
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.user = current_user
    @chat.booking = @booking
    authorize(@chat)
    respond_to do |format|
      if @chat.save
        # format.html { redirect_to booking_chat, notice: 'Message was successfully posted.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        # format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :identifier)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
