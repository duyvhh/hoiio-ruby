# Hoiio

This is Ruby SDK for [Hoiio API][homepage]

Hoiio API is set of telephony API that integrate telephony services - phone calls, conference, IVR (Interactive Voice Responses), Fax and SMS - into your services and website easily.

Read the documentation at http://hoiio.readthedocs.org/

## Installation

Add this line to your application's Gemfile:

    gem 'hoiio'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hoiio

## Getting Started With Hoiio Ruby Gem


### Setup

``` ruby
require 'hoiio'

# Hoiio Application Credentials
app_id = ''
access_token = ''

# set up a client to talk to the Twilio REST API
@client = Hoiio::Client.new app_id, access_token
```

### Usage

After a @client object has been created, app_id and access_token are cached and used for subsequent API calls.
Normally, app_id won't change, but you can modify the client's access_token by reassigning it to a new one.

All API's URIs specified in [Hoiio Developer's website][documentation] are included in this SDK and can be accessed
conveniently.

For example, @client.sms will make all SMS APIs with the same name available, i.e: @client.sms.send will call /sms/send,
 @client.sms.query_status will fire a request to /sms/query_status (as specified [here][sms_query_status]).

### Send an SMS

``` ruby
# send an SMS using Hoiio
@client.sms.send(
  :dest => '+6591234567',
  :msg => 'Hello Steve',
  :notify_url => 'http://dev.example.com/sms/notify'
)
```

### Make a call

``` ruby
# call a destination number using Hoiio
@client.voice.call(
  :dest2 => '+6591234567',
  :caller_id => 'private'
)
```

## API References

Visit [our API site][documentation] to learn more about our powerful communication API.


[homepage]:http://developer.hoiio.com/
[documentation]:http://developer.hoiio.com/docs/index.html
[sms_query_status]:http://developer.hoiio.com/docs/sms_status.html
