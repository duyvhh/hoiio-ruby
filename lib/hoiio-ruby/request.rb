module Hoiio
  class HoiioRequest

    include HTTParty
    base_uri "https://secure.hoiio.com/open"

    include RequestUtil
    include ResponseUtil

    STATUS_SUCCESS = "success_ok"

    def initialize(client)
      @client = client
    end

    def api_post(path, params={}, required_param_names=[], mutually_exclusive=false)

      if mutually_exclusive
        check_for_mutual_exclusivity(required_param_names, params)
      elsif !required_param_names.nil? && !required_param_names.empty?
        check_nil_or_empty(required_param_names, params)
      end

      options = Hash.new()
      options[:body] = params

      options.merge!({:body => {:app_id => @client.app_id, :access_token => @client.access_token}}){
        |key, oldval, newval| oldval.merge!(newval)
      }

      response = self.class.post(path, options)
      case response.code
        when 200
          filter_status response
          response
        else
          raise Hoiio::ServerError
      end
    end

  end

end
