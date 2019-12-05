#Parse the non standard Fortigate emitted SysLogs. This was tested on a Fortigate 100D device.
# Version 0.1.0
module Fluent::Plugin
  class FortigateSyslogParser < Parser
    Fluent::Plugin.register_parser('FortigateSysLogParser', self)
    config_param :headerDelimiter, :string, default: '<([0-9]){3}>' #delimiter for the header
    config_param :delimiter, :string, default: '\\s(?=(?:[^\\"]*\\"[^\\"]*\\")*[^\\"]*$)'   # delimiter is configurable with " " as default
    config_param :separator, :string, default: "=" #key/value delimiter



    def configure (conf)
      super
      @time_parser = Fluent::TimeParser.new(@time_format)

    end

    def parse(logContent)

      record ={}

      begin
      #split the Fortigate log header and discard the unusable part
      header, not_used, recordSet = logContent.split(/#{Regexp.new(@headerDelimiter)}/)


      #split the usable part and then split the key/value pair
      recordSet.split(/#{Regexp.new(@delimiter)}/).each { |kv|
         k, v = kv.split(@separator, 2)
         record[k] = v
        }
      #Rebuild the correct date-time from the log information
      time = @time_parser.parse(record.values[0]+' '+record.values[1])

      rescue StandardError => e
        time = Time.now
        record[0]=DateTime.now
        record[1]=Time.now
        record[2]= "Unable to parse the record due to error: "+e.full_message
        record[3]= "Error inspection: "+e.backtrace.inspect.to_str()
        record[4]= logContent
      end

      yield time, record
    end

  end
end
