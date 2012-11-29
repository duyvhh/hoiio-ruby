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

NUMBER_GET_COUNTRIES_RESPONSE = {:status => SUCCESS, :entries_count => "10"}
NUMBER_GET_CHOICES_RESPONSE = {:status => SUCCESS, :total_entries_count => "30"}
NUMBER_GET_RATES_RESPONSE = {:status => SUCCESS, :currency => "SGD", :entries_count => "50"}
NUMBER_SUBSCRIBE_RESPONSE = {:status => SUCCESS, :debit => "9.99", :currency => "SGD"}
NUMBER_UPDATE_FORWARDING_RESPONSE = {:status => SUCCESS}
NUMBER_GET_ACTIVE_RESPONSE = {:status => SUCCESS, :entries_count => "3"}

FakeWeb.register_uri :post, construct_fakeweb_uri("/number/get_countries"), :body => NUMBER_GET_COUNTRIES_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/number/get_choices"), :body => NUMBER_GET_CHOICES_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/number/get_rates"), :body => NUMBER_GET_RATES_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/number/subscribe"), :body => NUMBER_SUBSCRIBE_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/number/update_forwarding"), :body => NUMBER_UPDATE_FORWARDING_RESPONSE.to_json
FakeWeb.register_uri :post, construct_fakeweb_uri("/number/get_active"), :body => NUMBER_GET_ACTIVE_RESPONSE.to_json


describe Hoiio::Number do

  it 'should get a list of countries for Hoiio Numbers' do
    response = CLIENT.number.get_countries
    check_status response
    response['entries_count'].should == "10"
  end

  it 'should get a list of available Hoiio Numbers for subscription in a given country' do
    response = CLIENT.number.get_choices({:country => "SG"})
    check_status response
    response['total_entries_count'].should == "30"
  end

  it 'should retrieve the billable rate that will be charged for subscribing to a Hoiio Number' do
    response = CLIENT.number.get_rates({:country => "SG"})
    check_status response
    response['entries_count'].should == "50"
    response['currency'].should == "SGD"
  end

  it 'should subscribe for a new Hoiio Number or extend an existing subscription of a Hoiio Number' do
    response = CLIENT.number.subscribe({:number => "+6581111111", :duration => "1"})
    check_status response
    response['debit'].should == "9.99"
    response['currency'].should == "SGD"
  end

  it 'should configure the URL that the incoming call notification and incoming SMS notification for Hoiio Number' do
    response = CLIENT.number.update_forwarding({:number => "+6581111111"})
    check_status response
  end

  it 'should retrieve the list of Hoiio Numbers and their current configurations' do
    response = CLIENT.number.get_active({:number => "+6581111111"})
    check_status response
    response['entries_count'].should == "3"
  end

end