class PushSizerToStudentsJob < ApplicationJob
  queue_as :default

  def perform(channel, user_slack_uuid)
    batch_number = channel.match(/\d+/)[0]
    batch = Batch.create(number: batch_number, issuer_slack_user_id: user_slack_uuid)
    members = SlackClient.channels_info(channel: "##{channel}")['channel']['members']
    members.each do |member_uuid|
      PushSizerToStudentJob.perform_later(member_uuid, batch.id)
    end
  end
end
