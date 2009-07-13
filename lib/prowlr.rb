require 'rubygems'
gem 'httparty'
require 'httparty'

class Prowlr
  include HTTParty
  format :xml
  
  base_uri 'https://prowl.weks.net/publicapi'
  
  class ProwlrError < StandardError; end

  def initialize(apikey)
    @apikey = apikey
  end
  
  def add(options={})
    options.merge!({:apikey => @apikey})
    self.class.add(options)
  end
  
  class << self
    def verify(apikey)
      raise_errors(get('/verify', :query => {:apikey => apikey})['prowl'])
    end
    
    def valid_apikey?(apikey)
      verify(apikey)['code'].to_i == 200 rescue false
    end
    
    def remaining_calls(apikey)
      verify(apikey)['remaining'].to_i rescue nil
    end
    
    def reset_date(apikey)
      Time.at(verify(apikey)['resetdate'].to_i) rescue nil
    end

    def add(options={})
      options.merge!({:application => 'prowlr gem'}) unless options[:application]
      raise_errors(post('/add', :query => options)['prowl'])
    end

    def raise_errors(response)
      unless error = response['error']
        response['success']
      else
        raise ProwlrError, error
      end
    end
  end
end