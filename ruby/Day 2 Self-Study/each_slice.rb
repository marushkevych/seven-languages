#!/usr/bin/env ruby

a = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

acc =[]

a.each do|e|
  if acc.size < 3
    acc.push e
  else
    acc.push e
    p acc
    acc = []
  end
end

puts "now using each_slice"
a.each_slice(4) { |a| p a }

