package com.VisualMail.Controller;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.VisualMail.Model.UserVO;

@Controller
public class dialogoController {

		@RequestMapping(value = "/Cargar", method = RequestMethod.GET)		
		public String Cargar(ModelMap model,HttpSession session) {
			UserVO userActive;
			if (session.getAttribute("account")==null)
				return "Login";
				
					
			userActive= (UserVO)session.getAttribute("account");
			model.addAttribute("user",userActive);
			return "Cargar";
		}
		@RequestMapping(value = "/Cuestionarios", method = RequestMethod.GET)
		public String Cuestionarios(ModelMap model,HttpSession session) {
			UserVO userActive;
			if (session.getAttribute("account")==null)
				return "Login";
				
					
			userActive= (UserVO)session.getAttribute("account");
			model.addAttribute("user",userActive);
			return "Cuestionarios";
		}
		
		
		@RequestMapping(value = "/ListaUsers", method = RequestMethod.GET)
		public String ListaUsers(ModelMap model) {
			model.addAttribute("msg", "JCG Hello World!");
			return "ListaUsers";
		}
		
		@RequestMapping(value = "/displayMessage/{msg}", method = RequestMethod.GET)
		public String displayMessage(@PathVariable String msg, ModelMap model) {
			model.addAttribute("msg", msg);
			return "helloWorld";
		}
		
		@RequestMapping(value = "/Login", method = RequestMethod.GET)
		public String Login(ModelMap model,HttpSession session) {
		  	session.setAttribute("account", null);
			return "Login";
		}
		
		
		
	}
