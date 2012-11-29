module Hoiio
  class User < Request

    def initialize(client)
      super client
    end

    def get_balance
      api_post '/user/get_balance'
    end

    def get_info
      api_post '/user/get_info'
    end

  end
end
