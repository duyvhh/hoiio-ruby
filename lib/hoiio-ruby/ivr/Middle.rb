module Hoiio
  module IVR
    class Middle < HoiioRequest

      def initialize(client)
        super client
      end

      def play(params={})
        api_post('/ivr/middle/play', params, ["session"])
      end

      def gather(params={})
        api_post('/ivr/middle/gather', params, ["session", "notify_url"])
      end

      def record(params={})
        api_post('/ivr/middle/record', params, ["session", "notify_url"])
      end

      def monitor(params={})
        api_post('/ivr/middle/monitor', params, ["session", "notify_url"])
      end

    end
  end
end