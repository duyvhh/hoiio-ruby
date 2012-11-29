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
      @start = Hoiio::IVRBlock::Start.new(@client)
      @middle = Hoiio::IVRBlock::Middle.new(@client)
      @end = Hoiio::IVRBlock::End.new(@client)
    end

  end
end
