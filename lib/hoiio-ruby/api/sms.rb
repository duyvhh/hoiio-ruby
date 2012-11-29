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
  class SMS < Request
    # Manage SMS API Request
    # SMS is one of the most popular forms of mobile communications. Chatting between friends,
    # 2-factor authentication by your bank's online portal, receiving alerts from your stock market applications
    # and SMS marketing are just some of the more popular uses of SMS.
    #
    # The SMS API component of Hoiio API allows developers to send/receive SMS to/from more than 200 countries
    # around the world at a very competitive rate.

    # Creates a new instance of SMS
    # @param client a shared object used to cache authentication data
    def initialize(client)
      super client
    end

    # Call Send API
    # URL: http://developer.hoiio.com/docs/sms_send.html
    # Send SMS to mobile numbers in over 200 countries
    def send(params={}, bulk_send = false)
      if bulk_send
        api_post '/sms/bulk_send', params, [:dest, :msg]
      else
        api_post '/sms/send', params, [:dest, :msg]
      end
    end

    # Call Bulk_Send API
    # URL: http://developer.hoiio.com/docs/sms_bulk_send.html
    # Send SMS in bulk (up to 1000 messages) to any mobile numbers in more than 200 countries
    def bulk_send(params={})
      self.send params, true
    end

    # Call Get History API
    # URL: http://developer.hoiio.com/docs/sms_history.html
    # Retrieve the history of SMS sent or received by this application.
    def get_history(params={})
      api_post '/sms/get_history', params
    end

    # Call Get Rate API
    # URL: http://developer.hoiio.com/docs/sms_rate.html
    # Retrieve the billable rate that will be charged for each multipart SMS message made or
    # receive via the sms/send API and sms/receive API respectively.
    def get_rate(params={})
      api_post '/sms/get_rate', params, [:dest, :incoming], true
    end

    # Call Query Status API
    # URL: http://developer.hoiio.com/docs/sms_status.html
    # Query the current status of a SMS sent previously via sms/send API.
    def query_status(params={})
      api_post '/sms/query_status', params, [:txn_ref]
    end

  end
end
