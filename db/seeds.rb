Batch.destroy_all

batch_one = Batch.create! number: 1, issuer_slack_user_id: "DKW9E24AG"
batch_two = Batch.create! number: 2, issuer_slack_user_id: "DKYJVFY4X"

shirt_attributes_one = [
  {
    gender: "male",
    size: "l",
    slack_username: "bill",
    slack_user_id: "qwerty"
  },
  {
    gender: "female",
    size: "s",
    slack_username: "sally",
    slack_user_id: "asdfgh"
  }
]

shirt_attributes_two = [
  {
    gender: "male",
    size: "xl",
    slack_username: "bob",
    slack_user_id: "zxcvb"
  }
]

batch_one.shirts.create!(shirt_attributes_one)
batch_two.shirts.create!(shirt_attributes_two)