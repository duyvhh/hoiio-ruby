module Hoiio
  class IVR < HoiioRequest

    attr_reader :start, :middle, :end

    def initialize(client)
      super client
      @client = client
      set_up
    end

    private

    def set_up
      @start = Hoiio::IVR::Start.new(@client)
      @middle = Hoiio::IVR::Middle.new(@client)
      @end = Hoiio::IVR::End.new(@client)
    end

  end
end
