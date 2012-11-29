module Hoiio
  class Number < HoiioRequest

    def initialize(client)
      super client
    end

    def get_countries(params={})
      api_post('/number/get_countries', params)
    end

    def get_choices(params={})
      api_post('/number/get_choices', params, ["country", "state"])
    end

    def get_rates(params={})
      api_post('/number/get_rates', params, ["country"])
    end

    def subscribe(params={})
      api_post('/number/subscribe', params, ["number", "duration"])
    end

    def update_forwarding(params={})
      api_post('/number/update_forwarding', params, ["number"])
    end

    def get_active(params={})
      api_post('/number/get_active', params)
    end

  end
end
