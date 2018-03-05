class InteractivePlayballNoJob < ApplicationJob
  queue_as :default

  RANDOM_PHRASES = [
    'Not sure I heard you correctly, can you tell me again',
    'Oh come onnnnn... please?',
    'You are really going to like it!',
    'I am telling you, this game is fun. Want to try again?'
  ]

  def perform(payload)
    InteractiveMessage::Response
      .new(JSON.parse(payload))
      .reply({
        "text": RANDOM_PHRASES.sample,
        "attachments": [
          {
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
      })
  end
end
