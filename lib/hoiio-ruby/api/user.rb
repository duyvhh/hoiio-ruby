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
  class User < Request
    # Manage User API Request
    # The User API will allow developers to check their credit balances and other account information.

    # Creates a new instance of User
    # @param client a shared object used to cache authentication data
    def initialize(client)
      super client
    end

    # Call Get Balance API
    # URL: http://developer.hoiio.com/docs/account_credit.html
    # Retrieve the current credit balance of an account.
    def get_balance
      api_post '/user/get_balance'
    end

    # Call Get Info API
    # URL: http://developer.hoiio.com/docs/account_info.html
    # Retrieve the general information of your account.
    def get_info
      api_post '/user/get_info'
    end

  end
end
