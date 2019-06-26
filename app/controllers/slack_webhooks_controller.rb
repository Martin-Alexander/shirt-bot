class SlackWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    command = params[:command]
    if command.match?(/sizer/)
      channel = params[:text]
      user_slack_uuid = params[:user_id]
      PushSizerToStudentsJob.perform_later(channel, user_slack_uuid)
    end
    render json: { status: :ok }
  end
end
