<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html  lang="en"   style=" overflow-y: hidden;" >
<head  >
<title>Visual Mail</title> 
	<spring:url value="/resources/js/jquery-1.11.3.min.js" var="jqueryJs" />
    <spring:url value="/resources/js/d3.min.js" var="d3Js" />
    <spring:url value="/resources/js/fisheye.js" var="fisheyeJs" />
	<spring:url value="/resources/css/VisualMail.css" var="mainCss" />
    <spring:url value="/resources/js/VisualMail.js" var="mainJs" />
	<spring:url value="/resources/js/flare.json" var="jsonFlare" />
	<spring:url value="/resources/js/d3-transform.js" var="d3JsT" />
	<spring:url value="/resources/js/jquery-ui-1.11.4/jquery-ui.min.js" var="jqueryUIJs" />
	<spring:url value="/resources/js/jquery-ui-1.11.4/jquery-ui.css" var="jqueryUICss" />	
	<spring:url value="/resources/js/jQuery-TE_v.1.4.0/uncompressed/jquery-te-1.4.0.js" var="jqueryte" />
	<spring:url value="/resources/js/jQuery-TE_v.1.4.0/jquery-te-1.4.0.css" var="jqueryteCSS" />
	
	

	
	
	
	<spring:url value="/resources/js/contextmenu/jquery.contextMenu.css" var="contextMenuCss" />	
	<spring:url value="/resources/js/contextmenu/jquery.ui.position.js" var="jqueryuiposition" />
	<spring:url value="/resources/js/contextmenu/jquery.contextMenu.js" var="contextMenujs" />
	
		<spring:url value="/resources/css/jquery.splitter.css" var="splitterjCss" />	
	<spring:url value="/resources/js/jquery.splitter-0.14.0.js" var="splitterjs" />
	
	

	<spring:url value="/resources/js/angular.min.js" var="AngularJs" />
<script src="${AngularJs}"></script>
	<script src="${jqueryJs}"></script>
	<link href="${mainCss}" rel="stylesheet" />
    <script src="${d3Js}"></script>
     <script src="${fisheyeJs}"></script>
     <link href="${mainCss}" rel="stylesheet" />
        <script src="${mainJs}"></script>
           <script src="${d3JsT}"></script> 
           <script src="${jqueryUIJs}"></script>
            <link href="${jqueryUICss}" rel="stylesheet" />
             <script src="${jqueryte}"></script>
            <link href="${jqueryteCSS}" rel="stylesheet" />
            
              <link href="${contextMenuCss}" rel="stylesheet" />
             <script src="${jqueryuiposition}"></script>
               <script src="${contextMenujs}"></script>
               
               <script src="${splitterjs}"></script>
               <link href="${splitterjCss}" rel="stylesheet">
               
               
               <spring:url value="/resources/js/angular-route.min.js" var="ar" />
               <spring:url value="/resources/js/angular-animate.min.js" var="aa" />	
			   <spring:url value="/resources/js/angular-aria.min.js" var="aar" />
				<spring:url value="/resources/js/angular-messages.min.js" var="am" />
			    
                        <spring:url value="/resources/js//svg-assets-cache.js" var="cacheM" />
                       
                 	    <spring:url value="/resources/js/angular-material.min.js" var="amjs" />
                      
                       	<spring:url value="/resources/css/angular-material.min.css" var="amcss" />
				
				 
               
                    <script src="${ar}"></script>
                    <script src="${aa}"></script>
                    <script src="${aar}"></script>
                    <script src="${am}"></script>
                    
                     <script src="${cacheM}"></script>
                    <script src="${amjs}"></script>
               		 <link href="${amcss}" rel="stylesheet">
                
        
                
                      
         

               
</head>

 <meta charset="utf-8">
  <%@page pageEncoding="UTF-8"%>
 

<div id="textoseleccionado"></div>
 <div id="area1"></div>
<div id="area2"></div>

<body  style="color: rgb(14, 14, 14); overflow: hidden; "  >
<div id="loader_container"></div>	
<script>
var loc = window.location;
var pathName = loc.pathname.substring(0, loc.pathname.lastIndexOf('/') + 1);
var person = {Name:"Sin Filtro", Interactions:0}; 
var Users=[];
var ultimaSession=0;
var TiempoDialogo=0;
Users.push(person);

var userFilter="";

function zoomHtml() {
    document.body.style.zoom = "70%" 
}

$(".LogOut").click(function() {
	window.location.href = pathName+'Login';
	});

