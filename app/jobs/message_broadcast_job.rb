class MessageBroadcastJob < ApplicationJob
  queue_as :urgent

  def perform(message, current_user)
    ActionCable.server.broadcast('room_channel', message: render_message(message, current_user))
  end

  private
  def render_message(message, current_user)
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message, current_user: current_user})
  end
end
