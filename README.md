# prowlr

Yet another [Prowl](https://prowl.weks.net/) [API](https://prowl.weks.net/api.php) gem. Includes a command line interface. Depends on (the very awesome) [httparty](http://railstips.org/2008/7/29/it-s-an-httparty-and-everyone-is-invited).

### Add event:
    Prowlr.add(:apikey => 'apikey', :event => 'Notification from prowlr gem', :description => "Sent: #{Time.now}")
    => {"code"=>"200", "remaining"=>"981", "resetdate"=>"1247481311"}

Required: apikey and event or description. Optional: application, providerkey, priority. See [API](https://prowl.weks.net/api.php) for details.

### Create instance and add event:
    prowlr = Prowlr.new('apikey')
    prowlr.add(:event => 'Notification from prowlr gem', :description => "Sent: #{Time.now}")
    => {"code"=>"200", "remaining"=>"980", "resetdate"=>"1247481311"}

### Verify:
    Prowlr.verify('apikey')
    => {"code"=>"200", "remaining"=>"979", "resetdate"=>"1247481311"}

### Valid API key?
    Prowlr.valid_apikey?('apikey')
    => true (or false)

### Remaining calls:
    Prowlr.remaining_calls('apikey')
    => 997 (or nil if API key not valid)

### Reset date:
    Prowlr.reset_date('apikey')
    => Mon Jul 13 11:35:11 +0100 2009 (or nil if API key not valid)

See [examples](http://github.com/robbevan/prowlr/tree/master/examples).

### From the command line:
    prowlr -h
    USAGE: /opt/local/bin/prowlr [options] [apikey] [event]
        -a, --application [APPLICATION]  Name of your application. Defaults to prowlr.gem if omitted.
        -d, --description [DESCRIPTION]  Description of the event
        -k, --providerkey [PROVIDER KEY] Your provider API key. Only necessary if you have been whitelisted.
        -p, --priority [PRIORITY]        Priority: an integer value ranging [-2, 2]: Very Low, Moderate, Normal, High, Emergency. Defaults to 0 if omitted.
        -h, --help                       Show help documentation

### Post a url to your iPhone:
    prowlr apikey -d 'http://www.google.com' 'URL'

### Post a phone number:
    prowlr apikey -d '0800 800 8000' 'Phone number'

## Copyright

Copyright (c) 2009 Rob Bevan. See LICENSE for details.
