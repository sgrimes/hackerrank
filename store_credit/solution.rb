#!/usr/bin/env ruby

require 'set'

credit = 0
File.open('in').readlines.each_with_index do |line, i|
  next if i == 0
  next if i % 3 == 2
  if i % 3 == 1
    credit = line.strip.to_i
  elsif i % 3 == 0
    prices = line.split(/\s/)
    case_num = i / 3
    s = Set.new
    prices.each { |p| s.add(p.to_i) }
    hash = Hash[prices.map.with_index.to_a]
    prices.each_with_index do |p,index|
      a = credit.to_i - p.to_i
      next unless s.include?(a)
      puts "Case ##{case_num}: #{index+1} #{hash[a.to_s]+1}"
      break
    end
  end
end
