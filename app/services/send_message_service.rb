class SendMessageService
  attr_reader :channel_id

  def initialize(user_uid)
    @user_uid = user_uid
    fetch_im_channel
  end

  def send
    SlackClient.chat_postMessage(
      channel: 'CKQKXGHR7',
      text: 'Do you want a Le Wagon t-shirt',
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

  def fetch_im_channel

  end
end
