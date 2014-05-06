mode = :null
parents = []

nodes = []
parent_hash = Hash.new([])
node_labels = Hash.new()

File.open( 'oules.txt').each do |line|
  mode = :nodes and next if line == "//nodes\n"
  mode = :edges and next if line == "//edges\n"

  case mode
  when :nodes
    regex=/^ *([a-zA-Z_]+) *\[ *label *= *\"([^\"]*)\" *\]; *$/m
    node, label = line.match(regex).captures
    nodes.push node
    node_labels[node] = label
  when :edges
    regex=/^ *\{ *$/
    regex.match(line)
    parents = []
    mode = :parents
  when :parents
    parent=/^ *([a-zA-Z_]+) *; *$/
    child=/^\} *-> * ([a-zA-Z_]+) *; *$/
    if parent.match(line)
      parent_node = line.match(parent).captures[0]
      parents.push parent_node
    elsif child.match(line)
      child_node = line.match(child).captures[0]
      mode = :edges
      parent_hash[child_node] = parents
    end
  else
  end
end


nodes.each do |node|
  puts node + " -> " + node_labels[node] + "| parents: " + parent_hash[node].to_s
end
