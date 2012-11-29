module Hoiio
  module ResponseUtil

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