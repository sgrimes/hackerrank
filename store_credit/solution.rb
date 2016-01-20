#!/usr/bin/env ruby

require 'set'

File.open('in').readlines.each_with_index do |line, i|
  next if i == 0
  next if i % 3 == 2
  if i % 3 == 1
    credit = line.strip.to_i
    puts "Credit #{credit}"
  else
    prices = line.split(/\s/)
    case_num = i / 3
    s = Set.new
    prices.each { |p| s.add(p) }
    prices.each_with_index do |p,index|
      a = credit.to_i - p.to_i
      next unless s.include?(a.to_s)
      puts "Case ##{case_num}: #{index} #{prices.index((credit-p.to_i).to_s)}"
    end
  end
end
