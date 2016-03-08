
# only share if doing so won't eventually create a pileup at one end.

def share_load(arr)
  seconds = 0
  #puts arr.join(' ')
  # one second for each loop
  while arr.max > 1
    seconds += 1
    puts "-------"
    puts arr.join(' ')    
    (0..arr.length-2).each do |i|
      if arr[i] > arr[i+1] and arr.slice(i+1,arr.length-i+1).inject(:+) <= arr.length-i+1 and arr[i] > 1
        # share right
        arr[i+1] += 1
        arr[i] -= 1
      elsif arr[i] < arr[i+1] and arr.slice(0,i+1).inject(:+) < i+1
        # share left
        arr[i] += 1
        arr[i+1] -= 1
      end
    end
  end  
  puts arr.join(' ')
  seconds
end


a = [0,0,10,0,0,0,0,0,0,0]
puts share_load(a)
