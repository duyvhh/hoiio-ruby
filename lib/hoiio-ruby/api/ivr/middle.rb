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
    class Middle < Request

      # Manage the End block of Hoiio IVR Blocks
      # See here for details: http://developer.hoiio.com/docs/ivr.html

      # Creates a new instance of Middle IVR Block.
      # @param client a shared object used to cache authentication data
      def initialize(client)
        super client
      end

      # Call the Play API
      # URL: http://developer.hoiio.com/docs/ivr_play.html
      # You can use the Play block if you want to play a voice message. Our Text-to-Speech service will
      # automatically generate the voice recording for the message you indicated in your API request.
      # The Play block will first play the message then send a notification to your notify_url.
      # You cannot use this block after you have used any of the End blocks (Transfer, Hangup).
      def play(params={})
        api_post '/ivr/middle/play', params, [:session]
      end

      # Call the Gather API
      # URL: http://developer.hoiio.com/docs/ivr_gather.html
      # Get user input via the telephone's keypad in IVR calls
      def gather(params={})
        api_post '/ivr/middle/gather', params, [:session, :notify_url]
      end

      # Call the Record API
      # URL: http://developer.hoiio.com/docs/ivr_record.html
      # Record voice messages from the user over the phone
      def record(params={})
        api_post '/ivr/middle/record', params, [:session, :notify_url]
      end

      # Call the Monitor API
      # URL: http://developer.hoiio.com/docs/ivr_monitor.html
      # Record the call conversation, including any voice messages
      def monitor(params={})
        api_post '/ivr/middle/monitor', params, [:session, :notify_url]
      end

      # Call the Hold API
      # URL: http://developer.hoiio.com/docs/ivr_hold.html
      # Puts an IVR session on hold and continuously plays the given message on a loop
      def hold(params={})
        api_post '/ivr/middle/hold', params, [:session]
      end

      # Call the Unhold API
      # URL: http://developer.hoiio.com/docs/ivr_unhold.html
      # Resumes an IVR session that was put on hold with the Hold block
      def unhold(params={})
        api_post '/ivr/middle/unhold', params, [:session, :notify_url]
      end

    end
  end
end