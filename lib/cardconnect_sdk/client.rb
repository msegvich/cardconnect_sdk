require 'base64'
require 'rest_client'

module CardconnectSdk
  class Client

    attr_reader :url, :merchant_id, :username, :password

    def initialize(config={})
      @url, @merchant_id, @username, @password = config.values_at(:url, :merchant_id, :username, :password)
      @auth_token = Base64.strict_encode64("#{@username}:#{@password}")
    end

    def ping
      response = RestClient::Request.new(
        method: :get,
        url: url,
        headers: { 
          authorization: "Basic #{auth_token}",
          accept: 'text/html',
          content_type: 'text/html' 
        }
      ).execute
      
      response.body
    end

    private

    def auth_token
      @auth_token
    end
  end
end