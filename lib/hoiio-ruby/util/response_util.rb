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
  module ResponseUtil

    # Process response returned by Hoiio API
    # @param response response of Hoiio API
    # @return response parsed as a Hash
    #
    # @raise ServerError if status is not present
    # @raise ResponseError if status is not success_ok
    def process_response(response)
      response = create_hash response
      if response['status'].nil?
        raise Hoiio::ServerError
      elsif STATUS_SUCCESS != response['status']
        raise Hoiio::ResponseError.new response['status'], response['status']
      end
      response
    end

    private

    # Create a Hash from a JSON response
    # @param response response of Hoiio API
    # @return response parsed as a Hash
    def create_hash(response)
      begin
        JSON.parse response
      rescue JSON::ParserError
        response
      rescue StandardError
        response
      end
    end

  end
end