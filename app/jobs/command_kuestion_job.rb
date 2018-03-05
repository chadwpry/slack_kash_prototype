class CommandKuestionJob < ApplicationJob
  queue_as :default

  def perform(payload)
    InteractiveMessage::Response.new(payload).reply post_json(payload)
  end

  private

  def post_json(payload)
    {
      "text": "Do you want to play ball first?",
      "attachments": [
        {
          "text": "Only two options",
          "fallback": "You are unable to play ball",
          "callback_id": "Playball",
          "color": "#3AA3E3",
          "attachment_type": "default",
          "actions": [
            {
              "name": "answer",
              "text": "Yes",
              "type": "button",
              "value": "yes"
            },
            {
              "name": "answer",
              "text": "No",
              "type": "button",
              "value": "no"
            }
          ]
        }
      ]
    }
  end
end