var seleccionfire;
//menu contextual sender	
$(function() {
    $.contextMenu({
        selector: '.context-menu-one', 
        callback: function(key, options) {
            var m = "clicked: " + key;
            var accion='Dijo';
           
            switch(key) {
            case 'ac':
            	 accion='Acuerdos de Coordinación'
                break;
            case 'da':
            	 accion='Duda o Alternativa'
                break;
           case 'db':
           	 accion='Desacuerdo o Brecha'
               break;
           case 'ci':
           	 accion='Compromiso individual'
               break;
           case 'nc':
             	 accion='Norma Común'
                 break;
             case 'ta':
             	 accion='Tarea'
                 break;
            default:
            	 accion='Dijo'
       		 }
            
            
           
            
         //   if (navegacion)
            //	$( ".jqte_editor" ).html("");
            
           if ($(".jqte_editor").attr('contenteditable')=="false" )
        	   $( ".jqte_editor" ).html("");
           
           
        	modoEdicionD();

            
            var seleccion;
            if(navigator.userAgent.toLowerCase().indexOf('firefox') > -1)
			{
            	seleccion=  seleccionfire;
			}else{
				seleccion=  getSelectionHtml();
			}
        	//var seleccion=  window.getSelection().toString();
            
            
      		//$( ".jqte_editor" ).html("");
            $( ".jqte_editor" ).append( "<div class='cajita' contenteditable='false'><div class='cabecera'>"+ nombreSeleccionado +" "+ accion + ":</div><div class='ref'>"+ seleccion +"</div></div>" );
            
            
            $( ".jqte_editor" ).append( "<div id='textref' style= placeheld='yes' contenteditable='true'><br>" );
            $(".jqte_editor").css('background', '');
            //enable enviar post.
            $("#boton").attr("disabled", false);
            
            
            $('#textref').on('click', function(e){
            	$('#textref').append(" ");
            })    
                   
            
        },
        items: {
            "citar": {name: "Citar", icon: "citar"},
            "sep1": "---------",
            "da": {name: "Duda o Alternativa", icon: "da"},
            "nc": {name: "Normas Comunes", icon: "nc"},
            "ci": {name: "Compromiso individual", icon: "ci"},
            "ac": {name: "Acuerdos de Coordinación", icon: "ac"},
            "db": {name: "Desacuerdo o Brecha", icon: "db"}
        }
    });

    $('.context-menu-one').on('click', function(e){
    
    }) 
    
    
    //menu contextual reciber
    $.contextMenu({
        selector: '.context-menu-two', 
        callback: function(key, options) {
            var m = "clicked: " + key;
            var accion='Dijo';
           
            switch(key) {
            case 'ac':
           	 accion='Acuerdos de Coordinación'
               break;
           case 'da':
           	 accion='Duda o Alternativa'
               break;
          case 'db':
          	 accion='Desacuerdo o Brecha'
              break;
          case 'ci':
          	 accion='Compromiso individual'
              break;
          case 'nc':
            	 accion='Norma Común'
                break;
            case 'ta':
            	 accion='Tarea'
                break;
            default:
            	 accion='Dijo'
       		 }
            
        	modoEdicionD();
            //si tiene texto advertir
            var seleccion;
            if(navigator.userAgent.toLowerCase().indexOf('firefox') > -1)
			{
            	seleccion=  seleccionfire;
			}else{
				seleccion=  getSelectionHtml();
			}
             
      		//$( ".jqte_editor" ).html("");
         //   var seleccion= getSelectionHtml();
           // var seleccion=  window.getSelection().toString();
        	
           var nombreSeleccionadoR=$("#acountunB").html();
            
            var elementoDialogo="<div class='cajita' contenteditable='false'><div class='cabecera'>"+ nombreSeleccionadoR +" "+ accion + ":</div><div class='ref'>"+ seleccion +"</div></div>";
            
            var cadena=$(".jqte_editor").html();
            
            var res = cadena.replace(seleccion,elementoDialogo);
            $(".jqte_editor").html(res);
            
           // $( ".jqte_editor" ).append(elementoDialogo);
            
      
            
            $( ".jqte_editor" ).append( "<div id='textref' placeheld='yes' contenteditable='true'>   <br>" );
            $(".jqte_editor").css('background', '');
           
            //enable enviar post.
            $("#boton").attr("disabled", false);
            
            $('#textref').on('click', function(e){
            	$('#textref').append(" ");
            })    
                   
            
        },
        items: {
            "da": {name: "Duda o Alternativa", icon: "da"},
            "nc": {name: "Normas Comunes", icon: "nc"},
            "ci": {name: "Compromiso individual", icon: "ci"},
            "ac": {name: "Acuerdos de Coordinación", icon: "ac"},
            "db": {name: "Desacuerdo o Brecha", icon: "db"}
        }
    });

    $('.context-menu-one').on('click', function(e){
    
    }) 
    
    
    $('div').mouseup(function() {
    	seleccionfire=getSelectionHtml();
    });


    
});


var navegacion=true;
var primeraCarga=true;
var textJson;
var sessionActual=1;
var sessionAnterior=0;
var first=true;
var textoaActual;
var nombreSeleccionado="FMS";
var mod=0;
function checkUser(name) {
	//grep
	var array=$.grep( Users, function( user, i ) {
  	return user.Name ==name;
	});
	return array.length>0;
	
   // return jQuery.inArray(name, Users )>-1;
}
$(function() {
    $(document).tooltip();
    $("#color").tooltip();
    
    $('#contenedor').height("945").split({orientation:'horizontal', limit:0});
    $('#tree').height("480").split({orientation:'horizontal', limit:0});
   // $('#contenedor').height("950").split({orientation:'horizontal', limit:0});
    $('#interface').height("340").split({orientation:'vertical', limit:0});
    
    
    
   // $( "#tree" ).resizable();

 });


$(document).ready(function(){
	
	if ($("#admin").html()=="false")
		{
		$("#administracion").attr("style","display:none");
		}
	
	$(".LogOut .LogOutImg").click(function() {
		window.location.href = pathName+'Login';
		});
	$(".help").click(function() {
		window.location.href = pathName+'static/ayuda.html';		
		});
	
    $("div").select(function(){		
  	  selectedText = document.getSelection();
  	  //alert(selectedText);
    });
    
  loadAjax();
  //$("#textarea").jqte();
  $("#textarea").css('min-height','18%').jqte();
  
  $(".jqte").addClass( "context-menu-two" );
  
  var newButton = $('<a class="myButton" unselectable="on" />');
  $('.jqte_Panel').append(newButton);

  newButton.on('click', function(){
   //new functionality
  });
  
  
   $( ".jqte_tool_22VM" ).click(function() {
	   Navega( "izq" );
		});
   $( ".jqte_tool_23VM" ).click(function() {
	   Navega( "up" );
		});
   $( ".jqte_tool_24VM" ).click(function() {
	   Navega( "der" );
		});
   $( ".jqte_tool_25VM" ).click(function() {
	   Navega( "down" );
		});
	
  
   $(document).keydown(function(e) {
	   if ($( ".jqte_editor" ).html().length>0 )
	   {  
		   if ($(".jqte_editor").attr('contenteditable')=="true" )
			   navegacion=false;	 
		   else
			   navegacion=true;
	   }else
       { navegacion=true;}
	   
	   
	   if (navegacion==true)
		   {
	    switch(e.which) {
	        case 37: // left
	        	Navega( "izq" );
	        break;

	        case 38: // up
	        	Navega( "up" );
	        break;

	        case 39: // right
	        	 Navega( "der" );
	        break;

	        case 40: // down
	        	 Navega( "down" );
	        break;

	        default: return; // exit this handler for other keys
	    }
	    e.preventDefault(); // prevent the default action (scroll / move caret)
		
		}
	});
	
   $( ".jqte_editor" ).keydown(function(e) {
		
	   if ($( ".jqte_editor" ).html().length>0)
	   {  
		   if ($(".jqte_editor").attr('contenteditable')=="true" )
			   navegacion=false;	 
		   else
			   navegacion=true;
	   }else
       { navegacion=true;}
	 });
   
   /*
   window.addEventListener("keydown", function(e) {
	    // space and arrow keys
	    if([37, 38, 39, 40].indexOf(e.keyCode) > -1) {
	       //if (navegacion==false)
	        e.preventDefault();
	    }else{
	    	navegacion=false;
	    }
	}, false);
   */

   
  
 
   
	
  
  
//  $("#textareaA").jqte();
  $(".cont1 .jqte").html("");
 
 
  $("textarea")
  .bind("drop", function(e) {
	  this.value = e.originalEvent.dataTransfer.getData("text") ||
      e.originalEvent.dataTransfer.getData("text/plain");
	  
	 
	  var mensajeref= nombreSeleccionado+" Dijo:\""+this.value+"\"";
  	 // var mensajeref="/^This is fixed text\. Now something editable:[\s\S]*?Now fixed again\.$/";
	  $("#tn").val( textoaActual+" "+mensajeref); 
	 // this.value=mensajeref;

  return false;
  });
  
  $(document).mousedown(function (e) {
	  textoaActual= $("#tn").val();
	});
  
	$('#menu li').click(function () {

	    //Fetch the value of the 'slide' data attribute of the clicked link
	    var id = (this).id;
	    
	    
	    if (id=="ui-id-6")
    	{
	    	window.location.href = pathName+'ListaUsers';
    	
    	}
	    if (id=="ui-id-7")
    	{
	    	window.location.href = pathName+'Login';
    	
    	}
	    
	    
	    if (id=="ui-id-2")
    	{
	    	$("#msg").text("Nuevo dialogo Iniciado.");
	    	//$("#msg1").html("");
    	
    	draw("data/clear");	
    	 $( "#dialog-message" ).dialog({
    	      modal: true,
    	      width:500,
    	      buttons: {
    	        Ok: function() {
    	          $( this ).dialog( "close" );
    	        }
    	      }
    	    });
    	
    	}
	    
	    if (id=="ui-id-3")
	    	{
	    	$("#msg").text("Dialogo guardado en el servidor.");
	    	$("#msg1").html("");
	    	
	    	draw("data/saveconf");	
	    	 $( "#dialog-message" ).dialog({
	    	      modal: true,
	    	      width:500,
	    	      buttons: {
	    	        Ok: function() {
	    	          $( this ).dialog( "close" );
	    	        }
	    	      }
	    	    });
	    	
	    	}
	    if (id=="ui-id-4")
    	{
    	draw("data/loadconf");	
    	$("#msg").text("Dialogo restaurado desde servidor.")
    	$("#msg1").html("");
    	 $( "#dialog-message" ).dialog({
    	      modal: true,
    	      width:500,
    	      buttons: {
    	        Ok: function() {
    	          $( this ).dialog( "close" );
    	        }
    	      }
    	    });
    	
    	}
	    if (id=="ui-id-5")
    	{
    	window.open(pathName+'data');
    	
    	}
	    
	    
	    if (id=="ui-id-8")
    	{
	    $("#msg").text("Descricpion de versiones")
	    $("#msg1").html("<br>version 0.3:Grafo seleccionable sin consistencia Temporal. <br>version 0.4:Grafo con nodos seleccionables, sin consistencia Temporal.<br>version 0.5:Se agrego Menu de administracion y consistencia temporal al grafico.<br>version 0.7: Se agrego columnas de consistencia temporal y opcion de citar dialoogo.<br>version 0.8:Se agrego opciones administrativas al menu,log de versiones y mejora interfaz de usuario.<br>version 0.9:Se agrego caracteristicas responsivas al grafo..")
    	 $( "#dialog-message" ).dialog({
    	      modal: true,
    	      width:900,
    	      buttons: {
    	        Ok: function() {
    	          $( this ).dialog( "close" );
    	        }
    	      }
    	    });
    	
    	}
	    
	    
	   
	    
	    
	    

	

	});
  
  
  
  $( "#ta" ).draggable();
  $( "#menu" ).menu({
		position: {
			my:'left top',
			at:'left bottom'
		}
	});

});


