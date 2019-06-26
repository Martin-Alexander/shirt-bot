class SendMessageService
  attr_reader :user_uid

  def initialize(user_uid)
    @user_uid = user_uid
  end

  def send
    SlackClient.chat_postMessage(
      channel: user_uid,
      text: 'Do you want a Le Wagon t-shirt',
      response_type: 'ephemeral',
      attachments: [
        {
          text: 'We need to get some information first',
          fallback: 'You are unable to choose a game',
          callback_id: 'wopr_game',
          color: '#3AA3E3',
          attachment_type: 'default',
          actions: [
            {
              name: 'sizer',
              text: 'Choose my t-shirt',
              type: 'button',
              value: 'choose'
            }
          ]
        }
      ]
    )
  end
end
