#!/usr/bin/env ruby

File.open('order.txt').readlines.each_with_index do |l,i|
  next if i == 0
  puts "Case ##{i}: #{l.split(/\s/).reverse.join(" ")}"
end
