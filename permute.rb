def  arrangements(n)
  total = 0
  (1..n).to_a.permutation do |p|
    flag = true
    2.upto(n) do |i|
      # number at ith position divisible by i?
      # i is divisible by number at ith position
      next if flag == false
      flag = false unless (p[i-1]%i==0 or i%p[i-1]==0)
    end
    total += 1 if flag == true
  end
  total
end


puts arrangements(2)
