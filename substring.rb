
require 'set'

def  buildSubsequences(s)
  length = s.length
  substrings = Set.new
  s_array = s.split('')
  1.upto(length) do |substring_length|
    s_array.combination(substring_length).to_a.each do |c|
      substrings.add(c.join(''))
    end
  end
  substrings.to_a.sort
end

puts buildSubsequences('frank')
