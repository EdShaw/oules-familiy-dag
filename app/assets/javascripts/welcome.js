$(function(){
  var g = new dagre.Digraph();

  g.addNode("a", {label: "Edd"});
  g.addNode("b", {label: "Ben"});
  g.addNode("c", {label: "Claire"});
  g.addNode("d", {label: "Din"});
  g.addNode("e", {label: "Elena"});

  g.addEdge(null, "a", "b");
  g.addEdge(null, "a", "c");
  g.addEdge(null, "c", "d");
  g.addEdge(null, "b", "d");
  g.addEdge(null, "b", "e");


  var layout = dagre.layout().run(g);

  console.log(layout)

  var renderer = new dagreD3.Renderer();
  renderer.run(g, d3.select("#dag"));
});
