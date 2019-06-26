class PersistDialogDataService
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def save
    shirt = Shirt.find_by(slack_user_id: user_uid)
    return unless shirt

    shirt.update(gender: shirt_fit, size: size, slack_username: slack_username)
  end

  private

  def user_uid
    payload.dig('user', 'id')
  end

  def shirt_fit
    payload.dig('submission', 'shirt_fit').chomp('s').capitalize
  end

  def size
    payload.dig('submission', 'shirt_size')
  end

  def slack_username
    payload.dig('user', 'name')
  end
end
