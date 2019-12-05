# FortigateSyslogParser

FortigateSyslogParser is a plugin for fluentd intended to parse the syslogs issued by fortigate device.
This was implemented and tested for a Fortigate 100D device with FortiOS 6.2.0 installed.
Fortigate as well as other devices brakes regular syslog parsing due to the date/time format.
## Installation
navigate to your fluentd installation binary usually in \opt\td-agent\embedded\bin

```cmd
fluent-gem install 'fluent-plugin-fortigate-syslog-parser'
```

## Usage
After installing, configure the parser plugin in the td-agent.conf:
FortigateSyslogParser name is case sensitive!

    
    <source>
     @type udp
      port 9910
      bind 0.0.0.0
      <parse>
        @type FortigateSyslogParser
      </parse>
      tag parsed.fortigate
     </source>

To configure your Fortigate for shipping the log towards fluentd:

    config log syslogd setting
        set port 9910
        set reliable disable 
        set server <fluentd_ip_address>
        set status enable
    end
    
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iliecz/fluent-plugin-fortigate-syslog-parser

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
