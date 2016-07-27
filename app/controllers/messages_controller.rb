class MessagesController < ApplicationController
  before_action :logged_in_user
  before_action :get_messages

  def index
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'room_channel',
        message: message.content,
        user:    message.user.username
      head :ok
    end
  end

  private

    def get_messages
      @messages = Message.all
      @message  = current_user.messages.build
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
