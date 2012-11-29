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
    class Start < Request

      # Manage the Start block of Hoiio IVR Blocks
      # See here for details: http://developer.hoiio.com/docs/ivr.html

      # Creates a new instance of Start IVR Block.
      # @param client a shared object used to cache authentication data
      def initialize(client)
        super client
      end

      # Call the Gather API
      # URL: http://developer.hoiio.com/docs/ivr_dial.html
      # Make a dial-out to a destination number
      def dial(params={})
        api_post '/ivr/start/dial', params, [:dest]
      end

    end
  end
end