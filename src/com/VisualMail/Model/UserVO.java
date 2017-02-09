package com.VisualMail.Model;
import java.util.ArrayList;
import java.util.List;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


public class UserVO {
	private int id;
	private String fullName;
	private String userName;
	private String mail;
	private String urlIcon;
	private Boolean Admin;
	private String Password;
	private String colorInteraction;	
	public String getColorInteraction() {
		return colorInteraction;
	}
	public void setColorInteraction(String colorInteraction) {
		this.colorInteraction = colorInteraction;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getUrlIcon() {
		return urlIcon;
	}
	public void setUrlIcon(String urlIcon) {
		this.urlIcon = urlIcon;
	}
	public Boolean getAdmin() {
		return Admin;
	}
	public void setAdmin(Boolean admin) {
		Admin = admin;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public UserVO(int id,String fullName, String userName, String mail, String urlIcon, Boolean admin,String password,String colorInteraction) {
		super();
		this.id=id;
		this.fullName = fullName;
		this.userName = userName;
		this.mail = mail;
		this.urlIcon = urlIcon;
		this.Password=password;
		this.colorInteraction=colorInteraction;
		Admin = admin;
	}
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
		
}
