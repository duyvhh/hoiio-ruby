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

SMS_SEND_RESPONSE = {:status => SUCCESS, :txn_ref => "test-1"}
SMS_BULK_SEND_RESPONSE = {:status => SUCCESS, :bulk_txn_ref => "test-2"}
SMS_GET_HISTORY_RESPONSE = {:status => SUCCESS, :entries_count => "1"}
SMS_GET_RATE_RESPONSE = {:status => SUCCESS, :rate => "0.03", :currency => "SGD"}
SMS_QUERY_STATUS_RESPONSE = {:status => SUCCESS, :sms_status => "delivered", :currency => "USD"}

FakeWeb.register_uri :post, construct_fakeweb_uri("/sms/send"), :body => SMS_SEND_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/sms/bulk_send"), :body => SMS_BULK_SEND_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/sms/get_history"), :body => SMS_GET_HISTORY_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/sms/get_rate"), :body => SMS_GET_RATE_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/sms/query_status"), :body => SMS_QUERY_STATUS_RESPONSE.to_json


describe Hoiio::SMS do

  it 'should send an SMS and return txn ref' do
    response = CLIENT.sms.send({:dest => TEST_PHONE, :msg => "test"})
    check_status response
    check_txn_ref response
  end

  it 'should send multiple SMSes and return txn ref' do
    response = CLIENT.sms.bulk_send({:dest => "+651234567,+6512352138", :msg => "test"})
    check_status response
    response['bulk_txn_ref'].should_not be_nil
  end

  it 'should return history' do
    response = CLIENT.sms.get_history
    check_status response
    response['entries_count'].should == "1"
  end

  it 'should return SMS rate' do
    response = CLIENT.sms.get_rate({:dest => "+1231231"})
    check_status response
    response['currency'].should == "SGD"
    response['rate'].should == "0.03"
  end

  it 'should query SMS status' do
    response = CLIENT.sms.query_status({:txn_ref => "test"})
    check_status response
    response['currency'].should == "USD"
    response['sms_status'].should == "delivered"
  end

end