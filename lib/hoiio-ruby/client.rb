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

  #
  # Hoiio::Client class caches basic authentication parameters
  # After being instantiated, a Hoiio::Client object's data will be shared among
  # all request object, which is subclass of Hoiio::Request
  #
  # #How to instantiated a client object:
  #
  #   @client = Hoiio::Client.new app_id, access_token
  #

  class Client

    # @attr_reader app_id your Hoiio application's app_id. Please keep this securely
    attr_reader :app_id

    # @attr_reader all api request objects
    attr_reader :user, :sms, :fax, :number, :ivr, :voice

    # @attr_accessor access_token used to stored access_token of a user.
    # At any point in time, you can reset the access_token by calling @client.access_token = "new token"
    # and it will be available to all subsequent calls to Hoiio API
    attr_accessor :access_token

    # Create an instance of Hoiio:Client
    # @param app_id application id of your Hoiio application
    # @param access_token access_token of your Hoiio application
    def initialize(app_id, access_token)
      @app_id, @access_token = app_id.strip, access_token.strip
      set_up_resources
    end

    private

    # Set up sub resources to be used to call Hoiio API
    # This method passes the @client object to the initialize block of all API request.
    def set_up_resources
      @user = Hoiio::User.new self
      @sms = Hoiio::SMS.new self
      @voice = Hoiio::Voice.new self
      @fax = Hoiio::Fax.new self
      @number = Hoiio::Number.new self
      @ivr = Hoiio::IVR.new self
    end

  end
end
