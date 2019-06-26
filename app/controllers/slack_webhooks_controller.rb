class SlackWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    command = params[:command]
    if command&.match?(/sizer/)
      channel = params[:text]
      user_slack_uuid = params[:user_id]
      PushSizerToStudentsJob.perform_later(channel, user_slack_uuid)
      render json: { status: :ok }
    end
    if params[:payload]
      payload = JSON.parse(params[:payload])
      OpenDialogService.new(payload).send if payload['type'] == 'interactive_message'
      if payload['type'] == 'dialog_submission'
        PersistDialogDataService.new(payload).save
      end
    end
  end
end
