require 'spec_helper'
require 'hoiio-ruby/errors'

describe Hoiio::User do
  it 'should return user balance' do
    response = CLIENT.user.get_balance
    response['status'].should == 'success_ok'
    p response.to_s
  end

  it 'should return user info' do
    response = CLIENT.user.get_info
    response['status'].should == 'success_ok'
    p response.to_s
  end

  it "should throw request error" do
    CLIENT.access_token = 'aa'
    lambda { CLIENT.user.get_balance }.should raise_error(Hoiio::RequestError)
  end
end
