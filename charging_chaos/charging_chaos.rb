#!/usr/bin/env ruby

File.open('in').readlines.each_with_index do |line,index|
  if index == 0
    next
  elsif index  % 3 == 1
    n, l = line.split(/\s/)
  elsif index % 3 == 2
    initial = line.split(/\s/)
  elsif index % 3 == 0
    goal = line.split(/\s/)
    puts initial
    puts goal
    puts n
    puts l
    puts "###############"
  end

end
