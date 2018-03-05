module InteractiveMessage
  class Parser
    INTERACTIVE_MESSAGE = 'interactive_message'

    REGISTERED_HANDLERS = [
      InteractiveMessage::Handlers::PlayballYes.new,
      InteractiveMessage::Handlers::PlayballNo.new
    ]

    def initialize(handlers = REGISTERED_HANDLERS)
      @handlers = handlers
    end

    def handler(data)
      if data['type'] === INTERACTIVE_MESSAGE
        @handlers.find do |handler|
          handler.can_call? data
        end
      end
    end
  end
end

