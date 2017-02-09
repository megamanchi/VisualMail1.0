package com.VisualMail.Model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.access.SingletonBeanFactoryLocator;
import org.springframework.beans.factory.annotation.Autowired;


public class Node implements Serializable {
	private int id;
	private String name;
	private String element;
	private String color;
	private ArrayList<Node> childrens = new ArrayList<Node>();//creamos el objeto lista
	private String mensaje;
	private int group;
	private int parent;
	private boolean nuevo;
	private int nivel;
	private int currentSessionThread;
	private String Fecha;
	private int TiempoDialogo;
	public Date getFechaValue() {
		return FechaValue;
	}
	public void setFechaValue(Date fechaValue) {
		FechaValue = fechaValue;
	}
	private Date FechaValue;
	
	
	public int getTiempoDialogo() {
		return TiempoDialogo;
	}
	public void setTiempoDialogo(int tiempoDialogo) {
		TiempoDialogo = tiempoDialogo;
	}
	public String getFecha() {
		return Fecha;
	}
	public void setFecha(String fecha) {
		Fecha = fecha;
	}
	public UserVO getUserOwner() {
		return userOwner;
	}
	public int getCurrentSessionThread() {
		return currentSessionThread;
	}
	public void setCurrentSessionThread(int currentSessionThread) {
		this.currentSessionThread = currentSessionThread;
	}
	public void setUserOwner(UserVO userOwner) {
		this.userOwner = userOwner;
	}
	private  int dist;
	private int descendants;
	private int session;
	private UserVO userOwner;
	
	
	public int getSession() {
		return session;
	}
	public void setSession(int session) {
		this.session = session;
	}
	public int getdescendants() {
		return descendants;
	}
	public void setdescendants(int decendent) {
		this.descendants = decendent;
	}
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	public int getDist() {
		return dist;
	}
	public void setDist(int dist) {
		this.dist = dist;
	}



	public int getNivel() {
		return nivel;
	}
	public void setNivel(int nivel) {
		this.nivel = nivel;
	}
	public String getMensaje() {
		return mensaje;
	}
	public boolean isNuevo() {
		
		
		if (this.nuevo)
		{
			setNuevo(false);
			return true;
		}
		
		return nuevo;
	}
	public void setNuevo(boolean nuevo) {
		this.nuevo = nuevo;
	}
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	
	
    public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getElement() {
		return element;
	}

	public void setElement(String element) {
		this.element = element;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public ArrayList<Node> getChildren() {
		return childrens;
	}

	public void addChildren(Node node)
	{
		childrens.add(node);
	}
	public void removeChildren(Node node)
	{
		childrens.remove(node);
	}
	
	
/*	public ArrayList<Node> getChildrens() {
		return childrens;
	}*/
	public void setChildrens(ArrayList<Node> childrens) {
		this.childrens = childrens;
	}
	public Node(int id,String name,String element, String color, String mensaje,int parent,int nivel,int dist,int session,UserVO User,int TiempoDialogo) {
		this.id=id;
		this.name= name;
		this.element= element;
		this.color= color;
		this.mensaje =mensaje;
		this.parent =parent;
		this.nuevo= true;
	    this.nivel= nivel;
	    this.dist = dist;
	    this.group =1;
	    this.session=session;
	    this.TiempoDialogo= TiempoDialogo;
	    Date Fecha =new Date();
	    SimpleDateFormat[] sdfs = {
	    		new SimpleDateFormat("dd-MM-yyyy h:mm a"),
	    		new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss"),
	    		new SimpleDateFormat("EEEE dd 'de' MMMM 'de' yyyy h:mm:ss:SSS")};
	    sdfs[1].format(Fecha);
	    
	    this.Fecha=  sdfs[1].format(Fecha);
	    this.FechaValue =Fecha;
	    this.setUserOwner(User);
	} 
	public Node()
	{}
	
}
