require 'spec_helper'
require 'hoiio-ruby/errors'

describe Hoiio::Voice do
  it 'should make a call and return txn_ref' do
    response = CLIENT.voice.call({"dest2" => "+6512345678"})
    response['status'].should == 'success_ok'
    response['txn_ref'].should_not be_nil
  end
end
