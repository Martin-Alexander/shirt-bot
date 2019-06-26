class OpenDialogService
  attr_reader :trigger_id, :payload

  def initialize(payload)
    @payload = payload
    @trigger_id = payload['trigger_id']
  end

  def send
    HTTP
      .headers(accept: 'application/json')
      .auth("Bearer #{ENV['SLACK_API_TOKEN']}")
      .post('https://slack.com/api/dialog.open', json: body)
  end

  private

  def dialog
    {
      callback_id: 'ryde-46e2b0',
      title: 'Choose your t-shirt',
      submit_label: 'Done',
      notify_on_cancel: true,
      state: 'Limo',
      elements: [
        {
          type: 'select',
          label: 'Choose your size',
          name: 'shirt_size',
          options: [
            { 'label': 'Extra Large', 'value': 'XL' },
            { 'label': 'Large', 'value': 'L' },
            { 'label': 'Medium', 'value': 'M' },
            { 'label': 'Small', 'value': 'S' },
            { 'label': 'Extra Small', 'value': 'XS' }
          ]
        },
        {
          type: 'select',
          label: 'Choose your fit',
          name: 'shirt_fit',
          options: [
            { 'label': 'Mens', 'value': 'mens' },
            { 'label': 'Womens', 'value': 'womens' }
          ]
        }
      ]
    }
  end

  def body
    { dialog: dialog, trigger_id: trigger_id }
  end
end
