module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      @current_user = find_verified_user
    end

    protected
      def find_verified_user
        if current_user = User.find_by(id: cookies[:current_user_id])
          current_user
        else
          reject_unauthorized_connection
        end
      end
  end

  class Channel < ActionCable::Channel::Base
  end
end
