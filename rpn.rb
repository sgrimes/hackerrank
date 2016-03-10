def not_all_int_or_operator(t)
  t.each do |e|
    return true unless e == e.to_i or ['+','-','*','/'].include?(e)
  end
  false
end

def rpn_calculate(t)
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
      while t != []
        curr = t.shift
        if ['+','-','*','/'].include?(curr)
          ops.push(curr)
        else
          ints.push(curr)
        end
        ## can do an operation?
        l = ints.length
        if l > 1 and ops.length > 0
          op = ops.pop
          ints = ints.slice(0,l-2).push(ints[l-2].send(op,ints[l-1]))
        end
      end
      puts ints[0]
    rescue
      puts "Invalid Input"
    end
  end
end

rpn_calculate([3,4,5,'*','-'])
rpn_calculate([10,100,'-',90,'+'])
