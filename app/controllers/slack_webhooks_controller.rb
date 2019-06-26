class SlackWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    command = params[:command]
    if command&.match?(/sizer/)
      channel = params[:text]
      user_slack_uuid = params[:user_id]
      PushSizerToStudentsJob.perform_later(channel, user_slack_uuid)
      answer = {
        "text": "Sizer has been sent to ##{channel}",
        "attachments": [
          {
            "text": "You can have a break ."
          }
        ]
      }
    end
    render json: answer
  end
end
