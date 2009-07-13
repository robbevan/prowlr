require File.join(File.dirname(__FILE__), '..', 'lib', 'prowlr')
require File.join(File.dirname(__FILE__), 'helpers', 'config_store')
require 'pp'

config = ConfigStore.new("#{ENV['HOME']}/.prowlr")

pp Prowlr.remaining_calls(config['apikey'])