class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.new(content: data['message'], user_id: data['user_id'])
    if message.save
      MessageBroadcastJob.perform_now(message, current_user)
    end
  end
end
