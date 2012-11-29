module Hoiio
  class SMS < Request

    def initialize(client)
      super client
    end

    def send(params={}, bulk_send = false)
      if bulk_send
        api_post '/sms/bulk_send', params, ["dest", "msg"]
      else
        api_post '/sms/send', params, ["dest", "msg"]
      end
    end

    def bulk_send(params={})
      self.send params, true
    end

    def get_history(params={})
      api_post '/sms/get_history', params
    end

    def get_rate(params={})
      api_post '/sms/get_rate', params, ["dest", "incoming"], true
    end

    def query_status(params={})
      api_post '/sms/query_status', params, ["txn_ref"]
    end

  end
end
