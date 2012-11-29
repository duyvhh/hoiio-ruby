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

FAX_SEND_RESPONSE = {:status => SUCCESS, :txn_ref => "test-1"}
FAX_GET_HISTORY_RESPONSE = {:status => SUCCESS, :entries_count => "1"}
FAX_GET_RATE_RESPONSE = {:status => SUCCESS, :rate => "0.03", :currency => "SGD"}
FAX_QUERY_STATUS_RESPONSE = {:status => SUCCESS, :fax_status => "answered", :currency => "USD"}

FakeWeb.register_uri :post, construct_fakeweb_uri("/fax/send"), :body => FAX_SEND_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/fax/get_history"), :body => FAX_GET_HISTORY_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/fax/get_rate"), :body => FAX_GET_RATE_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/fax/query_status"), :body => FAX_QUERY_STATUS_RESPONSE.to_json


describe Hoiio::Fax do

  it 'should send a fax and return txn ref' do
    response = CLIENT.fax.send({:dest => TEST_PHONE, :file => "test"})
    check_status response
    check_txn_ref response
  end

  it 'should return history' do
    response = CLIENT.fax.get_history
    check_status response
    response['entries_count'].should == "1"
  end

  it 'should return fax rate' do
    response = CLIENT.fax.get_rate({:dest => "+1231231"})
    check_status response
    response["currency"].should == "SGD"
    response["rate"].should == "0.03"
  end

  it 'should query fax status' do
    response = CLIENT.fax.query_status({:txn_ref => "test"})
    check_status response
    response["currency"].should == "USD"
    response["fax_status"].should == "answered"
  end

end