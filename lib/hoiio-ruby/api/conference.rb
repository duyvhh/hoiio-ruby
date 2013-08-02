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
  class Conference < Request
    # The Conference API component of Hoiio API provides developers access to telephony services in
    # more than 200 countries around the world. You will be able to initiate call conferences
    # just by making an API request to our servers.

    # Creates a new instance of Conference
    # @param client a shared object used to cache authentication data
    def initialize(client)
      super client
    end

    # Conference Call API
    # URL: http://developer.hoiio.com/docs/conference_call.html
    # Call a list of destination numbers and place them in a conference call.
    def call(params={})
      api_post 'conference/call', params, [:dest]
    end

    # Conference Moderate API
    # URL: http://developer.hoiio.com/docs/conference_moderate.html
    # Allows you to moderate a conference that is currently in progress.
    # Available actions include: "kick", "mute", and "unmute"
    def moderate(params={})
      api_post 'conference/moderate', params, [:txn_ref, :action]
    end

  end
end