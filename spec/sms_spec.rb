require 'spec_helper'
require 'hoiio-ruby/errors'

describe Hoiio::SMS do
  it 'should throw input error param missing' do
    lambda { CLIENT.sms.send }.should raise_error(Hoiio::InputError)
  end

  it 'should send successfully' do
    res = CLIENT.sms.send({"dest" => TEST_PHONE, "msg" => "test"})
    res['status'].should == "success_ok"
  end

  it 'should return sms history' do
    res = CLIENT.sms.get_history()
    res['status'].should == "success_ok"
  end
end
