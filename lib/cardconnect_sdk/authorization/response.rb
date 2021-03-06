module CardconnectSdk
  module Authorization
    class Response
      include Attributable
      include Helpers::Response

      attr_reader :respstat, :account, :token, :retref, :amount, :merchid, :commcard,
                  :respcode, :resptext, :avsresp, :cvvresp, :authcode, :respproc,
                  :batchid

      def settled?
        false
      end
    end
  end
end
