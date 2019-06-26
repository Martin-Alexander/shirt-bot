class SlackWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    command = params[:command]
    if command&.match?(/sizer/)
      channel = params[:text]
      user_slack_uuid = params[:user_id]
      PushSizerToStudentsJob.perform_later(channel, user_slack_uuid)
    end
    if params[:payload]
      payload = JSON.parse(params[:payload])
      OpenDialogService.new(payload).send if payload[:type] == 'dialog_submission'
    end
    # TODO: SAVE INFORMATION FROM DIALOG (BEN)
    render json: { status: :ok }
  end
end
