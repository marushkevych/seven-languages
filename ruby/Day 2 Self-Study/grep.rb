#!/usr/bin/env ruby
def grep(file_name, pattern)
  File.open(file_name) do |file|
    count = 0
    file.each {|line| count+=1; puts count.to_s + line unless line !~ pattern}
  end
end

grep('Tree.rb', /block/)