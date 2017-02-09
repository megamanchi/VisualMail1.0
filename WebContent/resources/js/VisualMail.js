/**
 * fuesntes js visual mail
 */

  function Navega(direccion)
   {
	   var CSSclass;
	   $(".jqte_editor").css('background', 'transparent');
	   $(".regla").remove( ".regla" );
    	  
      // svg.selectAll("rect.regla").remove();
       
       
       if (mod==0)
    	   CSSclass=".focus"
    	   else
    		CSSclass=".circleSec"
    	   
       var sender;
       var reciber;
       var id;
       var idReciber;
	   switch(direccion) {
       case 'izq':    	 
    		//elemento actual referencia al padre
    		if (mod==0)
    		id= $(CSSclass).attr("parent");
    		else
    		id= $(CSSclass).parent().attr("parent");
    		
    		if (typeof id !== "undefined")
    		{
    		if (id!=="-1")
    		{
    			
    		$(".circleSec").attr("class","no");      		   		
    		$("#"+id+" .no" ).attr("class", "circleSec");
    		sender = $("#"+id );
    		mod=1;
    		}
    		
    		}
    	   
           break;
       case 'up':
    		//elemento actual referencia al hermano session o profundidad
   		
 			if (mod==0)
  			id=$(CSSclass).attr("id");
    		else
    		id=$(CSSclass).parent()[0].attributes[9].value;
    		
   		    id=parseInt(id)-1;  
   		    if (id>0)
   		    	{
 				$(CSSclass).attr("class","no");  
   		   		$("#"+id+" .no" ).attr("class", "circleSec"); 
   		   		sender = $("#"+id );
   		   	    mod=1;
   		    	}
           break;
      case 'der':
    		//elemento referencia al hijo
    		if (mod==0)
    		id=$(CSSclass)[0].attributes[7].value;
    		else
    		id=$(CSSclass).parent()[0].attributes[7].value;
    		
    		if (id!=="-1")
    		{	
    		$(".circleSec").attr("class","no");      		   		
        	$("#"+id+" .no" ).attr("class", "circleSec");
      		sender = $("#"+id );
      		mod=1;
    		}
          break;
      case 'down':
    		//elemento actual referencia al hermano session o profundidad
    		if (mod==0)
  			id=$(CSSclass).attr("id");
    		else
    		id=$(CSSclass).parent()[0].attributes[9].value;
    			
    		id=parseInt(id)+1; 
    		if ($("#"+id).length>0)
    		{
  			$(".circleSec").attr("class","no");  
    		$("#"+id+" .no" ).attr("class", "circleSec"); 
    		sender = $("#"+id );
    		mod=1;
    		}
          break;
  		}
	   
	   
	   //asignacion sender 
	   	
	           	  //nombre sender
	           	  /*
	           	  if (sender.length>0)
	           	  {
	           	  var name= sender[0].attributes[5].value;
	   
	           	  //var name= sender.attr("name");
            	  $("#sender #acountSender #acountunSender").text(name);
            	 //  $("#sender #acount img").text(this.childNodes[3].textContent);
            	  
            
            	  //url imagen usuario sender
            	  var id=sender[0].attributes[1].value;
            	  $('#sender #acountSender img').attr('src', $("#i"+id+" image").attr('href'));
            	  seleccionado=sender[0].attributes[9].value;
				
            	 
            	  //color usuario sender
            	  var color = sender[0].attributes[3].value;
            	  document.getElementById("colorSender").value = color;
            	  
            	  //tool tip sender
            	  var fullName = sender[0].attributes[4].value;
            	  $("#sender #acountSender").attr('title', fullName);
            	  
            	  
            	  //modales y textos sender y reciber(pendiente)
            	   var idNode=sender[0].attributes[9].value;
            	  var mensaje = $("#t"+idNode).html();
                
   
             	
             	  $(".caja").html(mensaje);
            	
                  $("#ta").val(mensaje);
                 $( "#ta" ).draggable();
            	
                 */
                 
                 
            
             //Asignación reciber modo navegación.   
                 
                 //nombre reciber
                  //elemento referencia al hijo
                 if (CSSclass==".focus")
                	idReciber=$(CSSclass)[0].attributes[7].value;               
                  else
                    idReciber=$(CSSclass).parent()[0].attributes[9].value;
    			
    				reciber =$("#"+idReciber );
    				
    				if (reciber.length==0)
					 {
    					
    					
					   $(".jqte_editor").attr('contenteditable','false');
			        //   $(".jqte_editor").focus();  
			    	//   $(".jqte_tool").attr('style','display:inline')    	   
			    	   $(".jqte_editor").text("Este mensaje no tiene respuestas");
			    	   
			    	   
			    	   //enable enviar post
			  		   //$("#boton").attr("disabled", false);
			    	   
			    	   
			    	   //restaurar reciber .
			  		   
			  		   $("#acountun").html("");
				       $('#acount img').attr('src', "");						       
				       document.getElementById("color").value =  ""
				       //$("#acount").attr('title', $("#acountB").attr("title"));
				       
				       
				       $("#msgreciber").html("modo navegacion no editable");
				      // $("#msgreciber").html("modo edicion usuario conectado.");
				       $(".jqte_tool").attr('style','display:none')
				       $(".jqte_tool_1").attr('style','display:visible')
				       //disable enviar post
    	      		   $("#boton").attr("disabled", true);
				       $("#boton").addClass("EnviarPostDisable");
				       
				       
				   		$('#imgR').attr("src","resources/css/ploma.jpg");
					 }
    				
    				
    				  if ((userFilter!="")  && (userFilter!="Sin Filtro"))
		            	  filter('user',userFilter);	
    				  var nameR= reciber.attr("name");
    				  $("#acountun").text(nameR);
	            	  
    				  if(reciber.size()>0)
    				  {
	            	  //url imagen usuario reciber
	            	  var idr=reciber[0].attributes[1].value;
	            	  $('#acount img').attr('src', $("#i"+idr+" image").attr('href'));
					
	            	 
	            	  //color usuario reciber
	            	  var colorR = reciber[0].attributes[3].value;
	            	  document.getElementById("color").value = colorR;
	            	  
	            	  //tool tip reciber
	            	  var fullNameR = reciber[0].attributes[4].value;
	            	  $("#acount").attr('title', fullNameR);
	            	  
	            	  
	            	  //modales y textos sender y reciber(pendiente)
	            	   var idNode=reciber[0].attributes[9].value;
	            	  var mensaje = $("#t"+idNode).html();
    				  }
	            	  
	            	  $( ".jqte_editor" ).html(mensaje);
	           
	            	  
	            	  $(".jqte_editor").attr('contenteditable','false');
	            	  $(".jqte_tool").attr('style','display:none')
	            	  $(".jqte_tool_1").attr('style','display:visible')
	            	  

             		   //disable enviar post
    	      		  $("#boton").attr("disabled", true);
	            	  $("#boton").addClass("EnviarPostDisable");
             
	            	  $("#msgreciber").html("modo navegacion no editable");
	           	//  }
	            	  
	   
   }
   


