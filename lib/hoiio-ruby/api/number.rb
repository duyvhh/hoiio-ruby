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
  class Number < Request
    # Manage Number API Request
    # Hoiio provides dedicated virtual phone numbers to developers for your IVR applications.
    # This service enables your IVR application to receive incoming calls and allows you to create customer hotlines,
    # call filtering services etc using our IVR API.
    #
    # The Number API will allow developers to have full control over how they assign their Hoiio Numbers to their IVR applications.

    # Creates a new instance of Number
    # @param client a shared object used to cache authentication data
    def initialize(client)
      super client
    end

    # Call Get Countries API
    # URL: http://developer.hoiio.com/docs/number_countries.html
    # Return a list of countries for which there are Hoiio Numbers available for subscription.
    def get_countries(params={})
      api_post '/number/get_countries', params
    end

    # Call Get Choices API
    # URL: http://developer.hoiio.com/docs/number_select.html
    # Return a list of available Hoiio Numbers for subscription in a given country.
    def get_choices(params={})
      api_post '/number/get_choices', params, [:country]
    end

    # Call Get Rates API
    # URL: http://developer.hoiio.com/docs/number_rates.html
    # Retrieve the billable rate that will be charged for subscribing to a Hoiio Number via the number/subscribe API.
    def get_rates(params={})
      api_post '/number/get_rates', params, [:country]
    end

    # Call Subscribe API
    # URL: http://developer.hoiio.com/docs/number_subscribe.html
    # Subscribe for a new Hoiio Number or extend an existing subscription of a Hoiio Number.
    # Hoiio Numbers can be used in IVR apps to receive incoming calls from your users.
    def subscribe(params={})
      api_post '/number/subscribe', params, [:number, :duration]
    end

    # Call Update Forwarding API
    # URL: http://developer.hoiio.com/docs/number_configure.html
    # Configure the URL that the incoming call notification and incoming SMS notification
    # for your Hoiio Number will be sent to.
    def update_forwarding(params={})
      api_post '/number/update_forwarding', params, [:number]
    end

    # Call Get Active API
    # URL: http://developer.hoiio.com/docs/number_status.html
    # Retrieve the list of Hoiio Numbers that is assigned to your application and their current configuration
    def get_active(params={})
      api_post '/number/get_active', params
    end

  end
end
