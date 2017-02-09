package com.VisualMail.Model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.codehaus.jackson.map.DeserializationConfig;
import org.springframework.web.context.WebApplicationContext;

@Service
@Scope(WebApplicationContext.SCOPE_REQUEST)
public class ContainerCuestionarios {

	private List<Cuestionario> Cuestionarios = new ArrayList<Cuestionario>();
	public List<Cuestionario> getCuestionarios() {
		return Cuestionarios;
	}

	public void setCuestionarios(List<Cuestionario> cuestionarios) {
		Cuestionarios = cuestionarios;
	}
	public void mergeCuestionario(Cuestionario cuestionario)
	{
		if (Cuestionarios==null)
			Cuestionarios = new ArrayList<Cuestionario>();
		Cuestionario CuestionarioAntiguo=findCuestionario(cuestionario.getUsuario());
		if (findCuestionario(cuestionario.getUsuario())==null)
				Cuestionarios.add(cuestionario);
		else
			CuestionarioAntiguo.setCuestionario(cuestionario.getCuestionario());
	}
    Cuestionario findCuestionario(String User) {
	    for(Cuestionario cuestionario : Cuestionarios) {
	        if(cuestionario.getUsuario().equals(User)) {
	            return cuestionario;
	        }
	    }
	    return null;
	}
	
	
	/*
	public String saveJsonUser() 
	{
		   try{
			   ObjectMapper mapper = new ObjectMapper();	
			  
			   if (OperativeSystem.isWindows())
			   mapper.writeValue(new File("visualMailUsers.json"), this.getListUser());
			   if (OperativeSystem.isUnix())
			   mapper.writeValue(new File("/opt/tomcat/visualMailUsers.json"), this.getListUser());
			   return "OK";
	        }
	        catch (Exception e) {         	
	        	    return(e.getMessage()+ e.toString());
	        	    }
	       finally{ System.out.println("Instrucciones a ejecutar finalmente tanto si se producen errores como si no."); }
		
		
	}
	public void loadJsonUser() 
	{
		   try{
			   ObjectMapper mapper = new ObjectMapper();
			    this.getListUser().getUsers().clear();	
			    //
			  //  Root= mapper.readValue(new File("visualMailUsers.json"), Node.class );			    
			  //  containerVM.CountNodes(Root);
	        }
	        catch (Exception e) { System.out.println("Instrucciones a ejecutar cuando se produce un error");  }
	       finally{ System.out.println("Instrucciones a ejecutar finalmente tanto si se producen errores como si no."); }
		
		
	}
*/	
	
	
}



