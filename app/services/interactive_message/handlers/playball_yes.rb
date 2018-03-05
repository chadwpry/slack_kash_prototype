module InteractiveMessage
  module Handlers
    class PlayballYes
      def can_call?(data)
        data['callback_id'] === 'Playball' &&
          data['actions'].first['value'] === 'yes'
      end

      def call(data)
        InteractivePlayballYesJob.perform_later data
      end
    end
  end
end
