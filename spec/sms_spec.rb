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
    response = CLIENT.sms.send({"dest" => TEST_PHONE, "msg" => "test"})
    check_status response
    check_txn_ref response
  end

  it 'should send multiple SMSes and return txn ref' do
    response = CLIENT.sms.bulk_send({"dest" => "+651234567,+6512352138", "msg" => "test"})
    check_status response
    response['bulk_txn_ref'].should_not be_nil
  end

  it 'should return history' do
    response = CLIENT.sms.get_history
    check_status response
    response['entries_count'].should == "1"
  end

  it 'should return SMS rate' do
    response = CLIENT.sms.get_rate({"dest" => "+1231231"})
    check_status response
    response["currency"].should == "SGD"
    response["rate"].should == "0.03"
  end

  it 'should query SMS status' do
    response = CLIENT.sms.query_status({"txn_ref" => "test"})
    check_status response
    response["currency"].should == "USD"
    response["sms_status"].should == "delivered"
  end

end