require 'spec_helper'

IVR_START_DIAL_RESPONSE = {:status => SUCCESS, :txn_ref => "test-1", :session => "S-1"}
IVR_MIDDLE_PLAY_RESPONSE = {:status => SUCCESS}
IVR_MIDDLE_GATHER_RESPONSE = {:status => SUCCESS}
IVR_MIDDLE_RECORD_RESPONSE = {:status => SUCCESS}
IVR_MIDDLE_MONITOR_RESPONSE = {:status => SUCCESS}
IVR_END_TRANSFER_RESPONSE = {:status => SUCCESS, :room => "R-1"}
IVR_END_HANGUP_RESPONSE = {:status => SUCCESS, :room => "R-1"}

FakeWeb.register_uri :post, construct_fakeweb_uri("/ivr/start/dial"), :body => IVR_START_DIAL_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/ivr/middle/play"), :body => IVR_MIDDLE_PLAY_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/ivr/middle/gather"), :body => IVR_MIDDLE_GATHER_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/ivr/middle/record"), :body => IVR_MIDDLE_RECORD_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/ivr/middle/monitor"), :body => IVR_MIDDLE_MONITOR_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/ivr/end/transfer"), :body => IVR_END_TRANSFER_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/ivr/end/hangup"), :body => IVR_END_HANGUP_RESPONSE.to_json

describe Hoiio::IVR do

  it 'should make a dial-out to a destination number' do
    response = CLIENT.ivr.start.dial({"dest" => TEST_PHONE})
    check_status response
    check_txn_ref response
    response["session"].should == "S-1"
  end

  it 'should want to play a voice message' do
    response = CLIENT.ivr.middle.play({"session" => "S-1"})
    check_status response
  end

  it 'should get user input via the telephone keypad' do
    response = CLIENT.ivr.middle.gather({"session" => "S-1", "notify_url" => "http://dev.example.com/hoiio/record"})
    check_status response
  end

  it 'should record voice messages from the user over the phone' do
    response = CLIENT.ivr.middle.gather({"session" => "S-1", "notify_url" => "http://dev.example.com/hoiio/record"})
    check_status response
  end

  it 'should record the call conversation, including any voice messages' do
    response = CLIENT.ivr.middle.monitor({"session" => "S-1", "notify_url" => "http://dev.example.com/hoiio/record"})
    check_status response
  end

  it 'should transfer the call to destination number' do
    response = CLIENT.ivr.end.transfer({"session" => "S-1", "dest" => "+6591112222"})
    check_status response
    response["room"].should == "R-1"
  end

  it 'should hang up a specific call' do
    response = CLIENT.ivr.end.hangup({"session" => "S-1"})
    check_status response
  end

end