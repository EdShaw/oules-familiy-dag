require 'ruby-graphviz'

GraphViz.parse( "oules.dot", :path => "/usr/local/bin/" ) {|graph|
  graph.each_node {|name, node|
    node.each_attribute {|k,v|
      puts k.to_s + " : " + v.to_s
    }
  }

  # graph.each_edge {|edge|
  #   puts edge.node_one + " -> " + edge.node_two
  # }
}
