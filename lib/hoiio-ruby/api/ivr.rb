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
  class IVR < Request

    # Hoiio's IVR API allows developers to easily create IVR menus like the above using RESTful APIs.
    # This can be achieved without the need for technical telecommunication knowledge.
    # Coupled with our Hoiio Numbers and Text-to-Speech (TTS) technology, you can get started instantly without hassle.

    # @attr_reader 3 blocks of Hoiio IVR
    attr_reader :start, :middle, :end

    # Creates a new instance of Fax
    # @param client a shared object used to cache authentication data
    def initialize(client)
      super client
      @client = client
      set_up
    end

    private

    # Set up the sub resources using shared @client object
    def set_up
      @start = Hoiio::IVRBlock::Start.new @client
      @middle = Hoiio::IVRBlock::Middle.new @client
      @end = Hoiio::IVRBlock::End.new @client
    end

  end
end
