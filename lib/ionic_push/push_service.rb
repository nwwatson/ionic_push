module IonicPush
  class PushService
    include HTTParty
    base_uri IonicPush.ionic_api_url

    attr_accessor :device_tokens, :message

    def initialize(message, device_tokens)
      @message = message
      @device_tokens = device_tokens
    end

    def notify!
      self.class.post("/api/v1/push", payload)
    end

    def payload
      options = {}

      body = {
        "tokens": @device_tokens,
        "notification": { alert: @message }
      }.to_json

      options.merge!(body: body).merge!({ basic_auth: auth}).merge!({ headers: headers})
    end

    private

    def auth
      { username: IonicPush.ionic_api_key }
    end

    def headers
      { 'Content-Type' => 'application/json', 'X-Ionic-Application-Id' => IonicPush.ionic_application_id }
    end
  end
end
