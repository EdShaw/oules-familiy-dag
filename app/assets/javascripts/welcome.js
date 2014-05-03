function makeGraph(error, nodes, edges){

  var g = new dagre.Digraph();
  var svg = d3.select("#dag-container");
  var svg_group = d3.select("#dag");

  nodes.forEach(function(e,i,a){
    g.addNode(e.id, {label: e.name});
  });

  edges.forEach(function(e,i,a){
    g.addEdge(null, e.parent_id, e.child_id);
  })

  var layout = dagre.layout().run(g);

  console.log(layout)

  var renderer = new dagreD3.Renderer();
  renderer.run(g, svg_group);

  svg.call(d3.behavior.zoom().on("zoom", function() {
    var ev = d3.event;
    svg_group
      .attr("transform", "translate(" + ev.translate + ") scale(" + ev.scale + ")");
  }));

}


$(function(){

  queue()
      .defer(d3.json, '/people.json')
      .defer(d3.json, '/parent_ofs.json')
      .await(makeGraph);
});
