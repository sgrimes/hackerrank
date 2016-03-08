def not_all_int_or_operator(t)
  t.each do |e|
    return true if e.to_i < -1000000 or e.to_i > 1000000
    next if e.to_i.is_a? Integer
    next if ['+','-','*','/'].include?(e)
    return true
  end
  false
end

def rpn_calculate(t)
  t.each {|d| d = d.to_i if d.to_i.is_a? Integer}
  if t.length == 1 and t[0] = t[0].to_i
    puts t[0]
  elsif t.length % 2 == 0 or t.length < 3
    puts "Invalid input"
  elsif not_all_int_or_operator(t)
    puts "Invalid input"
  else
    ints = []
    ops = []
    begin
      t[0] = t[0] * 1.0
      while t != []
        curr = t.shift
        if ['+','-','*','/'].include?(curr)
          ops.push(curr)
        else
          ints.push(curr.to_i)
        end
        ## can do an operation?
        l = ints.length
        if l > 1 and ops.length > 0
          op = ops.pop            
          ints = ints.slice(0,l-2).push(ints[l-2].send(op,ints[l-1]))
        end
      end
      if (ints[0] - ints[0].to_i == 0)
        puts ints[0].to_i
      else
        puts ints[0]
      end
    rescue
      puts "Invalid Input"
    end
  end
end


#rpn_calculate([3,4,0,'/','-'])
#rpn_calculate([10,100,'-',90,'+'])
rpn_calculate([5,2,'/'])

