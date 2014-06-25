var sel0 = d3.select("#myChart").append("svg").attr("width",300.0).attr("height",300.0).style("background","#eef");
var dat1 = [[1.0,2.0],[5.0,10.0],[139.0,138.0],[140.0,150.0]];
var sel_dat2 = sel0.selectAll("circle").data(dat1).enter().append("circle").attr("class","p").attr("r",3.0).style("fill","blue").attr("cx",function(d){return d[0];}).attr("cy",function(d){return d[1];});
sel0.selectAll(".p").attr("transform","translate(25.0 25.0) scale(0.8333333333333334 0.8333333333333334) rotate(0.0)");
var dat3 = [{x:25.0,y:25.0,width:250.0,height:250.0}];
sel0.selectAll("rect").data(dat3).enter().append("rect").attr("x",function(d){return d.x;}).attr("y",function(d){return d.y;}).attr("width",function(d){return d.width;}).attr("height",function(d){return d.height;}).style("fill","none").attr("stroke","black").attr("stroke-width",1.0);
