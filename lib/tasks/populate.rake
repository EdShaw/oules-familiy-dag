namespace :populate do
  desc "Populate the database with datasets."
  task from_oules: :environment do
    mode = :null
    parents = []

    nodes = []
    parent_hash = Hash.new([])
    node_labels = Hash.new()

    File.open('oules.txt').each do |line|
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

    ActiveRecord::Base.transaction do

      node_to_db = Hash.new()

      nodes.each do |node|
        puts node + " -> " + node_labels[node] + "| parents: " + parent_hash[node].to_s

        #  Fucking weird bug. :( Create will not return an id.
        person = Person.where(name: node_labels[node]).first_or_create(name: node_labels[node])
        person = Person.find_by(name: node_labels[node])

        puts person.name + " : " + person.id.to_s

        node_to_db[node] = person
      end

      puts "-------------- EDGES -----------"

      nodes.each do |node|
        parents = parent_hash[node].map { |pnode| node_to_db[pnode]}
        child = node_to_db[node]
        puts node
        puts child.to_s + " : " + child.id.to_s

        puts parents.to_s

        child.parents = parents

      end

    end
  end

end
