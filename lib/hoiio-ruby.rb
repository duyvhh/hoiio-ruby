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
