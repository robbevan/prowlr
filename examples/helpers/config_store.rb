# Copyright (c) 2009 John Nunemaker
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

class ConfigStore
  attr_reader :file
  
  def initialize(file)
    @file = file
  end
  
  def load
    @config ||= YAML::load(open(file))
    self
  end
  
  def [](key)
    load
    @config[key]
  end
  
  def []=(key, value)
    @config[key] = value
  end
  
  def delete(*keys)
    keys.each { |key| @config.delete(key) }
    save
    self
  end
  
  def update(c={})
    @config.merge!(c)
    save
    self
  end
  
  def save
    File.open(file, 'w') { |f| f.write(YAML.dump(@config)) }
    self
  end
end