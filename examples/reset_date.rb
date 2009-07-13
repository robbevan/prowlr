require File.join(File.dirname(__FILE__), '..', 'lib', 'prowl')
require File.join(File.dirname(__FILE__), 'helpers', 'config_store')
require 'pp'

config = ConfigStore.new("#{ENV['HOME']}/.prowl")

puts Prowl.reset_date(config['apikey'])