class SlackWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    command = params[:command]
    if command.match? /sizer/
      # TODO fetch members from channel
      # TODO send private message to each member
    end
  end
end
