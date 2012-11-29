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

require 'spec_helper'

USER_GET_BALANCE_RESPONSE = {:status => SUCCESS, :balance => "10.03", :currency => "SGD"}
USER_GET_INFO_RESPONSE = {:status => SUCCESS, :uid => "AA-1", :name => "Steve", :country => "SG"}

FakeWeb.register_uri :post, construct_fakeweb_uri("/user/get_balance"), :body => USER_GET_BALANCE_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/user/get_info"), :body => USER_GET_INFO_RESPONSE.to_json


describe Hoiio::User do

  it 'should retrieve user balance' do
    response = CLIENT.user.get_balance
    check_status response
    response["currency"].should == "SGD"
    response["balance"].should == "10.03"
  end

  it 'should retrieve user basic info' do
    response = CLIENT.user.get_info
    check_status response
    response["uid"].should == "AA-1"
    response["name"].should == "Steve"
    response["country"].should == "SG"
  end

end