var lengthLine=0;




var width =1400,
height = 435;
var dataJ;
function loadAjax() {
 
	draw("data/init");	

}

	

	var myLoader = loader({width: 660, height: 200, container: "#loader_container", id: "loader"});
	var seleccionado=1;
	var widthNode =70;
	var heightNodes =1;
	var nodesVisualDefault=8;
	function draw(action)
	{
		
		var groups;

   		 var nodes;

	
    
    
    
  //  var cluster = d3.layout.tree()
  //  var cluster = d3.layout.cluster()
   // .size([height, width - 460]);

    var diagonal = d3.svg.diagonal()
    .projection(function (d) { return [d.y, d.x]; });
	
   
    
    
    
  
    myLoader();
    d3.json(action)
    		    .header("Content-Type", "application/json")
    		    .post(JSON.stringify(textJson), function(error, root) {
    			if (root==null)    	{
    				//validacion si root viene null del servidor si viene un sinrax error no es error es por que trato trasnformar
    				//un nulo(root) en json, solo se debe remover el svg..
    				var str = error.toString();
    				var n = str.indexOf("SyntaxError");
    			    if (n>-1)
    			    {	
    				$( "#tree svg").remove();
    		   	    $("#loader").remove();
    			    }else
    			    	{
    			    	alert("Error de conectvidad con el servidor, actualice e intente nuevamente.");
    				    $("#loader").remove();
    			    	}
    		return}else
    			{
    			$('#tn').tooltip();
		        $("#tn").tooltip("open");
    			$("#tn").tooltip('disable');
    				 
    			}
    	var depth=0;
    	var ultimoId=0;
         
    	var Descendants= getDescendants(root);
    	 
        width= widthNode*(Descendants+nodesVisualDefault);
        var cluster = d3.layout.cluster()
        .size([height, width - 460]);
        var svg;
        
        if (d3.select("svg")[0][0] =! null){
        	$( "#tree svg").remove()
        }
        svg = d3.select("#tree").append("svg")
        .attr("width", width)
        .attr("height", height+40)
      	.append("g")
        .attr("transform", "translate(90,30)");
        
		
      
      var focus = root,
      view;
  

       // groups = json;
       nodes = cluster.nodes(root),
      links = cluster.links(nodes);
       
       
       nodes.forEach(function(d) {
      	   if (d.depth>depth)
      		   depth= d.depth;

      	});

        
	    //Draw the line
	       var line = svg.append("line")
	                               .attr("x1", 0)
	                               .attr("y1", 1)
	                               .attr("x2", 0)
	                               .attr("y2", 1000)   
	                               .attr("stroke-width", 2)
	                               .attr("style", "stroke: #ddd; fill:none;stroke-dasharray: 10 5")
	                                .attr("stroke", "#ddd");
       
       
	       var defs = svg.append('svg:defs');	
           
           
     	var link = svg.selectAll(".link")
         .data(links)
     //    .enter().append("path")
       //    .attr("class", "link")
           .enter().append("line")
    	.attr("class", "link")
    	.attr("x1", function(d) {     		
    		return ((d.source.session)*widthNode)
    	})
    	.attr("y1", function(d) { return d.source.x;})
    	.attr("x2", function(d) { 
        	if (lengthLine<((d.target.session)*widthNode))
        		{
        		lengthLine=((d.target.session)*widthNode);
        		}
        	    
        	    
        	    vlengthLine=((d.target.session)*widthNode);
        	    //Draw the line
     	       var line = svg.append("line")
     	                               .attr("x1", vlengthLine)
     	                               .attr("y1", 1)
     	                               .attr("x2", vlengthLine)
     	                               .attr("y2", 1000)   
     	                                .attr("stroke-width", 2)
	                                    .attr("style", "stroke: #ddd; fill:none;stroke-dasharray: 10 5")
     	                                .attr("stroke", "#ddd");     	    
        	return ((d.target.session)*widthNode)
        	    
    		})   		
    	.attr("y2", function(d) { 	return d.target.x;})

    
     
     var defs = svg.append('svg:defs');
    
     	var person = {Name:"Sin Filtro", Interactions:0}; 
     	Users=[];
     	Users.push(person);
     	
     	
        var node = svg.selectAll(".node")
      .data(nodes)
    .enter().append("g")
      .attr("class", "node")
      .attr("userOwner", function(d) { return d.userOwner.id;})
      .attr("session", function(d) { return d.session;})
      .attr("color", function(d) { return d.color;})
      .attr("fullNameOwner", function(d) { return d.userOwner.fullName;})
      .attr("name", function(d) {
    	  var person = {Name:d.userOwner.userName, Interactions:1}; 
    	  Users[0].Interactions ++;
    	 if (!(checkUser(d.userOwner.userName)))
    		 Users.push(person);
    	 else
    		 {
    		 var array=$.grep( Users, function( user, i ) {return user.Name ==d.userOwner.userName;});
    		 array[0].Interactions++;    		 
    		 }
    	  return d.userOwner.userName;
    	  })
      .attr("parent", function(d) {    	  
    	  if (typeof d.parent.id !== "undefined")    		  
    	  return d.parent.id;
    	  else
    		  return "-1";
    	  })
      .attr("firstChild", function(d) { 
    	  if (typeof d.children !== "undefined")
    	  return d.children[0].id;
    	  else
    		  return "-1";
      }
      )
      .attr("render-order", "2")
      .attr("id", function (d) {
		
    	     if (ultimoId<d.id)
    	     		ultimoId=d.id
    	     defs.append('svg:pattern')
	           .attr('id',"i"+ d.userOwner.id)
	           .attr('width', '38')
	           .attr('height', '38')
	           .append('svg:image')
	           .attr('xlink:href',d.userOwner.urlIcon)
	           .attr('x', 0)
	           .attr('y', 0)
	           .attr('width', '38')
	           .attr('height', '38');       
    	     
    	  
    	  
    	  
    	     	  
    	  $( "#dialogosAntiguos" ).append( "<div style='display:none'id='t"+d.id+"' class='antiguos'>"+d.mensaje+"</div>" );
    	  
    	  return d.id; })
    	  .attr("Fecha", function(d) { return d.fecha;})
 		  .attr("TiempoDialogo", function(d) { 
 			  if (d.tiempoDialogo>TiempoDialogo)
 			 	TiempoDialogo=d.tiempoDialogo;
 			  return d.tiempoDialogo;
 			  })
         .attr("transform", function (d) {        	        	 
        	 width=width+widthNode; 
        	    svg.attr("width", width)
        
        	 
        	 
			 if (d.session==sessionActual)	
         		{
				 if (first == true)
					 {
					 first=false;			
					 
					 return "translate(" +widthNode*(d.session) + "," + d.x + ")"; 					 
					 }
				// lengthLine= ((d.session+1)*widthNode);
				 return "translate(" +widthNode + "," + d.x + ")"; 
         		}	
        	
        	    
        	    //lengthLine= ((d.session+1)*widthNode);
        	    first=true;
        	 	return "translate(" +widthNode*(d.session) + "," + d.x + ")"; 
			
        	 })
		
      
        node.append("circle")
        .attr("r", 1)
        .attr("class","no"); 	 
       node.append("circle")
      .attr("r", 9.5)
       .on("mouseover", function(d) {
    	   var mensaje = $("#t"+this.parentElement.id).html();
    	   
     	  tooltip.select('.label').html(d.name+":<div class=fecha>"+d.fecha+" &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<b class='msgsel'>"+ d.id +"/" + Users[0].Interactions +" <div>" );
  		  tooltip.select('.body').html(mensaje);
  		  tooltip.style('display', 'block');
    	})
    	 .on("mouseout", function(d) {
    		 tooltip.style('display', 'none');
    	})	
    	 .on("mousemove", function(d) {
    		  tooltip.style('top', (d3.event.pageY + 10) + 'px')
      	    .style('left', (d3.event.pageX + 10) + 'px');
    	})	
      .style("fill", function (d) { return d.color; }

      );

        
 	  
   
        var tooltip = d3.select('#tree')            // NEW 
        .append('div')                             // NEW
        .attr('class', 'tooltip');                 // NEW

      tooltip.append('div')                        // NEW
        .attr('class', 'label');                   // NEW

      tooltip.append('div')                        // NEW
        .attr('class', 'body');                   // NEW

      tooltip.append('div')                        // NEW
        .attr('class', 'percent');                 // NEW
        
        
        
        node.on({
        	  "mouseover": function() { 
            	  var mensaje = $("#t"+this.id).html();
            		
            	//  tooltip.select('.label').html(d.name+":");
          		  tooltip.select('.body').html(mensaje);
         		//  tooltip.style('display', 'block');
            	 
             },
            "mouseout":  function(d) { 
            	tooltip.style('display', 'none');
            
            }, 
            "mousemove":  function(d) { 
            	var dx=100;
                 if ($("#t"+this.id).height()>120)	
            		dx=150;             	
            
            	  
            	    tooltip.style('top', (d3.event.pageY - dx+$("#tree").scrollTop()) + 'px')
            	    .style('left', (d3.event.pageX + 20 +$("#tree").scrollLeft()) + 'px');
            }, 
            "click":  function(e) {
            	var e2 =this;
            	  
            if (navegacion==false)
            {
            if	($(".jqte_editor").html()!="")
            	{
             $("#msg").text("¿Seguro desea dejar el modo edicion? se pedera lo escrito");
        	 $( "#dialog-message" ).dialog({
        	      modal: true,
        	      width:700,
        	      buttons: {
        	        Ok: function() {
        	          $( this ).dialog( "close" );
        	          navegaMouse(e,e2);        	        
        	        },
        	   	    No: function() {        	   	 
     	          $( this ).dialog( "close" );
     	        
     	        }
        	      
        	    }
        	    });
            }
            
            }else{  
            	  navegacion=true;
            	navegaMouse(e,e2);}
        
   	           
            }
          });
        
     function navegaMouse(obj,objhtml)
     {
     	  //limpieza foco secundario.
 	  	$(".circleSec").attr("class","no");  
 		mod=0;
 	  
 	
 	  navegacion=true;
 	  $(".jqte_editor").css('background', 'transparent');
 	
 	  $(".regla").remove( ".regla" );
 	  
 	  svg.selectAll("rect.regla").remove();


 	 // $('.first[session!='+this.attributes["session"].value+']').removeClass("first");
 	  
 	  $('.first[session!='+obj.session+']').removeClass("first").removeClass('node').removeClass('focus');
    
      
 	  //nombre sender
 	  $("#sender #acountSender #acountunSender").text(obj.name);
 	//  $("#sender #acount img").text(this.childNodes[3].textContent);
 	  
 	
 	  //url imagen usuario sender
 	  $('#sender #acountSender img').attr('src', $("#i"+obj.userOwner.id+" image").attr('href'));
		
 	  //color usuario sender            	  
 	  document.getElementById("colorSender").value = obj.color;
 	  
 	  //tool tip sender
 	  $("#sender #acountSender").attr('title', obj.userOwner.fullName);
              	
 	
 	  $(".focus").attr("class","node");
 	
 	
 	
 	            	
 	// d3.select(objhtml).style({opacity:'1.0'});
 	seleccionado=obj.id;
 	//nombre dialogo svg
 	nombreSeleccionado=obj.name;
 	
 	
 	d3.select(objhtml).attr("class", "focus");
 	$(".noclass").attr("class","node");
  	$(".focusDialog").attr("class", "antiguos");
  	
  	
 	$("#t"+seleccionado).attr("class", "focusDialog");
 	
  	
 //	var mensaje = "<div class='label'>"+nombreSeleccionado +":</div>"+ $("#t"+seleccionado).html();
 	
 	var mensaje = "<div class='reglaFecha'>"+obj.fecha +" &nbsp; &nbsp; &nbsp; <b class='msgsel'>"+ obj.id +"/" + Users[0].Interactions +  "</b></div><div class='TextoSender'>"+ $("#t"+seleccionado).html() +"</div>";
     

  	
  	$(".caja").html(mensaje);
 	
     $("#ta").val(mensaje);
     $( "#ta" ).draggable();
     
     $("g[session="+obj.session+"]").first().attr("class","first node")
	    if (objhtml.attributes["class"].value=="first node")
         $("g[session="+objhtml.attributes["session"].value+"]").first().attr("class","first node focus")

	    var node = svg.selectAll(".first")
     node.insert("rect",":first-child")
   .attr("width", widthNode)
   .attr("height", 600)
    //.attr("id",  function (d) { return  d.session == this.attributes["session"].value })
    .attr("id", obj.id)
    .attr("class", "regla")
    .attr("fill", "#808080")
    .attr("fill-opacity", "0.15")
    .attr("stroke-width", "1")
    .attr("y",  function (d) { return -d.x+10;})
     .attr("x",  function (d) { return -50;})
     .text(function (d) { return d.name; }); 
	    
	                 
	  

	 $('.first[session!='+obj.session+']').find(':first-child').remove();
	 

	 
	 //modo edicion desde navegacion
	  $(".jqte_editor").attr('contenteditable','true');
	//  $(".jqte_editor").focus();  
   $(".jqte_tool").attr('style','display:inline')    	   
   $(".jqte_editor").text("");   
   
   //enable enviar post
   $("#boton").attr("disabled", false);
   $("#boton").removeClass("EnviarPostDisable");
	 
   
	   //restaurar usuario conectado modo edición.
	   $("#acountun").html($("#acountunB").html())
   	   $('#acount img').attr('src', $("#iconB").attr('src'));						       
   	    document.getElementById("color").value =  document.getElementById("colorB").value;
        $("#acount").attr('title', $("#acountB").attr("title"));
   
       $("#msgreciber").html("modo edicion usuario conectado.");
   
   
	  //seleccion foco secundario
 	   Navega("der"); 
     }
        
        
                    
        /*

        node.append("text")
      .attr("dx", function (d) { return d.children ? -28 : 28; })
      .attr("dy", 3)
      .style("text-anchor", function (d) { return d.children ? "end" : "start"; })
      .text(function (d) { return d.name; });
*/       
        node.append("text")
        .attr("dx", function (d) { return d.children ? -28 : 28; })
        .attr("dy", -22)
         .attr("fill", "red")
        .style("text-anchor", function (d) { return d.children ? "end" : "start"; })
        .text(function (d) { 
        	if (d.nuevo)
        		{return "New"}
        	return ""; });


       node.append("text")
      .attr("dy", 3)
      .style("text-anchor", function (d) { return d.children ? "end" : "start"; })
       .on("mouseover", function(d) {
    	   var mensaje = $("#t"+this.parentElement.id).html();
   		
     	  tooltip.select('.label').html(d.name+":");
  		  tooltip.select('.body').html(mensaje);
     		  tooltip.style('display', 'block');
    	})
    	 .on("mouseout", function(d) {
    		 tooltip.style('display', 'none');
    	})	
    	 .on("mousemove", function(d) {
    		  tooltip.style('top', (d3.event.pageY + 10) + 'px')
      	    .style('left', (d3.event.pageX + 10) + 'px');
    	})	
      .text(function (d) { return d.element; });
       
      
       node.append("text")
       .attr("dy",function (d) { return -d.x-5; })
       .attr("dx",function (d) { return -16; })
       .attr("class", "noclass")
       .style("text-anchor", function (d) { return d.children; })
       .text(function (d) { 

    	   return d.name;
       
       });
             
     


       
       
       
       node.append("rect")
       .data(nodes)
       .attr("width", 38)
       .attr("height", 38)
       .attr("fill", "#044B94")
       .attr("stroke", "black")
       .attr("stroke-width", "1")
       .attr("y",  function (d) { return -d.x-30;})
       .attr("x",  function (d) { return -25;})
       .attr("ry", 50 )
       .attr("rx", 50 )
       .attr("title",function (d) { return d.userOwner.fullName;})
       .attr("fill", function (d) { return "url(#i"+d.userOwner.id+")";})
       .attr("class", "columna")
       .text(function (d) { return d.name; });
       
   
       
       /*
       node.append("circle")
       .data(nodes)
       .attr("r", 20.5)
       .attr("stroke-width", "1")
       .attr("cy",  function (d) { return -d.x-10;})
       .attr("cx",  function (d) { return 0;})
              .attr("ry", 50 )
       .attr("rx", 50 )
       .attr("fill", function (d) { return "url(#"+d.userOwner.id+")";})
       .text(function (d) { return d.name; });
  		*/     
     
       
       
       /*
       linea
       var node = svg.selectAll(":first-child")
         node.append("rect")
      .attr("width", 1)
      .attr("height", 600)
      //.attr("id",  function (d) { return  d.session == this.attributes["session"].value })
      .attr("fill", "#808080")
      .attr("fill-opacity", "0.1")
      .attr("stroke-width", "1")
      .attr("y",  function (d) { return -d.x;})
       .attr("x",  function (d) { return 0;})
       .text(function (d) { return d.name; }); */
       
       
		     
       
       $("#"+seleccionado ).attr("class","focus");
       $(".noclass").attr("class","node");
       $("#t"+seleccionado ).attr("class","focusDialog");
    	var mensaje = $("#t"+seleccionado).html();
    	
    	 $(".cont1 .jqte").html(mensaje);
    	
        $("#ta").val(mensaje);
        $(".tooltip").attr("style","display:none");
        
        //Draw the line
        var line = svg.append("line")
                                .attr("x1", -50)
                                .attr("y1", 9)
                                .attr("x2", lengthLine)
                                .attr("y2", 9)   
                                .attr("stroke-width", 1)
                                 .attr("stroke", "#2dc1d2");
      
        
	    
        
        if(primeraCarga)
        {
        
         $(".jqte_editor").css('background', 'transparent');
		 //sender por defecto primera carga.
		// Navega("der");
		  //nombre sender
		 var sender= $(".focus");
     	  var name= sender.attr("name");
	  	  $("#sender #acountSender #acountunSender").text(name);

	  	

    	  //url imagen usuario sender
    	  var id=sender[0].attributes[9].value;
    	  $('#sender #acountSender img').attr('src', $("#i"+id+" image").attr('href'));
		
	 
    	  //color usuario sender
    	  var color = sender[0].attributes[3].value;
    	  document.getElementById("colorSender").value = color;
	  
    	  //tool tip sender
    	  var fullName = sender[0].attributes[4].value;
    	  $("#sender #acountSender").attr('title', fullName); 
    	  
    	  var idNode=sender[0].attributes[9].value;
    	  //var mensaje = $("#t"+idNode).html();
          var fecha=sender[0].attributes[10].value;;
    	  var mensaje = "<div class='reglaFecha'>"+ fecha +" &nbsp; &nbsp; &nbsp; <b class='msgsel'>"+ id +"/" + Users[0].Interactions +  "</b></div><div class='TextoSender'>"+  $("#t"+idNode).html(); +"</div>"; 
    	  
    	  
       	
     	  $("#dialog").html(mensaje);
    	
          $("#ta").val(mensaje);
          
         
          
          primeraCarga=false;
        }
          
          
         $( "#ta" ).draggable();
     	 $("#loader").remove();
   		 mod=0;
   		 Navega("der");  	
   		 
   		var scope = angular.element($("#outer")).scope();
   	    scope.$apply(function(){   
   	        scope.users = Users;
   	    })
   		var sender= $(".focus"); 
   		$(".msgsel").html(sender[0].attributes[9].value +"/"+Users[0].Interactions);
   		
        //duracion del dialogo
        if (TiempoDialogo<120)
        	 $('#duracion').html('Duración del Dialogo:'+ TiempoDialogo +' m');
		else{
            if (TiempoDialogo<1440){
            	 var TiempoDialogoHoras = Math.floor(TiempoDialogo/60);
            	 var TiempoMinutos = Math.floor(TiempoDialogo %60);
    			 $('#duracion').html('Duración del Dialogo:'+ TiempoDialogoHoras +' h '+TiempoMinutos+' m');
            }else{
            	var TiempoDialogoDias = Math.floor(TiempoDialogo/1440);
            	var TiempoDialogoHoras =  Math.floor(TiempoDialogo %(1440)/60);   
  			 	 $('#duracion').html('Duración del Dialogo:'+ TiempoDialogoDias +' d '+TiempoDialogoHoras+' h');
            }
		}
        

    });
    


	}
    
	
    $(function () {
        $("#boton").click(function () {
        	
            if ($(".jqte_editor").html()=="")
             {
            	$("#msg").text("El mensaje no puede ser enviado vacio.")
            	$("#msg1").html("");
            	 $( "#dialog-message" ).dialog({
            	      modal: true,
            	      width:500,
            	      buttons: {
            	        Ok: function() {
            	          $( this ).dialog( "close" );
            	        }
            	      }
            	    });
             }else
            	 {            	
        	
        	var name=String($("#acountun").html());
        	var color=$("#color").val().replace("#","");
        	
        	
        	
        	var str="";
        	var iduser= parseInt($('#iduser').text());
        	
        	//var mensaje = $("#tn").val();
        	
        	
        	
            $('.jqte_editor div').each(function(){
        	    $(this).removeAttr('contenteditable');
        	});
        	
        	var mensaje = $(".jqte_editor").html();
        	var elemento = "";

        	var parent=parseInt(seleccionado);

        	textJson = { "name": name  , "element": elemento , "color": color ,"parent": parent , "mensaje":  mensaje , "iduser": iduser};
        	
        	
        	
            draw("data/send");        	
            $( "#dialogosAntiguos .antiguos").remove();
            $( ".focusDialog").remove();
            $("#tn").val("");
            $(".noclass").attr("class","node");
            
            //seleccion nodo secundario;
            navegacion=true;
            Navega("der"); 
            	 }
        }
      )
           
      $("#recv").click(function () {

            draw("data/recv");        	        
        })
       $(".jqte_tool_22").click(function () {
				 $(".jqte_editor").text("");       	        
        })
        
        $("#Responder").click(function () {
           
			modoEdicion();
  		 
        })
        
      
      ;
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
    	function zoom() {
    	    var scale = d3.event.scale,
    	        translation = d3.event.translate,
    	        tbound = -h * scale,
    	        bbound = h * scale,
    	        lbound = (-w + m[1]) * scale,
    	        rbound = (w - m[3]) * scale;
    	    // limit translation to thresholds
    	    translation = [
    	        Math.max(Math.min(translation[0], rbound), lbound),
    	        Math.max(Math.min(translation[1], bbound), tbound)
    	    ];
    	    d3.select(".drawarea")
    	        .attr("transform", "translate(" + translation + ")" +
    	              " scale(" + scale + ")");
    	}
    	
    
    	function moveToBack(layerToMove) {
    		  var monkeyHolder = document.getElementById("1");    		  
    		  monkeyHolder.removeChild(layerToMove);
    		  monkeyHolder.insertBefore(layerToMove, monkeyHolder.firstChild);
    		}
    
    
    	
    	angular
    	  .module('MyApp',['ngMaterial', 'ngMessages', 'material.svgAssetsCache'])
    	  .config(function($mdIconProvider) {
    	    $mdIconProvider
    	      .iconSet("call", 'img/icons/sets/communication-icons.svg', 24)
    	      .iconSet("social", 'img/icons/sets/social-icons.svg', 24);
    	  })
    	  .controller('BasicDemoCtrl', function DemoCtrl($scope,$mdDialog) {
    	    var originatorEv;
    	    $scope.users = Users;
    	    
    	    $scope.changed = function() {
    	    	userFilter=$scope.user;
    	    	if ($scope.user=="Sin Filtro")
    	    		filter('remove',$scope.user);
    	    	    else
    	    		filter('user',$scope.user); 
    	    	};
    	  	
    	    
    	    this.openMenu = function($mdOpenMenu, ev) {
    	      originatorEv = ev;
    	      $mdOpenMenu(ev);
    	    };

    	    this.notificationsEnabled = true;
    	    this.toggleNotifications = function() {
    	      this.notificationsEnabled = !this.notificationsEnabled;
    	    };

    	    this.adminusers = function() {
    	    	window.location.href = pathName+'ListaUsers';

    	      originatorEv = null;
    	    };
    	    this.JSON = function() {
    	    	window.location.href = pathName+'data';

    	      originatorEv = null;
    	    };
    	    this.newD = function() {
    	    	$("#msg").text("Nuevo dialogo Iniciado.");
    	    	//$("#msg1").html("");
        	
        	draw("data/clear");	
        	 $( "#dialog-message" ).dialog({
        	      modal: true,
        	      width:500,
        	      buttons: {
        	        Ok: function() {
        	          $( this ).dialog( "close" );
        	        }
        	      }
        	    });

    	      originatorEv = null;
    	    };
    	    this.save = function() {
    	    	$("#msg").text("Dialogo guardado en el servidor.");
    	    	$("#msg1").html("");
    	    	
    	    	draw("data/saveconf");	
    	    	 $( "#dialog-message" ).dialog({
    	    	      modal: true,
    	    	      width:500,
    	    	      buttons: {
    	    	        Ok: function() {
    	    	          $( this ).dialog( "close" );
    	    	        }
    	    	      }
    	    	    });

    	      originatorEv = null;
    	    };
    	    this.load = function() {
    	    	draw("data/loadconf");	
    	    	$("#msg").text("Dialogo restaurado desde servidor.")
    	    	$("#msg1").html("");
    	    	 $( "#dialog-message" ).dialog({
    	    	      modal: true,
    	    	      width:500,
    	    	      buttons: {
    	    	        Ok: function() {
    	    	          $( this ).dialog( "close" );
    	    	        }
    	    	      }
    	    	    });

    	      originatorEv = null;
    	    };
    	    this.help = function() {

    	      originatorEv = null;
    	    };

    	    

    	    this.checkVoicemail = function() {
    	      // This never happens.
    	    };
    	  });
    	
    	
    	angular
  	  .module('MyApp2',['ngMaterial', 'ngMessages', 'material.svgAssetsCache'])
  	  .config(function($mdIconProvider) {
  	    $mdIconProvider
  	      .iconSet("call", 'img/icons/sets/communication-icons.svg', 24)
  	      .iconSet("social", 'img/icons/sets/social-icons.svg', 24);
  	  })
  	  .controller('BasicControls', function DemoCtrl($mdDialog) {
  	    var originatorEv;

  	    this.openMenu = function($mdOpenMenu, ev) {
  	      originatorEv = ev;
  	      $mdOpenMenu(ev);
  	    };

  	    this.notificationsEnabled = true;
  	    this.toggleNotifications = function() {
  	      this.notificationsEnabled = !this.notificationsEnabled;
  	    };

  	    this.adminusers = function() {
  	    	window.location.href = pathName+'ListaUsers';

  	      originatorEv = null;
  	    };
  	    this.JSON = function() {
  	    	window.location.href = pathName+'data';

  	      originatorEv = null;
  	    };
  	    this.newD = function() {
  	    	$("#msg").text("Nuevo dialogo Iniciado.");
  	    	//$("#msg1").html("");
      	
      	draw("data/clear");	
      	 $( "#dialog-message" ).dialog({
      	      modal: true,
      	      width:500,
      	      buttons: {
      	        Ok: function() {
      	          $( this ).dialog( "close" );
      	        }
      	      }
      	    });

  	      originatorEv = null;
  	    };
  	    this.save = function() {
  	    	$("#msg").text("Dialogo guardado en el servidor.");
  	    	$("#msg1").html("");
  	    	
  	    	draw("data/saveconf");	
  	    	 $( "#dialog-message" ).dialog({
  	    	      modal: true,
  	    	      width:500,
  	    	      buttons: {
  	    	        Ok: function() {
  	    	          $( this ).dialog( "close" );
  	    	        }
  	    	      }
  	    	    });

  	      originatorEv = null;
  	    };
  	    this.load = function() {
  	    	draw("data/loadconf");	
  	    	$("#msg").text("Dialogo restaurado desde servidor.")
  	    	$("#msg1").html("");
  	    	 $( "#dialog-message" ).dialog({
  	    	      modal: true,
  	    	      width:500,
  	    	      buttons: {
  	    	        Ok: function() {
  	    	          $( this ).dialog( "close" );
  	    	        }
  	    	      }
  	    	    });

  	      originatorEv = null;
  	    };
  	    this.help = function() {

  	      originatorEv = null;
  	    };

  	    

  	    this.checkVoicemail = function() {
  	      // This never happens.
  	    };
  	  });    	
    	
    function help(obj){
    }
    

</script>




<div title="cerrar" id="LogOut" class="LogOut" style="position: relative; top: -5px;">	<img class="LogOutImg"  ng-if="user.urlIcon != null" src="resources/css/ic_close_black_24px.svg" height="30" width="35"> </div>


<div  title="ayuda"  id="help" class="help" style="position: relative; top: -5px;">	<img class="LogOutImg" click="help($event)"  ng-if="user.urlIcon != null" src="resources/css/ic_help_black_24px.svg" height="30" width="35"> </div>

<div id="Title">

<div  class="md-menu-demo menudemoBasicUsage" ng-controller="BasicDemoCtrl as ctrl" ng-cloak="" ng-app="MyApp">
   
  <div style="position: relative; top: -5px;" title="administracion" class="menu-demo-container" layout-align="center center" id="administracion" layout="column">
    <md-menu style="padding: 0 0;" >
          <md-button aria-label="Open phone interactions menu" class="md-icon-button" ng-click="ctrl.openMenu($mdOpenMenu, $event)">
        <md-icon md-menu-origin="" md-svg-icon="resources/css/ic_settings_48px.svg"></md-icon>
      </md-button> 

      <md-menu-content width="4">
        <md-menu-item>
          <md-button ng-click="ctrl.newD($event)">          
           Nuevo Dialogo
          </md-button>
        </md-menu-item>
         <md-menu-item>
          <md-button ng-click="ctrl.save($event)">          
           Guardar Dialogo
          </md-button>
        </md-menu-item>
               <md-menu-item>
          <md-button ng-click="ctrl.load($event)">          
           Cargar Dialogo
          </md-button>
        </md-menu-item>
            <md-menu-item>
          <md-button ng-click="ctrl.JSON($event)">          
           Mostrar JSON
          </md-button>
        </md-menu-item>
                <md-menu-item>
          <md-button ng-click="ctrl.adminusers($event)">          
              Administrar Usuarios
          </md-button>
        </md-menu-item>
      </md-menu-content>
      
    </md-menu>
    
  </div>
    <md-input-container  id="outer"  layout="column" style="position: relative; top: -22px; width: 10%; display:block;    display: inline-block;
    float: right; font-size:18px; left: -60%;" class="md-block" flex-gt-sm="" >
            <md-select placeholder="filtro por usuario" layout="column" ng-model="user"  ng-change="changed()" label="filtro por usuario" aria-invalid="true">
              <md-option ng-repeat="user in users" value="{{user.Name}}">
                {{user.Name}}  ({{user.Interactions}})
              </md-option>
            </md-select>          
          </md-input-container>
        
</div>
	Visual Mail
	<div id="acc" style="position: relative; top: -5px;"> Bienvenido, 
	<img  title="${user.fullName}" ng-if="user.urlIcon != null" src=" ${user.urlIcon}" height="30" width="35"> 
${user.userName}  
<input  title="${user.fullName}" type="color" style="position: relative;top: -5px;"  name="favcolor" id="colorB" disabled value="${user.colorInteraction}">   

<div id="admin" style="display:none">${user.admin}</div>
<div id="duracion" style=" font-weight: bold; position:relative; left: -300px; top: -24px; font-size:14px"></div>	

</div>

</div>

</div>
<div id="contenedor">
<div id="tree" >
</div>
<div id="baja">






<div id="tree2">
</div>





<div>

<div id="dialogosAntiguos">
<textarea disabled="disabled"  style="display:none"   id ="ta"  rows="2" cols="200">
</textarea>
</div>
<div id="dialogosNuevos">
<textarea style="display:none"  id ="tn" rows="3" cols="200" >
</textarea>


<div id ="interface"   >
<div class=cont2 > 




<div class="disable-select" id="sender" style="width:96%; margin:5px;">
<div  id="acountSender" title="${user.fullName}" style=" font-size: 25px;   display: -webkit-inline-box;     display: -moz-box; -moz-box-orient: horizontal;" >
<div><img height="30" width="35">  </div>
<div  id="acountunSender" style="font-size: 25px;">  </div>
</div>

<div id="iduserSender" style="display:none" > ${user.id}  </div>
<input  type="color"  name="favcolor" id="colorSender" disabled >                       
 <div class="botones" style="display: inline-block;">  
   <div id="msgsender" style="display: inline-block;"></div>
   <div style="float: right;">    
	<div class="jqte_toolVM jqte_tool_22VM unselectable" role="button" data-tool="21" unselectable="on" style="-webkit-user-select: none;"><a class="jqte_tool_icon unselectable" unselectable="on" style="-webkit-user-select: none;"></a></div>
	<div class="jqte_toolVM jqte_tool_23VM unselectable" role="button" data-tool="21" unselectable="on" style="-webkit-user-select: none;"><a class="jqte_tool_icon unselectable" unselectable="on" style="-webkit-user-select: none;"></a></div>
	<div class="jqte_toolVM jqte_tool_24VM unselectable" role="button" data-tool="21" unselectable="on" style="-webkit-user-select: none;"><a class="jqte_tool_icon unselectable" unselectable="on" style="-webkit-user-select: none;"></a></div>
	<div class="jqte_toolVM jqte_tool_25VM unselectable" role="button" data-tool="21" unselectable="on" style="-webkit-user-select: none;"><a class="jqte_tool_icon unselectable" unselectable="on" style="-webkit-user-select: none;"></a></div>
   </div>    
</div>
  
</div>




<div id="dialog" class="caja context-menu-one  btn-neutral" > 
</div>
<input style="width:96%;margin:5px;" class="btn btn-success pull-right"  type="button" value="Responder" id="Responder">
</div>
<div class=cont2 >


<div id="reciber" style="width:96%; margin:5px;">
<div  id="acount" title="${user.fullName}" style=" font-size: 25px;   display: -webkit-inline-box;display: -moz-box; -moz-box-orient: horizontal;" >
<div ng-if="user.urlIcon != null" ><img id="imgR"  ng-if="user.urlIcon != null" src=" ${user.urlIcon}" height="30" width="35">  </div>
<div  id="acountun" style="font-size: 25px;"> ${user.userName}  </div>
</div>
<div id="iduser" style="display:none" > ${user.id}  </div>

<div id="dummy" style="display:none">
<div  id="acountB" title="${user.fullName}" style=" font-size: 25px;   display: -webkit-inline-box;" > ${user.fullName}
</div>
<div id="iduserB" style="display:none" > ${user.id}  </div>
<div ><img  id="iconB" ng-if="user.urlIcon != null" src=" ${user.urlIcon}" height="30" width="35">${user.urlIcon}"  </div>
<div  id="acountunB" style="font-size: 25px;"> ${user.userName}  </div>
<input  type="color"  name="favcolor" id="colorB" disabled value="${user.colorInteraction}">    
</div>





<input  type="color"  name="favcolor" id="color" disabled value="${user.colorInteraction}">                             
 <div class="botones" >
   <div id="msgreciber" style="display: inline-block;">modo edicion usuario conectado.</div>
   <div style="float: right;display: none;">
     
	<div class="jqte_toolVM jqte_tool_22VM unselectable" role="button" data-tool="21" unselectable="on" style="-webkit-user-select: none;"><a class="jqte_tool_icon unselectable" unselectable="on" style="-webkit-user-select: none;"></a></div>
	<div class="jqte_toolVM jqte_tool_23VM unselectable" role="button" data-tool="21" unselectable="on" style="-webkit-user-select: none;"><a class="jqte_tool_icon unselectable" unselectable="on" style="-webkit-user-select: none;"></a></div>
	<div class="jqte_toolVM jqte_tool_24VM unselectable" role="button" data-tool="21" unselectable="on" style="-webkit-user-select: none;"><a class="jqte_tool_icon unselectable" unselectable="on" style="-webkit-user-select: none;"></a></div>
	<div class="jqte_toolVM jqte_tool_25VM unselectable" role="button" data-tool="21" unselectable="on" style="-webkit-user-select: none;"><a class="jqte_tool_icon unselectable" unselectable="on" style="-webkit-user-select: none;"></a></div>
   </div> 

</div>
  
  
  
</div>



 
<textarea  id ="textarea"   >
</textarea>
<div>
<input type="button" value="Enviar Post" style="width:48%; margin:5px;" class="btn btn-primary" id="boton"><input class="btn btn-success pull-right" style="width:48%; margin:5px;"  type="button" value="Recibir Post" id="recv">
</div>

</div>



</div>
<div>


</div>

</div>



</div>


 <div id="dialog-message" title="Dialogos" style="display:none">
  <p>
    <span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
   
  </p>
  <p id ="msg">
     Dialogo guardado en el servidor</b>.
  </p>
  <div id="msg1">
      
  </div>
  
</div>
</div>
</div>

 
</body> 
</html>
 