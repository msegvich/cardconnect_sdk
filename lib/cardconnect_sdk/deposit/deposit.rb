require_relative 'request'
require_relative 'response'
require_relative 'ach_deposit'
require_relative 'transaction'

module CardconnectSdk
  module Deposit
    ENDPOINT = 'deposit'

    def deposit_endpoint
      "#{url}#{ENDPOINT}"
    end

    def deposit_transaction(request)
      response = RestClient.get "#{deposit_endpoint}?merchid=#{request.merchid}&date=#{request.date}", default_headers      
      Response.from_json(response.body)
    end
  end
end
