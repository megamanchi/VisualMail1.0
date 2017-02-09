package com.VisualMail.Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.http.HttpStatus;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;
 
public class UserListVO implements Serializable
{
    private static final long serialVersionUID = 1L;
     
    private List<UserVO> users = new ArrayList<UserVO>();
 
    public List<UserVO> getUsers() {
        return users;
    }
 
    public void setUsers(List<UserVO> users) {
        this.users = users;
    }
    public UserVO findUser(int id){
       	boolean exist=false;
       	UserVO item= null;
       	
       	
       	for(int i=0;i<this.getUsers().size();i++) {
       		
       		 if(this.getUsers().get(i).getId() == id) {
        	        exist=true;
        	    }
        	    if(exist) {
        	    	item = this.getUsers().get(i);
        	     break;
        	    } else {
        	    	item = this.getUsers().get(i);
        	    }
        	    
       	}
       	
       	/*java 8
       	   return users.stream()
       		        .filter(user -> user.getId().equals(id))
       		        .findFirst().get();
       	*/


           return item;
       }
    
    public UserVO validaUser(UserVO user){
       	boolean exist=false;
       	UserVO item= null;
       	
       	
       	for(int i=0;i<this.getUsers().size();i++) {
       		
       		 if(Objects.equals(this.getUsers().get(i).getMail(),user.getMail()) && Objects.equals(this.getUsers().get(i).getPassword(), user.getPassword())) {
       			exist=true ;
        	    }
        	    if(exist) {
        	    	item = this.getUsers().get(i);
        	    	 return item;
        	    }
        	    
       	}
       	
       	/*java 8
       	   return users.stream()
       		        .filter(user -> user.getId().equals(id))
       		        .findFirst().get();
       	*/


           return item;
       }
    
    
    public int findUserIndex(int id){
       	boolean exist=false;
       	UserVO item= null;
       	int i;
       	
       	for(i=0;i<this.getUsers().size();i++) {
       		
       		 if(this.getUsers().get(i).getId() == id) {
        	        exist=true;
        	    }
        	    if(exist) {
        	     break;
        	    } else {
        	    	item = this.getUsers().get(i);
        	    }
        	    
       	}
       	
       	/*java 8
       	   return users.stream()
       		        .filter(user -> user.getId().equals(id))
       		        .findFirst().get();
       	*/


           return i;
       }
    
    

	public UserListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Iterator<UserVO> iterator() {    Iterator it = new IteratorUser();
    return it;         }
	
	
	protected class IteratorUser implements  Iterator<UserVO>   {
		  public int posicion = 0;    public boolean sepuedeeliminar = false;  // Campos
		    @Override
		    public boolean hasNext() {return posicion < users.size();}  // Método
		    @Override
		    public UserVO next() {  // Método
		    	UserVO res = users.get(posicion); // Creamos un objeto Persona igual al que recorremos
		        posicion ++;
		        sepuedeeliminar = true;
		        return res;}
		    @Override
		    public void remove() {
		        if (sepuedeeliminar) {
		        	users.remove(posicion-1);
		            posicion--;
		            sepuedeeliminar = false; }
		    } // Cierre del método remove
    }
	
	
	
	
	
	
  
    


    
}