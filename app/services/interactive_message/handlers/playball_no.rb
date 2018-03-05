module InteractiveMessage
  module Handlers
    class PlayballNo
      def can_call?(data)
        data['callback_id'] === 'Playball' &&
          data['actions'].first['value'] === 'no'
      end

      def call(data)
        InteractivePlayballNoJob.perform_later data
      end
    end
  end
end
