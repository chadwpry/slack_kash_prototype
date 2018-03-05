module InteractiveMessage
  module Handlers
    class RequestApprovalYes
      def can_call?(data)
        data['callback_id'] === 'RequestApproval' &&
          data['actions'].first['value'] === 'yes'
      end

      def call(data)
        RequestApprovalJobYes.perform_later data
      end
    end
  end
end
