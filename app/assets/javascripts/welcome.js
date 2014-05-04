$(function(){

  var svg = d3.select("#dag-container");
  var svg_group = d3.select("#dag");

  function zoomed() {
    svg_group.attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")");
  }

  var zoom = d3.behavior.zoom()
      .translate([0, 0])
      .scale(1)
      .scaleExtent([0.25, 4])
      .on("zoom", zoomed);

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
    renderer.run(g, svg_group);

    svg.call(zoom);
  }

  queue()
      .defer(d3.json, '/people.json')
      .defer(d3.json, '/parent_ofs.json')
      .await(makeGraph);
});
