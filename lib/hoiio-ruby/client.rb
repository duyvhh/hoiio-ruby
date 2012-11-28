module Hoiio
  ##
  # The Hoiio::Client class caches authentication parameters and
  # exposes methods to make HTTP requests to Hoiio's REST API.
  #
  # Instantiate a client like so:
  #
  #   @client = Hoiio::Client.new app_id, access_token
  #

  class Client
    attr_reader :app_id, :user, :sms, :fax, :number, :ivr
    attr_accessor :access_token

    def initialize(app_id, access_token)
      @app_id, @access_token = app_id.strip, access_token.strip
      set_up_resources
    end

    def inspect # :nodoc:
      "<Hoiio::Client @app_id=#{@app_id}>"
    end

    private

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
