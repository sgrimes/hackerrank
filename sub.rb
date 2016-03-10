# Complete the function below.

# complete sequence of commands. if robot facing same direction and has moved, no circle exists. if facing different direction or hasn't moved, circle exists.

def add(loc1,loc2)
  return [loc1[0]+loc2[0],loc1[1]+loc2[1]]
end
def  doesCircleExist( commands)
  loc = [0,0]
  o = "n"  # orientation: n, s, e, w
  while commands.length > 0
    c = commands[0]
    commands[0] = ''
    if c == "G"
      loc = add(loc,[0,1]) if o == "e"
      loc = add(loc,[1,0]) if o == "n"
      loc = add(loc,[0,-1]) if o == "w"
      loc = add(loc,[-1,0]) if o == "s"
    elsif c == "L"
      o = "n" if o == "e"
      o = "w" if o == "w"
      o = "s" if o == "w"
      o = "e" if o == "s"
    elsif c == "R"
      o = "n" if o == "w"
      o = "w" if o == "s"
      o = "s" if o == "e"
      o = "e" if o == "n"
    end
  end
  return "NO" if (o == "n" and (loc[0] != 0 or loc[1] !=0))
  return "YES" #otherwise
end

