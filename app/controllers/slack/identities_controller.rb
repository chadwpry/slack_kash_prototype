module Slack
  class IdentitiesController < ApplicationController

    # POST /identities
    def create
      SlackAuthorizer.with_grant(
        code: create_params['code'],
        state: create_params['state'],
        client_id: ENV['SLACK_CLIENT_ID'],
        client_secret: ENV['SLACK_CLIENT_SECRET']
      ) do |token_grant|
        identity = Identity.new({
          team_id: token_grant[:team_id],
          provider: 'SLACK',
          scope: token_grant[:scope],
          access_token: token_grant[:access_token],
          data: token_grant.to_h
        })

        if identity.save
          head 201
        else
          render json: identity.errors, status: :unprocessable_entity
        end
      end
    end

    private

    def create_params
      params.permit('code', 'state')
    end
  end
end