function loader(config) {
  return function() {
    var radius = Math.min(config.width, config.height) / 2;
    var tau = 2 * Math.PI;

    var arc = d3.svg.arc()
            .innerRadius(radius*0.5)
            .outerRadius(radius*0.9)
            .startAngle(0);

    var svg = d3.select(config.container).append("svg")
        .attr("id", config.id)
        .attr("width", config.width)
        .attr("height", config.height)
      .append("g")
        .attr("transform", "translate(" + config.width / 2 + "," + config.height / 2 + ")")

    var background = svg.append("path")
            .datum({endAngle: 0.33*tau})
            .style("fill", "#4D4D4D")
            .attr("d", arc)
            .call(spin, 1500)

    function spin(selection, duration) {
        selection.transition()
            .ease("linear")
            .duration(duration)
            .attrTween("transform", function() {
                return d3.interpolateString("rotate(0)", "rotate(360)");
            });

        setTimeout(function() { spin(selection, duration); }, duration);
    }

    function transitionFunction(path) {
        path.transition()
            .duration(7500)
            .attrTween("stroke-dasharray", tweenDash)
            .each("end", function() { d3.select(this).call(transition); });
    }

  };
}


function getDescendants(node) {
    if(!node.children) {
        return 0;
    }
    var total = 0;
    node.children.forEach(function(d) {
        total += 1+getDescendants(d);
    }) 
    return total;
}
/*
function getSelectedText() {
    var text = "";
    if (typeof window.getSelection != "undefined") {
        text = window.getSelection().toString();
    } else if (typeof document.selection != "undefined" && document.selection.type == "Text") {
        text = document.selection.createRange().text;
    }
    return text;
}

function doSomethingWithSelectedText() {
    var selectedText = getSelectedText();
    if (selectedText) {
    	//$("#textoseleccionado").html(selectedText.replace(/\s/g, '<br>'));
    	$("#textoseleccionado").html(selectedText);
    }
}

document.onmouseup = doSomethingWithSelectedText;
document.onkeyup = doSomethingWithSelectedText;
*/

function getSelectionHtml() {
    var html = "";
    if (typeof window.getSelection != "undefined") {
        var sel = window.getSelection();
        if (sel.rangeCount) {
            var container = document.createElement("div");
            for (var i = 0, len = sel.rangeCount; i < len; ++i) {
                container.appendChild(sel.getRangeAt(i).cloneContents());
            }
            html = container.innerHTML;
        }
    } else if (typeof document.selection != "undefined") {
        if (document.selection.type == "Text") {
            html = document.selection.createRange().htmlText;
        }
    }
    return html;
}




function modoEdicion() {
	$(".jqte_editor").css('background', '');
    $(".jqte_editor").attr('contenteditable','true');
    $(".jqte_editor").focus();  
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
}
function modoEdicionD() {
	$(".jqte_editor").css('background', '');
    $(".jqte_editor").attr('contenteditable','true');
   // $(".jqte_editor").focus();  
	   $(".jqte_tool").attr('style','display:inline')    	   
	   //enable enviar post
	  // $("#boton").attr("disabled", false);
	  // $("#boton").click(true);
	      $("#boton").removeClass("EnviarPostDisable");
	   
	   
	   //restaurar usuario conectado modo edición.
	   $("#acountun").html($("#acountunB").html())
    $('#acount img').attr('src', $("#iconB").attr('src'));						       
    document.getElementById("color").value =  document.getElementById("colorB").value;
    $("#acount").attr('title', $("#acountB").attr("title"));
    
    $("#msgreciber").html("modo edicion usuario conectado.");
}

//filtros beta
function filter(type,parameter)
{
//unselected
	if (type =="user")
	{
    d3.selectAll("g g").classed("unselected",true);		
	d3.selectAll("g g[name='"+parameter+"']").classed("unselected",false);	
	}
	if (type =="remove")
	{
	d3.selectAll("g g").classed("unselected",false);	
	}
	

}


