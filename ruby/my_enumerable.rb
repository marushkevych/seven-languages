#!/usr/bin/env ruby
class MyEnumerable
  include Enumerable
  
  def each
    yield('andrey')
    yield('masha')
    yield('katya')
    yield('frank')        
  end
end

test = MyEnumerable.new
test.each {|name| puts name }
puts test.map {|name| name.upcase}
puts test.any? {|name| name == 'katya'}
puts test.find {|name| name.start_with?('m')}
puts "longets name: " +  test.inject {|acc, name| if acc.size > name.size then acc; else; name; end}


