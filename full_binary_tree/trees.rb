#!/usr/bin/env ruby

class Tree
  def initialize(root, nodes, edges)
    @root = root
    @nodes = nodes
    @edges = edges
    is_binary(root, nodes, edges)
  end

  def has_no_edges(root,edges)
    no_edges = true
    edges.each do |edge|
      a, b = edge.split(/\s/)
      no_edges = false if root == b
      no_edges = false if root == a
    end
    no_edges
  end
  
  def get_adjacent_nodes(node,edges)
    values = Array.new
    edges.each do |edge|
      a, b = edge.split(/\s/)
      values.push(a) if node == b
      values.push(b) if node == a
    end
  end

  def left_daughter(root,edges) daughter(root,edges,0) end
  def right_daughter(root,edges) daughter(root,edges,1) end
  
  def daughter(root, edges, left_or_right)
    adjacent_nodes = get_adjacent_nodes(root)
    return false unless adjacent_nodes.count == 2
    daughter_node = adjacent_nodes[left_or_right]
    edges = remove_edge(root,left_daughter)
  end

  

  def is_binary(root, nodes, edges)
    puts "checking #{root} #{nodes} #{edges}"
    return true if has_no_edges(root,edges)
    
  end

end


def graph(nodes, edges)
  for root in (1..nodes.to_i)
    Tree.new(root, nodes, edges)
  end
end

nodes = 0
edges = Array.new
File.open('in').readlines.each_with_index do |line,index|
  next if index == 0
  if line =~ /\d+ \d+/
    edges.push(line.chomp)
  else
    graph(nodes,edges) unless nodes == 0
    edges = Array.new
    nodes = line.chomp    
  end
end
