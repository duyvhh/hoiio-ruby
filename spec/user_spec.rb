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