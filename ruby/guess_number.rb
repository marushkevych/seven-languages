#!/usr/bin/env ruby

puts 'hello'
num = rand(10) + 1
puts 'pick a number from 1 to 10'
guess = gets.to_i

while guess != num
  if num < guess
    puts 'too high... try again'
  else
    puts 'too low... try again'
  end
  guess = gets.to_i
end

puts 'You got it'

