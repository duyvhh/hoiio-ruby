module Hoiio
  module IVR
    class Start < HoiioRequest

      def initialize(client)
        super client
      end

      def dial(params={})
        api_post('/ivr/start/dial', params, ["dest"])
      end

    end
  end
end