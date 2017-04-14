package com.VisualMail.Controller;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.concurrent.*;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.access.SingletonBeanFactoryLocator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.VisualMail.Model.Container;
import com.VisualMail.Model.MensajeVO;
import com.VisualMail.Model.Node;
import com.VisualMail.Model.OperativeSystem;
import com.VisualMail.Model.UserVO;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;


@Controller
@RequestMapping("/data")
public class dataController {
		static Semaphore mutex = new Semaphore(1);
		@Autowired
	  	private Container containerVM;
		int sessionVM=0;
		Node Root;
		UserVO userActive;
		@RequestMapping(value = "/init", method = RequestMethod.POST, headers = {"Content-type=application/json"})
		public @ResponseBody Node CargarInJSON(HttpSession session) {
			
			userActive= (UserVO)session.getAttribute("account");
			if (containerVM.getTreads().size()>0)
			{				
				// session;
			Root=containerVM.getTreads().get(0);
			sessionVM=containerVM.getCountSessions();
			return Root;
			}			
			
			sessionVM=0;
			return Root;
		}
		@RequestMapping(method = RequestMethod.GET)
		public @ResponseBody Node CargarInJSONGET(HttpSession session) {
			return Root;
		}
		
		
		@SuppressWarnings("finally")
		@RequestMapping(value = "/send", method = RequestMethod.POST, headers = {"Content-type=application/json"})
		public @ResponseBody Node sendNodeJSON(@RequestBody MensajeVO Mensaje) throws JsonGenerationException, JsonMappingException, IOException
		{
			try {
				    int parent =Mensaje.getParent();
				    int iduser =Mensaje.getIduser();
					String color = Mensaje.getColor();
					String name= Mensaje.getName();
					String element=Mensaje.getElement();
					String mensaje =Mensaje.getMensaje();
				    //se setean propidades de container vm que son seccion critica.
					mutex.acquire();
					  
				    color = "#" + color;
					if (containerVM.getTreads().size() > 0) {
						if (sessionVM == 0) {
							containerVM.setCountSessions(containerVM.getCountSessions() + 1);
							sessionVM = containerVM.getCountSessions();
						} else {
							sessionVM = containerVM.getCountSessions();
							int sessionNodeR=containerVM.getNodeR(parent, Root).getSession();							
							if ((sessionNodeR == sessionVM)) {
								containerVM.setCountSessions(containerVM.getCountSessions() + 1);
							} else {
								//analizar get noder
								if ((sessionVM - sessionNodeR) >= 1) {
									if  (! new String(containerVM.getNodeR(containerVM.getCountNodes(), Root).getName()).equals(name))  {
										containerVM.setCountSessions(containerVM.getCountSessions() + 1);
									}else
									{
										
									}

								}
							}

							sessionVM = containerVM.getCountSessions();
							// session++;

						}
								  
						  containerVM.setCountNodes(containerVM.getCountNodes()+1);
						  int nivel=containerVM.getNodeR(parent,Root).getNivel()+1;
						  UserVO userOwner= containerVM.getListUser().findUser(iduser);
						  Date now = new Date();
						  long diff =now.getTime() - Root.getFechaValue().getTime();//as given
						  int minutes = (int)  TimeUnit.MILLISECONDS.toMinutes(diff); 
						  Node nodoNuevo = new Node(containerVM.getCountNodes(),name,element,color,mensaje,parent,nivel,10,sessionVM,userOwner,minutes);			  
						  containerVM.getNodeR(parent,Root).addChildren(nodoNuevo);	
						  containerVM.addChildren(Root);				  
						}else
						{				
							 
							 //revisar
							  UserVO userOwner= containerVM.getListUser().findUser(iduser);
							  Node node = new Node(1,name,element,color,mensaje,parent,1,10,0,userOwner,0);
							  Root=node;
							  containerVM.setCountNodes(1);
							  containerVM.addChildren(Root);
						    //  ObjectMapper mapper = new ObjectMapper();
							 // mapper.writeValue(new File("visualMailLog.json"), Root);
							  
							  
						}			
							
						  return Root;
				} catch (Exception e) {
				   //exception stuff
				} finally {					
					mutex.release();
					return Root;
				}
		
		
	

		}
		@RequestMapping("/recv")
		public @ResponseBody Node recvNodeJSON() throws JsonGenerationException, JsonMappingException, IOException
		{
			  
			  if (containerVM.getTreads().size()>0)
			  Root=containerVM.getTreads().get(0);
			  return Root;

		}
		@RequestMapping("/saveconf")
		public @ResponseBody Node saveConfJSON() throws JsonGenerationException, JsonMappingException, IOException
		{
			
				Root=containerVM.getTreads().get(0);
			    ObjectMapper mapper = new ObjectMapper();
			    Root.setCurrentSessionThread(sessionVM+1);
			    
				   if (OperativeSystem.isWindows())
					   mapper.writeValue(new File("visualMailLog.json"), Root);
				   if (OperativeSystem.isUnix())
					    mapper.writeValue(new File("/opt/tomcat/visualMailLog.json"), Root);
				   if (OperativeSystem.isMac())
					   mapper.writeValue(new File("visualMailLog.json"), Root);
				   				
			    return Root;

		}
		@RequestMapping("/loadconf")
		public @ResponseBody Node loadConfJSON() throws JsonGenerationException, JsonMappingException, IOException
		{
			    ObjectMapper mapper = new ObjectMapper();
				containerVM.getTreads().clear();
				containerVM.setCountNodes(0);
				containerVM.setCountSessions(0);
				if (OperativeSystem.isWindows())
					Root= mapper.readValue(new File("visualMailLog.json"), Node.class );
				if (OperativeSystem.isUnix())
					Root= mapper.readValue(new File("/opt/tomcat/visualMailLog.json"), Node.class );
				if (OperativeSystem.isMac())
					Root= mapper.readValue(new File("visualMailLog.json"), Node.class );
			    containerVM.CountNodesV2(Root);
			    containerVM.setCountNodes(Root.getdescendants());			  
			    containerVM.addChildren(Root);
			    containerVM.setCountSessions(Root.getCurrentSessionThread()-1);  
				sessionVM=Root.getCurrentSessionThread();
				
			    return Root;

		}
		@RequestMapping("/clear")
		public @ResponseBody Node clearNodeJSON() throws JsonGenerationException, JsonMappingException, IOException
		{
			containerVM.setCountSessions(0);
			containerVM.getTreads().clear();
			Root =null;
			return Root;

		}
		
		
		
		
	
		
		
	}