class PushSizerToStudentJob < ApplicationJob
  queue_as :default

  def perform(uuid, batch_id)
    Shirt.create(batch_id: batch_id, slack_user_id: uuid)
    # TODO: send survey to student
  end
end