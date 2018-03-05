module InteractiveMessage
  module Handlers
    extend ActiveSupport::Autoload

    autoload :PlayballYes
    autoload :PlayballNo
    autoload :RequestApproval
  end
end
