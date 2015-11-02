class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:destroy]

  def index
    @messages = current_user.messages
  end

  def new
    @user = User.find(params[:user_id])
    @message = Message.new
  end

  def create
    user = User.find(params[:user_id])
    @message = Message.new(sender: current_user, receiver: user, body: message_params[:body])
    if @message.save
      redirect_to user, notice: 'Your message has been sent!'
    else
      render :new, notice: 'Your message failed to send.'
    end
  end

  def destroy
    if @message.destroy
      redirect_to messages_url, notice: 'Message was successfully deleted.'
    else
      redirect_to messages_url, notice: 'Not able to delete this message.'
    end
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end
