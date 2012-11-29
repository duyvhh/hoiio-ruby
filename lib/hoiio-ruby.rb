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

require 'httparty'
require 'json'
require 'cgi'

require 'hoiio-ruby/version/version' unless defined?(Hoiio::VERSION)
require 'hoiio-ruby/errors'
require 'hoiio-ruby/util/request_util'
require 'hoiio-ruby/util/response_util'
require 'hoiio-ruby/request'
require 'hoiio-ruby/client'
require 'hoiio-ruby/api/user'
require 'hoiio-ruby/api/sms'
require 'hoiio-ruby/api/voice'
require 'hoiio-ruby/api/fax'
require 'hoiio-ruby/api/ivr'
require 'hoiio-ruby/api/ivr/start'
require 'hoiio-ruby/api/ivr/middle'
require 'hoiio-ruby/api/ivr/end'
require 'hoiio-ruby/api/number'

STATUS_SUCCESS = "success_ok"
