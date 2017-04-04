class RoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @messages = Message.last(20)
  end
end
