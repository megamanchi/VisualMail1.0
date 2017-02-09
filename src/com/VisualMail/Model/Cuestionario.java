package com.VisualMail.Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cuestionario implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private List<Pregunta> cuestionario = new ArrayList<Pregunta>();
	public List<Pregunta> getCuestionario() {
		return cuestionario;
	}
	public void setCuestionario(List<Pregunta> cuestionario) {
		this.cuestionario = cuestionario;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String usuario;
	

}
