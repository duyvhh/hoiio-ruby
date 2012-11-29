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

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'hoiio-ruby'
require 'fakeweb'
require 'json'

FakeWeb.allow_net_connect = false

APP_ID='test'
ACCESS_TOKEN='test'
TEST_PHONE='+6511233123'
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
