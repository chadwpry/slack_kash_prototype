class InteractivePlayballYesJob < ApplicationJob
  queue_as :default

  def perform(payload)
    InteractiveMessage::Response
      .new(JSON.parse(payload))
      .reply({
        text: 'Yay, ball is the best!'
      })
  end
end
