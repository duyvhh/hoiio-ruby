$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'hoiio-ruby'
require 'fakeweb'
require 'json'

FakeWeb.allow_net_connect = false

APP_ID='test'
ACCESS_TOKEN='test'
TEST_PHONE='+6591234567'
SUCCESS = "success_ok"
CLIENT = Hoiio::Client.new APP_ID, ACCESS_TOKEN


def check_status(response)
  response['status'].should == SUCCESS
end

def check_txn_ref(response)
  response['txn_ref'].should_not be_nil
end

def construct_fakeweb_uri(path)
  @base_uri = "https://secure.hoiio.com/open"
  @base_uri << path
end
