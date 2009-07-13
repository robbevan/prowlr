require File.join(File.dirname(__FILE__), '..', 'lib', 'prowl')
require File.join(File.dirname(__FILE__), 'helpers', 'config_store')
require 'pp'

config = ConfigStore.new("#{ENV['HOME']}/.prowl")

pp Prowl.remaining_calls(config['apikey'])