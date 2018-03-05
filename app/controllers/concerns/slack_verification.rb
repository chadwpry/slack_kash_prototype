require 'active_support/concern'

module SlackVerification
  extend ActiveSupport::Concern

  VERIFICATION_TOKENS = ENV['SLACK_VERIFICATION_TOKENS'].split(',').freeze

  def verify_token
    head 404 unless VERIFICATION_TOKENS.include? params[:token]
  end

  included do
    before_action :verify_token
  end
end
