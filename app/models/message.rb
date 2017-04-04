class Message < ApplicationRecord
  belongs_to :user
  after_create {MessageBroadcastJob.perform_now(self)}
end
