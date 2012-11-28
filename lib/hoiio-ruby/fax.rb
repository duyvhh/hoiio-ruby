module Hoiio
  class Fax < HoiioRequest

    def initialize(client)
      super client
    end

    def send(params={})
      api_post('/fax/send', params, ["dest", "file"])
    end

    def get_history(params={})
      api_post('/fax/get_history', params)
    end

    def get_rate(params={})
      api_post('/fax/get_rate', params, ["dest", "incoming"], true)
    end

    def query_status(params={})
      api_post('/fax/query_status', params, ["txn_ref"])
    end

  end
end
