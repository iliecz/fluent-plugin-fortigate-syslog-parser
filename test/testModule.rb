require 'fluent/test'
require 'fluent/test/base'
require 'fluent/test/parser_test'
require 'fluent/test/helpers'
require 'fluent/test/driver/parser'
require 'fluent/test/driver/base'
require 'fluent/test/driver/output'
require 'fluent/plugin/out_file'
require 'fluent/plugin/parser'
require 'D:\Dev\Ruby\FluentdPlugins\fortigateSyslogParser\fortigateSyslogParser\lib\fortigateSyslogParser'
#require '../../fortigateSyslogParser/lib/fortigateSyslogParser'
require 'test-unit'

class MyParserTest < Test::Unit::TestCase
include Fluent::Test::Helpers

  setup do
    Fluent::Test.setup
  end

  def create_driver(conf={})
    Fluent::Test::Driver::Parser.new(Fluent::Plugin::FortigateSyslogParser).configure(conf)

  end

  def create_parser(conf)
    conf =%[
    delimiter '\\s(?=(?:[^\\"]*\\"[^\\"]*\\")*[^\\"]*$)'
    separator "="

    ]
    create_driver(conf).instance
  end

test "parser_exception" do

  #confidential information from the sample data has been removed or changed.
  sample_input1 = ''
  parser = create_parser('')

  parser.parse(sample_input1)   do |time, record|
    #assert_equal(event_time("2019-11-19 13:56:51"), time, "not equal time")
    assert_equal({ "devid" => "/FG.*/" }, record, record)

  end
end

test "parse_sample1" do

    #confidential information from the sample data has been removed or changed.
    sample_input1 = '<189>date=2019-11-19 time=13:56:51 devname="Router1" devid="FG100D3G16807489" logid="0000000013" type="traffic" subtype="forward" level="notice" vd="FIREWALL" eventtime=1574164611 srcip=10.3.57.180 srcname="mipJump01.meow.com" srcport=56584 srcintf="VLAN20" srcintfrole="undefined" dstip=80.169.167.9 dstport=443 dstintf="WAN1" dstintfrole="undefined" poluuid="4059dc62-4342-51e6-5120-4a56dd3c7c99" sessionid=1305401771 proto=6 action="close" policyid=17 policytype="policy" service="HTTPS" dstcountry="United Kingdom" srccountry="Reserved" trandisp="snat" transip=111.122.111.11 transport=56584 appid=40568 app="HTTPS.BROWSER" appcat="Web.Client" apprisk="medium"'
    parser = create_parser('')

    parser.parse(sample_input1)   do |time, record|
      assert_equal(event_time("2019-11-19 13:56:51"), time, "not equal time")
      assert_equal({ devid: "/FG.*/" }, record, "not equal record")

    end
end

test "parse_sample2" do

  #confidential information from the sample data has been removed or changed.
   sample_input2 = 'PV4			E±wã@zt
8
9Þ!)&¶J6
<190>date=2019-11-19 time=13:56:51 devname="Router1" devid="FG100D3G16807489" logid="1059028704" type="utm" subtype="app-ctrl" eventtype="app-ctrl-all" level="information" vd="FIREWALL" eventtime=1574155603 appid=15895 srcip=10.3.57.180 dstip=80.169.167.9 srcport=50045 dstport=443 srcintf="VLAN20" srcintfrole="undefined" dstintf="WAN1" dstintfrole="undefined" proto=6 service="HTTPS" direction="outgoing" policyid=17 sessionid=1304463896 applist="meow" appcat="Network.Service" app="SSL" action="pass" hostname="none.meow.com" incidentserialno=980199057 url="/" msg="Network.Service: SSL," apprisk="elevated" scertcname="none.meow.com"'
    parser = create_parser('')

    parser.parse(sample_input2)   do |time, record|
      assert_equal(event_time("2019-11-19 13:56:51"), time, "not equal time")
      assert_equal( record['devid'],"FG100D3G16807489", "not equal record")
      zzz=1
    end
  end

end

