module Hoiio
  module IVRBlock
    class End < Request

      def initialize(client)
        super client
      end

      def transfer(params={})
        api_post '/ivr/end/transfer', params, ["session", "dest"]
      end

      def hangup(params={})
        api_post '/ivr/end/hangup', params, ["session"]
      end

    end
  end
end