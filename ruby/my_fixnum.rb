#!/usr/bin/env ruby

class Fixnum
  def my_times(&block)
    i = self
    while i > 0
      i = i - 1
      block.call
    end
  end
  
  def my_times2
    i = self
    while i > 0
      i = i - 1
      yield
    end
  end
end

3.my_times{puts "calles my_times"}
3.my_times2{puts "calles my_times2t"}
