function makeGraph(error, nodes, edges){

  var g = new dagre.Digraph();

  nodes.forEach(function(e,i,a){
    g.addNode(e.id, {label: e.name});
  });

  edges.forEach(function(e,i,a){
    g.addEdge(null, e.parent_id, e.child_id);
  })

  var layout = dagre.layout().run(g);

  console.log(layout)

  var renderer = new dagreD3.Renderer();
  renderer.run(g, d3.select("#dag"));
}


$(function(){

  queue().defer(d3.json, '/people.json')
       .defer(d3.json, '/parent_ofs.json')
       .await(makeGraph);
});
