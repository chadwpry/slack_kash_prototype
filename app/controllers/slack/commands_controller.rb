module Slack
  class CommandsController < ApplicationController
    include SlackVerification

    def kuestion
      CommandKuestionJob.perform_later params.as_json
      head 200
    end
  end
end
