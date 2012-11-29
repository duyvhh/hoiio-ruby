module Hoiio
  module IVRBlock
    class Start < Request

      def initialize(client)
        super client
      end

      def dial(params={})
        api_post '/ivr/start/dial', params, ["dest"]
      end

    end
  end
end