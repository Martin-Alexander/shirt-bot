class PushSizerToStudentJob < ApplicationJob
  queue_as :default

  def perform(uuid, batch_id)
    shirt = Shirt.create(batch_id: batch_id, slack_user_id: uuid)
    SendMessageService.new(uuid).send
  end
end
