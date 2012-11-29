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
  class Fax < Request
    # Manage the Fax API Request
    # Fax API provides developers access to faxing capabilities by using our simple API.
    # Developers can use the Fax API to send, and also to receive fax via Hoiio virtual numbers.
    # Charges for fax is similar to our Voice API - by per minute usage.
    # This should not come as a surprise since fax is delivered over phone lines.
    # Note that Fax is only supported in Singapore

    # Creates a new instance of Fax
    # @param client a shared object used to cache authentication data
    def initialize(client)
      super client
    end

    # Call Send API
    # URL: http://developer.hoiio.com/docs/fax_send.html
    # Send a fax file to a fax number
    # Fax is only supported in Singapore at the moment
    def send(params={})
      api_post '/fax/send', params, [:dest, :file]
    end

    # Call Get History API
    # URL: http://developer.hoiio.com/docs/fax_history.html
    # Retrieve the history of faxes sent by this application, including current ongoing faxes
    def get_history(params={})
      api_post '/fax/get_history', params
    end

    # Call Get Rate API
    # URL: http://developer.hoiio.com/docs/fax_rate.html
    # Retrieves the billable rate that will be charged for fax sent or received via the fax/send API
    # and fax/receive API respectively
    def get_rate(params={})
      api_post '/fax/get_rate', params, [:dest, :incoming], true
    end

    # Call Query Status API
    # URL: http://developer.hoiio.com/docs/fax_status.html
    # Query the current status of a fax made previously via fax/send API
    def query_status(params={})
      api_post '/fax/query_status', params, [:txn_ref]
    end

  end
end
