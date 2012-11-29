require 'spec_helper'
require 'hoiio-ruby/errors'

VOICE_CALL_RESPONSE = {:status => SUCCESS, :txn_ref => "test-1"}
VOICE_CONFERENCE_RESPONSE = {:status => SUCCESS, :txn_ref => "test-1"}
VOICE_HANGUP_RESPONSE = {:status => SUCCESS}
VOICE_GET_HISTORY_RESPONSE = {:status => SUCCESS, :entries_count => "1"}
VOICE_GET_RATE_RESPONSE = {:status => SUCCESS, :rate => "0.03", :currency => "SGD"}
VOICE_QUERY_STATUS_RESPONSE = {:status => SUCCESS, :call_status_dest1 => "answered", :currency => "SGD"}

FakeWeb.register_uri :post, construct_fakeweb_uri("/voice/call"), :body => VOICE_CALL_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/voice/conference"), :body => VOICE_CONFERENCE_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/voice/hangup"), :body => VOICE_HANGUP_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/voice/get_history"), :body => VOICE_GET_HISTORY_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/voice/get_rate"), :body => VOICE_GET_RATE_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/voice/query_status"), :body => VOICE_QUERY_STATUS_RESPONSE.to_json


describe Hoiio::Voice do

  it 'should make a call and return txn_ref' do
    response = CLIENT.voice.call({"dest2" => TEST_PHONE})
    check_status response
    check_txn_ref response
  end

  it 'should set up  conference call' do
    response = CLIENT.voice.conference({"dest" => TEST_PHONE})
    check_status response
    check_txn_ref response
  end

  it 'should hang up a call' do
    response = CLIENT.voice.hangup({"txn_ref" => "test"})
    check_status response
  end

  it 'should return history' do
    response = CLIENT.voice.get_history
    check_status response
    response['entries_count'].should == "1"
  end

  it 'should return call rate' do
    response = CLIENT.voice.get_rate({"dest1" => "+1231231", "dest2" => "+23123132"})
    check_status response
    response["currency"].should == "SGD"
    response["rate"].should == "0.03"
  end

  it 'should query call status' do
    response = CLIENT.voice.query_status({"txn_ref" => "test"})
    check_status response
    response["currency"].should == "SGD"
    response["call_status_dest1"].should == "answered"
  end

end