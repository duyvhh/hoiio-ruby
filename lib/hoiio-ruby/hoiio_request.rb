module Hoiio
  class HoiioRequest
    include HTTParty
    base_uri "https://secure.hoiio.com/open"

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
          return response
        else
          raise Hoiio::ServerError
      end
    end


    private

    def filter_status (response)
      if response['status'].nil?
        raise Hoiio::ServerError
      elsif STATUS_SUCCESS != response['status']
        raise Hoiio::RequestError.new response['status'], response['status']
      end
    end

    def check_nil_or_empty(required_param_names=[], params)
      required_param_names.each {|p|
        if params[p].nil? || params[p].empty?
          raise Hoiio::InputError.new "Param " << p << " is missing"
        end
      }
    end

    def check_for_mutual_exclusivity(required_param_names=[], params)
      i = 0
      required_param_names.each {|p|
        if !params[p].nil? && !params[p].empty?
          i += 1
        end
      }

      if i == 0
        raise Hoiio::InputError.new "All required params are missing"
      elsif i > 1
        raise Hoiio::InputError.new "More than 1 required, mutually exclusive param are present."
      end
    end

  end

end
