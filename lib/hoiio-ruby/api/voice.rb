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
  class Voice < Request
    # Manage Voice API Request
    # The Voice API component of Hoiio API provides developers access to telephony services in
    # more than 200 countries around the world. You will be able to initiate phone calls to any mobile phones,
    # land lines or create call conferences just by making an API request to our servers.
    # You can connect 2 phones using the Call API, or connect multiple phones using the Conference API.

    # Creates a new instance of Voice
    # @param client a shared object used to cache authentication data
    def initialize(client)
      super client
    end

    # Call Voice/Call API
    # URL: http://developer.hoiio.com/docs/voice_call.html
    # Dial out to 2 destination number and connect them together in a phone conversation
    def call(params={})
      api_post '/voice/call', params, [:dest2]
    end

    # Call Conference API
    # URL: http://developer.hoiio.com/docs/voice_conference.html
    # Call a list of destination numbers and place them in a conference call
    def conference(params={})
      api_post '/voice/conference', params, [:dest]
    end

    # Call Hangup API
    # URL: http://developer.hoiio.com/docs/voice_hangup.html
    # Hangup a call that is currently in progress.
    # You can call this API at any point in time when a call is in progress to hang up the call.
    def hangup(params={})
      api_post '/voice/hangup', params, [:txn_ref]
    end

    # Call Get History API
    # URL: http://developer.hoiio.com/docs/voice_callhistory.html
    # Retrieve the history of calls, including current ongoing calls.
    def get_history(params={})
      api_post '/voice/get_history', params
    end

    # Call Get Rate API
    # URL: http://developer.hoiio.com/docs/voice_rate.html
    # Retrieve the billable rate that will be charged for calls made via the voice/call API.
    def get_rate(params={})
      api_post '/voice/get_rate', params, [:dest1, :dest2]
    end

    # Call Query Status API
    # URL: http://developer.hoiio.com/docs/voice_status.html
    # Query the current status of a call.
    def query_status(params={})
      api_post '/voice/query_status', params, [:txn_ref]
    end

  end
end
