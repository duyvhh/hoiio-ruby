module Hoiio
  class Voice < Request

    def initialize(client)
      super client
    end

    def call(params={})
      api_post '/voice/call', params, ["dest2"]
    end

    def conference(params={})
      api_post '/voice/conference', params, ["dest"]
    end

    def hangup(params={})
      api_post '/voice/hangup', params, ["txn_ref"]
    end

    def get_history(params={})
      api_post '/voice/get_history', params
    end

    def get_rate(params={})
      api_post '/voice/get_rate', params, ["dest1", "dest2"]
    end

    def query_status(params={})
      api_post '/voice/query_status', params, ["txn_ref"]
    end

  end
end
