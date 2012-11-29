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
  module IVRBlock
    class End < Request

      # Manage the End block of Hoiio IVR Blocks
      # See here for details: http://developer.hoiio.com/docs/ivr.html

      # Creates a new instance of End IVR Block.
      # @param client a shared object used to cache authentication data
      def initialize(client)
        super client
      end

      # Call the Transfer API
      # URL: http://developer.hoiio.com/docs/ivr_transfer.html
      # Transfer a call to another destination number anywhere in the world or a voice conference room                                                                                                                                                                                                                                                                                                                               The Transfer block will first play the message then transfer the call. If the transfer failed, you can follow up with one of the Middle or End blocks. If the transfer succeeds, you will get a notification after the transferred call has ended.
      def transfer(params={})
        api_post '/ivr/end/transfer', params, [:session, :dest]
      end

      # Call the Hangup API
      # URL: http://developer.hoiio.com/docs/ivr_hangup.html
      # To hang up the current call, you can use the Hangup block. Upon receiving this action, the current call will be hang up.
      # The Hangup block will first play the message, hang up the call then send a notification to your notify_url.
      # You cannot use any other block after using the Hangup block.
      def hangup(params={})
        api_post '/ivr/end/hangup', params, [:session]
      end

    end
  end
end