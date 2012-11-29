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
    response = CLIENT.fax.send({"dest" => TEST_PHONE, "file" => "test"})
    check_status response
    check_txn_ref response
  end

  it 'should return history' do
    response = CLIENT.fax.get_history
    check_status response
    response['entries_count'].should == "1"
  end

  it 'should return fax rate' do
    response = CLIENT.fax.get_rate({"dest" => "+1231231"})
    check_status response
    response["currency"].should == "SGD"
    response["rate"].should == "0.03"
  end

  it 'should query fax status' do
    response = CLIENT.fax.query_status({"txn_ref" => "test"})
    check_status response
    response["currency"].should == "USD"
    response["fax_status"].should == "answered"
  end

end