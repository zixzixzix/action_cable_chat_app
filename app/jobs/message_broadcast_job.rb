class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    message.mentions.each do |mention|
      ActionCable.server.broadcast "user_channel_#{mention.id}",
                                   mention: true
    end
    ActionCable.server.broadcast "room_channel",
                                 message: render_message(message)
    head :ok
  end

  private

    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message',
                                            locals: { message: message })
    end
end