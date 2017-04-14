package com.VisualMail.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.VisualMail.Model.Container;
import com.VisualMail.Model.ContainerCuestionarios;
import com.VisualMail.Model.Cuestionario;
import com.VisualMail.Model.Node;
import com.VisualMail.Model.OperativeSystem;
import com.VisualMail.Model.UserListVO;
import com.VisualMail.Model.UserVO;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Semaphore;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import java.util.stream.*;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

 
@RestController
@RequestMapping(value = "/users")
public class userController
{
	static Semaphore mutex = new Semaphore(1);
	@Autowired
  	private Container containerVM;
	@Autowired
  	private ContainerCuestionarios ContainerCuestionarios;
    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody  UserListVO getAllUsers()
    {
    	try{
    		UserListVO users =containerVM.getListUser();
            // llamada a cargar json.
        	
    		if (users.getUsers().size()==0){
    		
        	    ObjectMapper mapper = new ObjectMapper();
    			containerVM.getListUser().getUsers().clear();
    			UserListVO usersjon=null;
    			if (OperativeSystem.isWindows())
    				usersjon= mapper.readValue(new File("visualMailUsers.json"), containerVM.getListUser().getClass());	 
    			  if (OperativeSystem.isUnix())
    				 usersjon= mapper.readValue(new File("/opt/tomcat/visualMailUsers.json"), containerVM.getListUser().getClass());	 
    			  if (OperativeSystem.isMac())
     				 usersjon= mapper.readValue(new File("visualMailUsers.json"), containerVM.getListUser().getClass());	 
    			 containerVM.setListUser(usersjon);
    			 return usersjon;
    		}
    		
    			 return users;
	        }
	        catch (Exception e) { System.out.println("Instrucciones a ejecutar cuando se produce un error");  }
	       finally{  }
    	return null;
    }

    @RequestMapping( method = RequestMethod.POST)
	public UserListVO addUser(@RequestBody UserVO User) {
    	UserListVO users =containerVM.getListUser();
    	int id= users.getUsers().size()+1;
    	User.setId(id);            
    	users.getUsers().add(User);
    	containerVM.saveJsonUser();		
		return users;
	}
    
    @RequestMapping( method = RequestMethod.PUT)
	public UserListVO editUser(@RequestBody UserVO User) {
    	UserListVO users =containerVM.getListUser();
    	int index= users.findUserIndex(User.getId());
    	users.getUsers().set( index, User );    	
     	containerVM.saveJsonUser();		
		return users;
	}
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
   	public UserListVO deleteUser(@PathVariable String id) {
       	UserListVO users =containerVM.getListUser();
       	int idf=Integer.parseInt(id);
       	UserVO oldUSER= users.findUser(idf);
        users.getUsers().remove(oldUSER);
        containerVM.saveJsonUser();		
   		return users;
   	}
    @RequestMapping(value = "/login", method = RequestMethod.POST)
   	public boolean loginUser(@RequestBody UserVO User,HttpSession session) { 
    	session.setAttribute("account", null);
       	UserListVO users =containerVM.getListUser();
       	UserVO validUser= users.validaUser(User);
       	if (!(validUser==null))
       	{       		
       		session.setAttribute("account", validUser);
       		return true;
       	}
       	else
       		return false;
   	}
	@RequestMapping(value = "/Cargar", method = RequestMethod.POST)
	public String Cargar(UserVO user) {
		return "Cargar";
	}
	
	@RequestMapping(value = "/GuardarCuestionario", method = RequestMethod.POST)
	public Cuestionario GuardarCuestionario(@RequestBody Cuestionario Cuestionario) throws JsonGenerationException, JsonMappingException, IOException, InterruptedException {
	       
		String Usuario=Cuestionario.getCuestionario().get(0).getUsuario();
		Cuestionario.setUsuario(Usuario);
		ContainerCuestionarios.mergeCuestionario(Cuestionario);
		
		mutex.acquire();
		ObjectMapper mapper = new ObjectMapper();
		   if (OperativeSystem.isWindows())
			   mapper.writeValue(new File("Cuestionarios.json"), ContainerCuestionarios);
		   if (OperativeSystem.isUnix())
			    mapper.writeValue(new File("/opt/tomcat/Cuestionarios.json"), ContainerCuestionarios);
		   if (OperativeSystem.isMac())
			   mapper.writeValue(new File("Cuestionarios.json"), ContainerCuestionarios);
		   mutex.release();
		   
		return Cuestionario;
	}
	@RequestMapping(value = "/DataCuestionarios", method = RequestMethod.GET)
	public ContainerCuestionarios GetCuestionarios() {
		return ContainerCuestionarios;
	}
	@RequestMapping(value = "/ResetCuestionarios", method = RequestMethod.POST)
	public ContainerCuestionarios ResetCustionarios() {
		ContainerCuestionarios.setCuestionarios(null);
		return ContainerCuestionarios;
	}
	@RequestMapping(value = "/DataCuestionarioUsuario", method = RequestMethod.POST)
	public Cuestionario GetCuestionarios(@RequestBody String usuario) throws JsonParseException, JsonMappingException, IOException {
	    Cuestionario cuestionarioVacio = new Cuestionario();
		try{

		if (ContainerCuestionarios.getCuestionarios().size()==0)
			{
			ObjectMapper mapper = new ObjectMapper();
			if (OperativeSystem.isWindows())
				ContainerCuestionarios= mapper.readValue(new File("Cuestionarios.json"), ContainerCuestionarios.class );
			if (OperativeSystem.isUnix())
				ContainerCuestionarios= mapper.readValue(new File("/opt/tomcat/Cuestionarios.json"), ContainerCuestionarios.class );
			if (OperativeSystem.isMac())
				ContainerCuestionarios= mapper.readValue(new File("Cuestionarios.json"), ContainerCuestionarios.class );
			}
		
	     for (Cuestionario cuestionario: ContainerCuestionarios.getCuestionarios()) {
	    	 if(cuestionario.usuario.equals(usuario))
	    		 return cuestionario;
	     }
		
		}
    	catch (Exception e) {	
	     return cuestionarioVacio;
    	}
		return cuestionarioVacio;
	}
    
    
    
}