#Copyright (C) 2012 Hoiio Pte Ltd (http://www.hoiio.com)
#
#Permission is hereby granted, free of charge, to any person
#obtaining a copy of this software and associated documentation
#files (the "Software"), to deal in the Software without
#restriction, including without limitation the rights to use,
#                                                        copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the
#Software is furnished to do so, subject to the following
#conditions:
#
#The above copyright notice and this permission notice shall be
#included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
#OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
#HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
#OTHER DEALINGS IN THE SOFTWARE.

module Hoiio
  class Request

    # A wrapper class to all API request object
    # This class uses HTTParty to initiate requests to Hoiio API
    # and process the response before passing to its subclass

    # HTTParty is used to fire requests
    include HTTParty
    base_uri "https://secure.hoiio.com/open"

    include RequestUtil
    include ResponseUtil

    # Create an instance of Request object using Hoiio::Client object
    # Inside @client object, app_id and access_token are stored to make API request
    def initialize(client)
      @client = client
    end

    # Send a request to Hoiio API
    # @param path path of the request
    # @param params all params (required and optional) to pass along the request
    # @param required_param_names array of names of all the required params that need to be passed along the request
    # @param mutually_exclusive mark whether to check for mutual exclusivity of required params
    # (meaning only 1 required param can be present)
    #
    # @return response from Hoiio API after being processed
    # @raise ServerError if response's HTTP status is not 200 OK.
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

      response = self.class.post path, options
      case response.code
        when 200
          process_response response
        else
          raise Hoiio::ServerError
      end
    end

  end

end
