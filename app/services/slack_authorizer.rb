class SlackAuthorizer

  def self.with_grant(client_id:, client_secret:, code:, state:, redirect_uri: redirect_uri)
    with_slack_sawyer do |client|
      yield client.call(:get, '/api/oauth.access', {
        headers: {'ContentType': 'application/x-www-form-urlencoded'},
        query: {
          client_id: client_id,
          client_secret: client_secret,
          code: code,
          redirect_uri: redirect_uri,
          state: state
        }
      }).data
    end
  end

  private

  def self.with_slack_sawyer
    yield Sawyer::Agent.new('https://slack.com')
  end
end
