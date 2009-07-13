require 'test_helper'

class ProwlrTest < Test::Unit::TestCase
  context "Verifying an API key" do
    should "raise an exception if an invalid API key is passed" do
      apikey = 'invalid-apikey'
      stub_get('verify', {:apikey => apikey}, 'invalid_apikey.xml')
      assert_raises Prowlr::ProwlrError do
        Prowlr.verify(apikey)
      end
    end

    should "return 200 if a valid API key is passed" do
      apikey = 'valid-apikey'
      stub_get('verify', {:apikey => apikey}, 'success.xml')
      assert_equal 200, Prowlr.verify(apikey)['code'].to_i
    end
  end

  context "Validating an API key" do
    should "return 'false' if an invalid API key is passed" do
      apikey = 'invalid-apikey'
      stub_get('verify', {:apikey => apikey}, 'invalid_apikey.xml')
      assert !Prowlr.valid_apikey?(apikey)
    end
  
    should "return 'true' if a valid API key is passed" do
      apikey = 'valid-apikey'
      stub_get('verify', {:apikey => apikey}, 'success.xml')
      assert Prowlr.valid_apikey?(apikey)
    end
  end
  
  context "Fetching the number of remaining API calls" do
    should "return nil if an invalid API key is passed" do
      apikey = 'invalid-apikey'
      stub_get('verify', {:apikey => apikey}, 'invalid_apikey.xml')
      assert_nil Prowlr.remaining_calls(apikey)
    end
  
    should "return 999 if a valid API key is passed" do
      apikey = 'valid-apikey'
      stub_get('verify', {:apikey => apikey}, 'success.xml')
      assert_equal 999, Prowlr.remaining_calls(apikey)
    end
  end
  
  context "Fetching the date when the number of remaining API calls is reset" do
    should "return nil if an invalid API key is passed" do
      apikey = 'invalid-apikey'
      stub_get('verify', {:apikey => apikey}, 'invalid_apikey.xml')
      assert_nil Prowlr.reset_date(apikey)
    end
  
    should "return the date if a valid API key is passed" do
      apikey = 'valid-apikey'
      stub_get('verify', {:apikey => apikey}, 'success.xml')
      assert_equal Time.at(1247418349), Prowlr.reset_date(apikey)
    end
  end
  
  context "Adding an event" do
    setup do
      @params = {:apikey => 'valid-apikey',
                 :application => 'an application',
                 :event => 'an event',
                 :description => 'a description'}
    end
  
    should "raise an exception if an invalid API key is passed" do
      @params.merge!({:apikey => 'invalid-apikey'})
      stub_get('add', @params, 'invalid_apikey.xml')
      assert_raises Prowlr::ProwlrError do
        Prowlr.add(@params)
      end
    end
  
    should "raise an exception if neither an event or a description is passed" do
      @params.delete(:event)
      @params.delete(:description)
      stub_get('add', @params, 'bad_request.xml')
      assert_raises Prowlr::ProwlrError do
        Prowlr.add(@params)
      end
    end
    
    should "return 200 if a valid API key and required params are passed" do
      stub_get('add', @params, 'success.xml')
      assert_equal 200, Prowlr.add(@params)['code'].to_i
    end
  end
  
  context "Creating new instance and adding an event" do
    setup do
      @params = {:application => 'an application',
                 :event => 'an event',
                 :description => 'a description'}
    end
  
    should "raise an exception if the instance was initialized with an invalid API key" do
      apikey = 'invalid_apikey'
      prowlr = Prowlr.new(apikey)
      stub_get('add', @params.merge(:apikey => apikey), 'invalid_apikey.xml')
      assert_raises Prowlr::ProwlrError do
        prowlr.add(@params)
      end
    end
  
    should "raise an exception if neither an event or a description is passed" do
      apikey = 'invalid_apikey'
      prowlr = Prowlr.new(apikey)
      @params.delete(:event)
      @params.delete(:description)
      stub_get('add', @params.merge(:apikey => apikey), 'bad_request.xml')
      assert_raises Prowlr::ProwlrError do
        prowlr.add(@params)
      end
    end
    
    should "return 200 if the instance was initialized with a valid API key and required params are passed" do
      apikey = 'valid_apikey'
      prowlr = Prowlr.new(apikey)
      stub_get('add', @params.merge(:apikey => apikey), 'success.xml')
      assert_equal 200, prowlr.add(@params)['code'].to_i
    end
  end
end
