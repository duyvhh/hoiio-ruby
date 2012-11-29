module Hoiio
  class ServerError < StandardError
  end

  class RequestError < StandardError
    attr_reader :code

    def initialize(message, code=nil)
      super message
      @code = code
    end
  end

  class ResponseError < StandardError
    attr_reader :code

    def initialize(message, code=nil)
      super message
      @code = code
    end
  end

  class InputError < StandardError
    attr_reader :code

    def initialize(message, code=nil)
      super message
      @code = code
    end
  end
end
