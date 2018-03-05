module Slack
  class InteractiveController < ApplicationController

    def create
      InteractiveMessage::Parser.new
        .handler(JSON.parse(params[:payload]))
        .call(params[:payload])

      head 200
    end
  end
end
