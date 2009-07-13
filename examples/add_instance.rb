require File.join(File.dirname(__FILE__), '..', 'lib', 'prowl')
require File.join(File.dirname(__FILE__), 'helpers', 'config_store')
require 'pp'

config = ConfigStore.new("#{ENV['HOME']}/.prowl")

prowl = Prowl.new(config['apikey'])
pp prowl.add(:event => 'Notification from prowl.gem', :description => "Sent: #{Time.now}")