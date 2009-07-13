require File.join(File.dirname(__FILE__), '..', 'lib', 'prowlr')
require File.join(File.dirname(__FILE__), 'helpers', 'config_store')
require 'pp'

config = ConfigStore.new("#{ENV['HOME']}/.prowlr")

prowlr = Prowlr.new(config['apikey'])
pp prowlr.add(:event => 'Notification from prowlr gem', :description => "Sent: #{Time.now}")