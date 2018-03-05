module InteractiveMessage
  class Response

    def initialize(payload)
      @payload = payload
      @uri = URI.parse(payload['response_url'])
    end

    def reply(data)
      with_sawyer do |client|
        client.call(:post, @uri.path, data, {
          headers: { 'Content-Type': 'application/json' }
        })
      end
    end

    private

    def with_sawyer
      yield Sawyer::Agent.new("#{@uri.scheme}://#{@uri.host}")
    end
  end
end
