
def arrangements(n)
  total = 0
  cache = Hash.new
  (1..n).to_a.permutation do |p|
    flag = true
    2.upto(n) do |i|
      max = [i,p[i-1]].max
      min = [i,p[i-1]].min
      # number at ith position divisible by i?
      # i is divisible by number at ith position
      break if flag == false
      if cache.has_key?(min)
        if cache[min].has_key?(max)
          flag = cache[min][max]
        else
          cache[min][max] = p[i-1]%i==0 or i%p[i-1]==0
          flag = cache[min][max]
        end
      else
        cache[min] = Hash.new
        cache[min][max] = p[i-1]%i==0 or i%p[i-1]==0
        flag = cache[min][max]
      end
    end
    total += 1 if flag == true
  end
  total
end


puts arrangements(2)
