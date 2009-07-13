require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'
require 'fakeweb'
require 'uri'

FakeWeb.allow_net_connect = false

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'prowlr'

class Test::Unit::TestCase
end

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

def prowlr_uri(uri)
  uri =~ /^https/ ? uri : "https://prowl.weks.net/publicapi/#{uri}"
end

def encode_params(params)
  params.map {|k,v| "#{URI.escape(k.to_s)}=#{URI.escape(v.to_s)}"}.join('&')
end

def stub_get(uri, params, filename)
  uri = "#{prowlr_uri(uri)}?#{encode_params(params)}"
  FakeWeb.register_uri(:get, uri, :body => fixture_file(filename))
end