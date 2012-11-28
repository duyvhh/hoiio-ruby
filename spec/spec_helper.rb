$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'hoiio-ruby'
require 'fakeweb'

#FakeWeb.allow_net_connect = false
#FakeWeb.register_uri(:post, "http://secure.hoii", :body => "Hello World!")

APP_ID=''
ACCESS_TOKEN=''
TEST_PHONE=''
CLIENT = Hoiio::Client.new APP_ID, ACCESS_TOKEN