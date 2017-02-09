<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<spring:url value="/resources/js/jquery-1.7.1.min.js" var="jqueryJs" />
    <spring:url value="/resources/js/d3.min.js" var="d3Js" />
    <spring:url value="/resources/js/fisheye.js" var="fisheyeJs" />
	<spring:url value="/resources/css/VisualMail.css" var="mainCss" />
    <spring:url value="/resources/js/VisualMail.js" var="mainJs" />
	<spring:url value="/resources/js/flare.json" var="jsonFlare" />
	<spring:url value="/resources/js/d3-transform.js" var="d3JsT" />
	
	
	<script src="${jqueryJs}"></script>
	<link href="${mainCss}" rel="stylesheet" />
    <script src="${d3Js}"></script>
     <script src="${fisheyeJs}"></script>
     <link href="${mainCss}" rel="stylesheet" />
        <script src="${mainJs}"></script>
           <script src="${d3JsT}"></script> 

</head>



 <meta charset="utf-8">
 
 
 <div id="area1"></div>
<div id="area2"></div>

<body>
	
<div id="loader_container"></div>	
<script>

$(document).ready(function(){
  loadAjax();
});


var dataJ;
function loadAjax() {
 
	draw("data");	
}
/*
var margin = {top: 30, right: 20, bottom: 30, left: 20},
width = 960 - margin.left - margin.right,
barHeight = 40,
barWidth = width * .8;

var i = 0,
duration = 400,
root;

var tree = d3.layout.tree()
.nodeSize([0, 20]);

var diagonal = d3.svg.diagonal()
.projection(function(d) { return [d.y, d.x]; });

var svg = d3.select("#area2").append("svg")
.attr("width", width + margin.left + margin.right)
.append("g")
.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.json("data", function(error, flare) {
if (error) throw error;

flare.x0 = 0;
flare.y0 = 0;
//update(root = flare);
});
*/




	var myLoader = loader({width: 660, height: 200, container: "#loader_container", id: "loader"});
	var seleccionado=1;

	function draw(action)
	{
    
		var width = 3660,
	    height = 770;

		
		/*
		var color = d3.scale.category20();

		var force = d3.layout.force()
	    .charge(-120)
	    .linkDistance(30)
	    .size([width, height])
		
		*/
		var groups;


   		 var nodes;

	
    
    
    
    var cluster = d3.layout.tree()
    var cluster = d3.layout.cluster()
    .size([height, width - 460]);

    var diagonal = d3.svg.diagonal()
    .projection(function (d) { return [d.y, d.x]; });
	
    var svg;
    if (d3.select("svg")[0][0] =! null){
    	$( "#tree svg").remove()
    }
    svg = d3.select("#tree").append("svg")
    .attr("width", width)
    .attr("height", height)
  	.append("g")
    .attr("transform", "translate(90,0)");
    
    
    

    d3.json(action, function (root) {
      
      var focus = root,
      view;
  

       // groups = json;
       nodes = cluster.nodes(root),
      links = cluster.links(nodes);
       
       /*
       force
       .nodes(nodes)
       .links(links)
       .start();
 	  */
 	  
      /*.attr("transform", function(d) {
    	   return d3.svg.transform()
           .scale(1,1)
           .translate( 150,0) })*/
           var depth=0;
           nodes.forEach(function(d) {
        	   if (d.depth>depth)
        		   depth= d.depth;

        	});
           
           
     	var link = svg.selectAll(".link")
         .data(links)
     //    .enter().append("path")
       //    .attr("class", "link")
           .enter().append("line")
    	.attr("class", "link")
    	.attr("x1", function(d) { 
    		
    		return ((d.source.id-1)*150)
    		
    		
	    	//  return d.source.y; 
    	})
    	.attr("y1", function(d) { return d.source.x;})
    	.attr("x2", function(d) { 
    		
    		return ((d.target.id-1)*150)
    		//return d.target.y; 
    		})   		
    	.attr("y2", function(d) { 	return d.target.x;})
           	//.attr("d", diagonal)
           	
          	
         /*  	
     	   .attr("transform", function (d) {
      		 
      		 var scale=(depth*0.125*(d.target.id-d.source.id));
      	
      	
      		var translate= -d.source.y;
      		
      		

      		 if (d.target.depth ==1)
      		 {
      		return "scale(" +   scale + "," + 1 + ")" ;
     	  	 }else
     	   	{
     		   return "scale(" +   scale + "," + 1 + ") translate("+ 0 + "," + 0 + ")"  ;
    		}
      		
     	   }
     );*/
        
        var node = svg.selectAll(".node")
      .data(nodes)
    .enter().append("g")
      .attr("class", "node")
      .attr("id", function (d) {
    	  
    	  
    	  $( "#dialogosAntiguos" ).append( "<div style='display:none'id='t"+d.id+"' class='antiguos'>"+d.name+":"+d.mensaje+"</div>" );
    	  
    	  return d.id; })
	    //.attr("transform", function (d) { return "translate(" + d.y + "," + d.x + ")"; })
         .attr("transform", function (d) { return "translate(" +150*(d.id-1) + "," + d.x + ")"; })

       node.append("circle")
      .attr("r", 14.5)
      .style("fill", function (d) { return d.color; });
        
 	  
 	  

 	  
 	  
 	  
   
        var tooltip = d3.select('#tree')            // NEW 
        .append('div')                             // NEW
        .attr('class', 'tooltip');                 // NEW

      tooltip.append('div')                        // NEW
        .attr('class', 'label');                   // NEW

      tooltip.append('div')                        // NEW
        .attr('class', 'count');                   // NEW

      tooltip.append('div')                        // NEW
        .attr('class', 'percent');                 // NEW
        
        
        
        node.on({
             "mouseover": function() { 
            	  var mensaje = $("#t"+this.id).text();
            		
         		  tooltip.select('.label').html(mensaje);
         		  tooltip.style('display', 'block');
            	 
             },
            "mouseout":  function(d) { 
            	tooltip.style('display', 'none');
            
            }, 
            "mousemove":  function(d) { 
            	  tooltip.style('top', (d3.event.pageY + 10) + 'px')
            	    .style('left', (d3.event.pageX + 10) + 'px');
            
            }, 
            "click":  function() {
            	$(".focus").attr("class","node");
            	
            	d3.select(this).style({opacity:'1.0'});
            	seleccionado=this.id;
            	d3.select(this).attr("class", "focus");
             	$(".focusDialog").attr("class", "antiguos");
             	
             	
            	$("#t"+seleccionado).attr("class", "focusDialog");
            	
             	var mensaje = $("#t"+seleccionado).text();
            	
                $("#ta").val(mensaje);
            }
          });
        
      
        
        
                    
        

        node.append("text")
      .attr("dx", function (d) { return d.children ? -28 : 28; })
      .attr("dy", 3)
      .style("text-anchor", function (d) { return d.children ? "end" : "start"; })
      .text(function (d) { return d.name; });
        
        node.append("text")
        .attr("dx", function (d) { return d.children ? -28 : 28; })
        .attr("dy", -22)
         .attr("fill", "red")
        .style("text-anchor", function (d) { return d.children ? "end" : "start"; })
        .text(function (d) { 
        	if (d.nuevo)
        		{return "NUEVO"}
        	return ""; });


       node.append("text")
      .attr("dy", 3)
      .style("text-anchor", function (d) { return d.children ? "end" : "start"; })
      .text(function (d) { return d.element; });
       
       node.append("text")
       .attr("dy",function (d) { return -d.x+20; })
       .attr("class", "columna")
       .style("text-anchor", function (d) { return d.children ? "end" : "start"; })
       .text(function (d) { return d.name; });
       
       node.append("rect")
       .attr("width", 150)
       .attr("height", 30)
       .attr("fill", "#044B94")
       .attr("fill-opacity", "0.4")
       .attr("stroke", "black")
       .attr("stroke-width", "1")
       .attr("y",  function (d) { return -d.x;})
       .attr("x",  function (d) { return -50;})
       .attr("class", "columna")
       .text(function (d) { return d.name; });
       
       
		     
       
       $("#"+seleccionado ).attr("class","focus");
       $("#t"+seleccionado ).attr("class","focusDialog");
    	var mensaje = $("#t"+seleccionado).text();
    	
        $("#ta").val(mensaje);
        

    });
    
    
  
    
    setTimeout(function() {
    	$("#loader").remove();
  }, 1000);
    

  //  d3.select(self.frameElement).style("height", height + "px");
    
    
    
  
    

	}
    
	
    $(function () {
        $("#boton").click(function () {
        
        	myLoader();
        	var name=$("#acount").val();
        	var color=$("#color").val().replace("#","");
        	var str="";
        	var mensaje = $("#tn").val();
        	var elemento = $("#elemento").val()
            draw(str.concat("data/send?name=", name,"&element=",elemento,"&color=",color,"&parent=",seleccionado,"&mensaje=",mensaje));        	
            $( "#dialogosAntiguos .antiguos").remove();
            $( ".focusDialog").remove();
            $("#tn").val("");
            
        }
      );
    });
        

    
    function update(source) {

    	  // Compute the flattened node list. TODO use d3.layout.hierarchy.
    	  var nodes = tree.nodes(root);

    	  var height = Math.max(800, nodes.length * barHeight + margin.top + margin.bottom);

    	  d3.select("svg").transition()
    	      .duration(duration)
    	      .attr("height", 800);

    	  d3.select(self.frameElement).transition()
    	      .duration(duration)
    	      .style("height", height + "px");

    	  // Compute the "layout".
    	  nodes.forEach(function(n, i) {
    	    n.x = i * barHeight;
    	  });

    	  // Update the nodes…
    	  var node = svg.selectAll("g.node2")
    	      .data(nodes, function(d) { return d.id || (d.id = ++i); });

    	  var nodeEnter = node.enter().append("g")
    	      .attr("class", "node2")
    	      .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
    	      .style("opacity", 1e-6);

    	  // Enter any new nodes at the parent's previous position.
    	  nodeEnter.append("rect")
    	      .attr("y", -barHeight / 2)
    	      .attr("height", barHeight)
    	      .attr("width", barWidth)
    	      .style("fill", color)
    	      .on("click", click);

    	  nodeEnter.append("text")
    	      .attr("dy", 3.5)
    	      .attr("dx", 5.5)
    	      .text(function(d) { return  d.name+":"+d.mensaje; });

    	  // Transition nodes to their new position.
    	  nodeEnter.transition()
    	      .duration(duration)
    	      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; })
    	      .style("opacity", 1);

    	  node.transition()
    	      .duration(duration)
    	      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; })
    	      .style("opacity", 1)
    	    .select("rect")
    	      .style("fill", color);

    	  // Transition exiting nodes to the parent's new position.
    	  node.exit().transition()
    	      .duration(duration)
    	      .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
    	      .style("opacity", 1e-6)
    	      .remove();

    	  // Update the links…
    	  var link = svg.selectAll("path.link")
    	      .data(tree.links(nodes), function(d) { return d.target.id; });

    	  // Enter any new links at the parent's previous position.
    	  link.enter().insert("path", "g")
    	      .attr("class", "link")
    	      .attr("d", function(d) {
    	        var o = {x: source.x0, y: source.y0};
    	        return diagonal({source: o, target: o});
    	      })
    	    .transition()
    	      .duration(duration)
    	      .attr("d", diagonal);

    	  // Transition links to their new position.
    	  link.transition()
    	      .duration(duration)
    	      .attr("d", diagonal);

    	  // Transition exiting nodes to the parent's new position.
    	  link.exit().transition()
    	      .duration(duration)
    	      .attr("d", function(d) {
    	        var o = {x: source.x, y: source.y};
    	        return diagonal({source: o, target: o});
    	      })
    	      .remove();

    	  // Stash the old positions for transition.
    	  nodes.forEach(function(d) {
    	    d.x0 = d.x;
    	    d.y0 = d.y;
    	  });
    	}

    	// Toggle children on click.
    	function click(d) {
    	  if (d.children) {
    	    d._children = d.children;
    	    d.children = null;
    	  } else {
    	    d.children = d._children;
    	    d._children = null;
    	  }
    	  update(d);
    	}

    	function color(d) {
    	  return d._children ? "#3182bd" : d.children ? "#c6dbef" : "#fd8d3c";
    	}
    
    
    
    
    

</script>

<div id="Title">
	Visual Mail 0.7
</div>
<div id="tree">
</div>
Cuenta: <INPUT TYPE="TEXT" NAME="name" value="felipe" id="acount">
  <input type="color" name="favcolor" id="color" value="#ff0000">
<div id="tree2">
</div>


<div>

<div id="dialogosAntiguos">
<textarea  id ="ta" disabled rows="4" cols="100">
</textarea>
</div>
<div id="dialogosNuevos">
<textarea  id ="tn" rows="4" cols="100">
</textarea><table style="width:100%">
<tr> <td><select id="elemento">
   <option value="=">=</option>
    <option value="==">==</option>
  <option value="?">?</option>
  <option value="=!">=!</option>
</select>
Elementos de dialogo como los acuerdos(=), los compromisos(==), las dudas(?) y desacuerdos (=!).</td> </tr>
  <tr>
    <td><input type="button" value="send-recibe" id="boton"><input type="button" value="recibe" id="boton"></td>    <td></td>
  </tr>
  <tr>
    <td></td>
  </tr>
</table>
</div>



</div>


 
</body> 
</html>
 