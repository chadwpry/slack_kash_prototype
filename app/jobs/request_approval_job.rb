class RequestApprovalJob < ApplicationJob
  queue_as :default

  def perform(payload)
    # Do something later
  end
end
