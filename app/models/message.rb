class Message < ApplicationRecord
  after_create {MessageBroadcastJob.perform_now(self)}
end
