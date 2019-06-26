class SlackWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    # command = params[:command]
    # if command.match? /sizer/
    #   # TODO fetch members from channel
    #   # TODO send private message to each member
    # end
    if params[:payload]
      payload = JSON.parse(params[:payload])
      OpenDialogService.new(payload).send if payload[:type] == 'dialog_submission'
    end
  end
end
