<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html  lang="en"   style=" overflow-y: hidden;" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
                


<style>
p{
font-size: 1.5rem;
}
.tabsdemoDynamicHeight md-content {
  background-color: transparent !important; }
  .tabsdemoDynamicHeight md-content md-tabs {
    background: #f6f6f6;
    border: 1px solid #e1e1e1; }
    .tabsdemoDynamicHeight md-content md-tabs md-tabs-wrapper {
      background: white; }
  .tabsdemoDynamicHeight md-content h1:first-child {
    margin-top: 0; }
</style>
<script>
angular.module('MyApp',['ngMaterial', 'ngMessages', 'material.svgAssetsCache'])



.controller('AppCtrl', function($scope,$http,$mdDialog,$q) {
	 var self=this;
	 $scope.Cuestionarios = function(ev) {
		 //plantilla 1 empieza con vm 2 con ds
		 var plantilla =2;
		 var seccionPlantilla1=[{seccion:'1',tab:'Cuestionario SAM inicial'},
				                   {seccion:'2',tab:'Inicio SAGAT Con Visual Mail',app:'VisualMail'},
				                   {seccion:'3',tab:'SAGAT 1/3 Visual Mail',app:'VisualMail'},
				                   {seccion:'4',tab:'Cambio a Discource',app:'Discource'},		                   
				                   {seccion:'5',tab:'SAGAT 1/3 Discource',app:'Discource'},		                   
				                   {seccion:'6',tab:'Cambio a Visual Mail',app:'VisualMail'},
				                   {seccion:'7',tab:'SAGAT 2/3 Visual Mail',app:'VisualMail'},
				                   {seccion:'8',tab:'Cambio a Discource',app:'Discource'},	
				                   {seccion:'9',tab:'SAGAT 2/3 Discource',app:'Discource'},
				                   {seccion:'10',tab:'Cambio a Visual Mail',app:'VisualMail'},
				                   {seccion:'11',tab:'SAGAT 3/3 Visual Mail',app:'VisualMail'},
				                   {seccion:'12',tab:'Continuar usando Visual Mail',app:'VisualMail'},
				                   {seccion:'13',tab:'Cuestionario SAM final Visual Mail',app:'VisualMail'},
				                   {seccion:'14',tab:'Cambio a Discource',app:'Discource'},
				                   {seccion:'15',tab:'SAGAT 3/3 Discource',app:'Discource'},
				                   {seccion:'16',tab:'Continuar usando Discource',app:'Discource'},
				                   {seccion:'17',tab:'Cuestionario SAM final Discource',app:'Discource'},
				                   {seccion:'18',tab:'Finalizar Toma Muestral'}];
		 var seccionPlantilla2=[{seccion:'1',tab:'Cuestionario SAM inicial'},
				                   {seccion:'2',tab:'Inicio SAGAT Con Discource',app:'Discource'},
				                   {seccion:'3',tab:'SAGAT 1/3 Discource',app:'Discource'},
				                   {seccion:'4',tab:'Cambio a Visual Mail',app:'VisualMail'},		                   
				                   {seccion:'5',tab:'SAGAT 1/3 Visual Mail',app:'VisualMail'},		                   
				                   {seccion:'6',tab:'Cambio a Discource',app:'Discource'},
				                   {seccion:'7',tab:'SAGAT 2/3 Discource',app:'Discource'},
				                   {seccion:'8',tab:'Cambio a Visual Mail',app:'VisualMail'},	
				                   {seccion:'9',tab:'SAGAT 2/3 Visual Mail',app:'VisualMail'},
				                   {seccion:'10',tab:'Cambio a Discource',app:'Discource'},
				                   {seccion:'11',tab:'SAGAT 3/3 Discource',app:'Discource'},
				                   {seccion:'12',tab:'Continuar usando Discource',app:'Discource'},
				                   {seccion:'13',tab:'Cuestionario SAM final Discource',app:'Discource'},
				                   {seccion:'14',tab:'Cambio a  Visual Mail',app:'VisualMail'},
				                   {seccion:'15',tab:'SAGAT 3/3  Visual Mail',app:'VisualMail'},
				                   {seccion:'16',tab:'Continuar usando  Visual Mail',app:'VisualMail'},
				                   {seccion:'17',tab:'Cuestionario SAM final  Visual Mail',app:'VisualMail'},
				                   {seccion:'18',tab:'Finalizar Toma Muestral'}]
		 
		 
		 var promise = getCuestionario();
		 
		 promise.then(function() {
			  $scope.data = {
		    	      selectedIndex: 0,
		    	      secondLocked:  true,
		    	      secondLabel:   "Item Two",
		    	      bottom:        false
		    	    };
	
		 
		 if  ($scope.cuestionario=='')
		 {
		 if (plantilla==1)
		{
		 
			 $scope.secciones= seccionPlantilla1;
			 
		 $scope.cuestionario=[{pregunta:'1',glosa:'¿Cuántos usuarios intervinieron incluyendo al moderador?',tipo:'T1VM',respuesta:'',usuario: $('#user').html()},
		                           {pregunta:'2',glosa:'¿Cuánto tiempo aprox lleva el diálogo?',tipo:'T1VM',respuesta:'' },
		                           {pregunta:'3',glosa:'¿Cuál fue su última interacción?',tipo:'T1VM',respuesta:''},
		                           {pregunta:'4',glosa:'¿Cuál fue su primera postura respecto al tema?',tipo:'T1VM',respuesta:''},
		                           {pregunta:'5',glosa:'¿Cuántas veces interactuó usted?',tipo:'T1VM',respuesta:'' },
		                           
		                           {pregunta:'6',glosa:'¿Cuál es el usuario que menos ha intervenido en el tema?',tipo:'T1DS'},
		                           {pregunta:'7',glosa:'¿Identifique el usuario que más intervino?',tipo:'T1DS' },
		                           {pregunta:'8',glosa:'¿Cuántas veces interactuó usted?',tipo:'T1DS'},
		                           {pregunta:'9',glosa:'¿Cuántos usuarios intervinieron incluyendo al moderador?',tipo:'T1DS'},
		                           {pregunta:'10',glosa:'¿Cuál postura va perdiendo según lo visto en el diálogo?',tipo:'T1DS' },
		                           
		                           {pregunta:'11',glosa:'¿Cuántas interacciones lleva aproximadamente el diálogo?',tipo:'T2VM'},		                           
		                           {pregunta:'12',glosa:'¿Con que usuario interactuó en su primera interacción?',tipo:'T2VM' },
		                           //termina level 1 para VM empieza level 2
		                           {pregunta:'13',glosa:'¿Mencione 2 usuarios y con qué opción estuvieron de acuerdo cada uno?',tipo:'T2VM'},
		                           {pregunta:'14',glosa:'¿Nombre 3 usuarios y cuantas veces intervino cada uno?',tipo:'T2VM'},
		                           {pregunta:'15',glosa:'¿Hay más acuerdo o desacuerdo respecto al tema justifique?',tipo:'T2VM' },
		                           
		                           {pregunta:'16',glosa:'¿Cuántas interacciones lleva aproximadamente el diálogo?',tipo:'T2DS'},
		                           {pregunta:'17',glosa:'¿Con que usuario interactuó en su primera interacción?',tipo:'T2DS' },
		                           //termina level 1 para DS empieza level 2
		                           {pregunta:'18',glosa:'¿Respecto a qué tema fue el primer acuerdo?',tipo:'T2DS'},
		                           {pregunta:'19',glosa:'¿Cuál o cuáles fueron los usuarios que más interactuaron?',tipo:'T2DS'},
		                           {pregunta:'20',glosa:'¿Cuántas y cuáles fueron las posturas dadas en el diálogo respecto a la pregunta?',tipo:'T2DS' },
		                           
		                           {pregunta:'21',glosa:'Describa su línea argumental a lo largo del diálogo con el mayor detalle posible.',tipo:'T3VM'},
		                           {pregunta:'22',glosa:'¿Cuál es la postura que está ganando y por qué?',tipo:'T3VM' },
		                           //fin  VM L2 empieza level 3
		                           {pregunta:'23',glosa:'¿Según lo expuesto en la discusión que postura ganará y por qué?',tipo:'T3VM'},
		                           {pregunta:'24',glosa:'Escoja un participante (distinto a Ud.). Describa la línea argumental de éste a lo largo del diálogo y explique las que cree Ud. serán las próximas interacciones de este participante.',tipo:'T3VM'},
		                           {pregunta:'25',glosa:'Resuma el diálogo hasta el momento y describa en qué dirección cree usted que irán las siguientes interacciones.',tipo:'T3VM' },
		                           
		                           {pregunta:'26',glosa:'Describa su línea argumental a lo largo del diálogo con el mayor detalle posible.',tipo:'T3DS'},
		                           {pregunta:'27',glosa:'¿Qué postura va ganando y con qué porcentaje aproximado?',tipo:'T3DS' },
		                           //fin DS L2 empieza level 3
		                           {pregunta:'28',glosa:'¿Según lo expuesto en la discusión que postura perderá y por qué?',tipo:'T3DS'},
		                           {pregunta:'29',glosa:'Escoja un participante (distinto a Ud.). Describa la línea argumental de éste a lo largo del diálogo y explique las que cree Ud. serán las próximas interacciones de este participante.',tipo:'T3DS'},
		                           {pregunta:'30',glosa:'Resuma el diálogo hasta el momento y describa en qué dirección cree usted que irán las siguientes interacciones.',tipo:'T3DS' },
		                           //SAM INICIAL
		                           {pregunta:'31',glosa:'Feliz---------------------------------------------Triste',tipo:'SAMI',imagen:'resources/css/FelizTriste.PNG' },
		                           {pregunta:'32',glosa:'Excitado-------------------------------------Calmado',tipo:'SAMI',imagen:'resources/css/ExitadoCalmado.PNG' },
		                           {pregunta:'32',glosa:'Controlado-------------------------------En Control',tipo:'SAMI',imagen:'resources/css/ControlaenControl.PNG'},
		                           //SAM FINAL VM
		                           {pregunta:'33',glosa:'Feliz---------------------------------------------Triste',tipo:'SAMFVM',imagen:'resources/css/FelizTriste.PNG' },
			                       {pregunta:'34',glosa:'Excitado-------------------------------------Calmado',tipo:'SAMFVM',imagen:'resources/css/ExitadoCalmado.PNG' },
			                       {pregunta:'35',glosa:'Controlado-------------------------------En Control',tipo:'SAMFVM',imagen:'resources/css/ControlaenControl.PNG'},
			                       //SAM FINAL DS
			                       {pregunta:'36',glosa:'Feliz---------------------------------------------Triste',tipo:'SAMFDS',imagen:'resources/css/FelizTriste.PNG' },
				                   {pregunta:'37',glosa:'Excitado-------------------------------------Calmado',tipo:'SAMFDS',imagen:'resources/css/ExitadoCalmado.PNG' },
				                   {pregunta:'38',glosa:'Controlado-------------------------------En Control',tipo:'SAMFDS',imagen:'resources/css/ControlaenControl.PNG'}
		                           ];
		}		 
		 else 
			 {
				 $scope.secciones= seccionPlantilla2;
			 
		 $scope.cuestionario=[{pregunta:'1',glosa:'Identifique con que usuario interactuó en su ultima interacción.',tipo:'T1DS',respuesta:'',usuario: $('#user').html()},
	                           {pregunta:'2',glosa:'¿Cuánto tiempo aprox lleva el diálogo?',tipo:'T1DS',respuesta:'' },
	                           {pregunta:'3',glosa:'¿Cuál fue su última interacción?',tipo:'T1DS',respuesta:''},
	                           {pregunta:'4',glosa:'¿Cuál fue su primera postura respecto al tema?',tipo:'T1DS',respuesta:''},
	                           {pregunta:'5',glosa:'¿Cuántas veces interactuó usted?',tipo:'T1DS',respuesta:'' },
	                           
	                           {pregunta:'6',glosa:'¿Cuál es el usuario que menos ha intervenido en el tema?',tipo:'T1VM'},
	                           {pregunta:'7',glosa:'¿Identifique el usuario que más intervino?',tipo:'T1VM' },
	                           {pregunta:'8',glosa:'¿Cuántas veces interactuó usted?',tipo:'T1VM'},
	                           {pregunta:'9',glosa:'Identifique con que usuario interactuó en su ultima interacción.',tipo:'T1VM'},
	                           {pregunta:'10',glosa:'¿Cuál postura va perdiendo según lo visto en el diálogo?',tipo:'T1VM' },
	                           
	                           {pregunta:'11',glosa:'¿Cuántas interacciones lleva aproximadamente el diálogo?',tipo:'T2DS'},		                           
	                           {pregunta:'12',glosa:'¿Con que usuario interactuó en su primera interacción?',tipo:'T2DS' },
	                           //termina level 1 para VM empieza level 2
	                           {pregunta:'13',glosa:'¿Mencione 2 usuarios y con qué opción estuvieron de acuerdo cada uno?',tipo:'T2DS'},
	                           {pregunta:'14',glosa:'¿Nombre 3 usuarios y cuantas veces intervino cada uno?',tipo:'T2DS'},
	                           {pregunta:'15',glosa:'Identifique con que usuario interactuó en su última interacción y sobre que tema.',tipo:'T2DS' },
	                           
	                           {pregunta:'16',glosa:'¿Cuántas interacciones lleva aproximadamente el diálogo?',tipo:'T2VM'},
	                           {pregunta:'17',glosa:'¿Con que usuario interactuó en su primera interacción?',tipo:'T2VM' },
	                           //termina level 1 para DS empieza level 2
	                           {pregunta:'18',glosa:'¿Respecto a qué tema fue el primer acuerdo?',tipo:'T2VM'},
	                           {pregunta:'19',glosa:'¿Cuál o cuáles fueron los usuarios que más interactuaron?',tipo:'T2VM'},
	                           {pregunta:'20',glosa:'¿Cuántas y cuáles fueron las posturas dadas en el diálogo respecto a la pregunta?',tipo:'T2VM' },
	                           
	                           {pregunta:'21',glosa:'Describa su línea argumental a lo largo del diálogo con el mayor detalle posible.',tipo:'T3DS'},
	                           {pregunta:'22',glosa:'¿Cuál es la postura que está ganando y por qué?',tipo:'T3DS' },
	                           //fin  VM L2 empieza level 3
	                           {pregunta:'23',glosa:'¿Según lo expuesto en la discusión que postura ganará y por qué?',tipo:'T3DS'},
	                           {pregunta:'24',glosa:'Escoja un participante (distinto a Ud.). Describa la línea argumental de éste a lo largo del diálogo y explique las que cree Ud. serán las próximas interacciones de este participante.',tipo:'T3DS'},
	                           {pregunta:'25',glosa:'Resuma el diálogo hasta el momento y describa en qué dirección cree usted que irán las siguientes interacciones.',tipo:'T3DS' },
	                           
	                           {pregunta:'26',glosa:'Describa su línea argumental a lo largo del diálogo con el mayor detalle posible.',tipo:'T3VM'},
	                           {pregunta:'27',glosa:'Identifique con que usuario interactuó en su última interacción y sobre que tema.',tipo:'T3VM' },
	                           //fin DS L2 empieza level 3
	                           {pregunta:'28',glosa:'¿Según lo expuesto en la discusión que postura perderá y por qué?',tipo:'T3VM'},
	                           {pregunta:'29',glosa:'Escoja un participante (distinto a Ud.). Describa la línea argumental de éste a lo largo del diálogo y explique las que cree Ud. serán las próximas interacciones de este participante.',tipo:'T3VM'},
	                           {pregunta:'30',glosa:'Resuma el diálogo hasta el momento y describa en qué dirección cree usted que irán las siguientes interacciones.',tipo:'T3VM' },
	                           //SAM INICIAL
	                           {pregunta:'31',glosa:'Feliz---------------------------------------------Triste',tipo:'SAMI',imagen:'resources/css/FelizTriste.PNG' },
	                           {pregunta:'32',glosa:'Excitado-------------------------------------Calmado',tipo:'SAMI',imagen:'resources/css/ExitadoCalmado.PNG' },
	                           {pregunta:'32',glosa:'Controlado-------------------------------En Control',tipo:'SAMI',imagen:'resources/css/ControlaenControl.PNG'},
	                           //SAM FINAL VM
	                           {pregunta:'33',glosa:'Feliz---------------------------------------------Triste',tipo:'SAMFVM',imagen:'resources/css/FelizTriste.PNG' },
		                       {pregunta:'34',glosa:'Excitado-------------------------------------Calmado',tipo:'SAMFVM',imagen:'resources/css/ExitadoCalmado.PNG' },
		                       {pregunta:'35',glosa:'Controlado-------------------------------En Control',tipo:'SAMFVM',imagen:'resources/css/ControlaenControl.PNG'},
		                       //SAM FINAL DS
		                       {pregunta:'36',glosa:'Feliz---------------------------------------------Triste',tipo:'SAMFDS',imagen:'resources/css/FelizTriste.PNG' },
			                   {pregunta:'37',glosa:'Excitado-------------------------------------Calmado',tipo:'SAMFDS',imagen:'resources/css/ExitadoCalmado.PNG' },
			                   {pregunta:'38',glosa:'Controlado-------------------------------En Control',tipo:'SAMFDS',imagen:'resources/css/ControlaenControl.PNG'}
	                           ];
			 }		 
		 }else
			{
			 if ($scope.cuestionario[0].tipo=='T1DS'){
				 $scope.secciones=seccionPlantilla2;
			 }else
				 {
				 $scope.secciones=seccionPlantilla1;
				 }
			 
			}
		 
			 
			 
		 }, function(error) {
		   $scope.mensajeMultipleArray ="Se ha producido un error en alguna de las multiples promesas:"+error;
		 });
		 
		 
		  
			
	 };
	 function getCuestionario() {
	        var defered = $q.defer();
	        //var promise = defered.promise;

	        var promise= $http.post('/VisualMail1.0/users/DataCuestionarioUsuario', $('#user').html()
	 			).success(function(data) {
	 				if (data=='')
	 					 $scope.cuestionario='';
	 				 else
	 				 $scope.cuestionario= data.cuestionario;
	 			}).error(function(data) {
	 				 return promise;
	 			});

	        return promise;
	    } 
    $scope.siguiente = function(ev) {
    	$scope.data.selectedIndex++;
    };
	$scope.volver = function(ev) {
		window.location.href = "/VisualMail1.0/Login";	
	  };
	$scope.VM1 = function(ev) {
		GuardaActualizaCuestionario();
	  };
	$scope.DS1 = function(ev) {
		GuardaActualizaCuestionario();	
	 };
	 $scope.VM2 = function(ev) {
			GuardaActualizaCuestionario();
		  };
	$scope.DS2 = function(ev) {
			GuardaActualizaCuestionario();	
	};
	$scope.VM3 = function(ev) {
			GuardaActualizaCuestionario();
		  };
	$scope.DS3 = function(ev) {
			GuardaActualizaCuestionario();	
	};
  	function GuardaActualizaCuestionario()
  	  {
  		 $http.post('/VisualMail1.0/users/GuardarCuestionario', 
 				{
		    	     cuestionario:$scope.cuestionario
 				}
 			).success(function(data) {
 				$scope.data.selectedIndex++;
 				showAlert('Se han guardado sus respuestas presione OK para continuar');
 			}).error(function(data) {
 				showAlert('Ha ocurrido en error favor informar al moderador');
 			});
  	  }
      function showAlert(mensaje,ev) {
        // Appending dialog to document.body to cover sidenav in docs app
        // Modal dialogs should fully cover application
        // to prevent interaction outside of dialog
        $mdDialog.show(
          $mdDialog.alert()
            .parent(angular.element(document.querySelector('#cuestionario')))
            .clickOutsideToClose(true)
            .title('Mensaje')
            .textContent(mensaje)
            .ok('OK')
            .targetEvent(ev)
        );
      };

  	
  	

});


</script>
<body layout-fill  style="overflow: scroll;" >
  <%@page pageEncoding="UTF-8"%>
<div id="cuestionario" ng-cloak="" ng-controller="AppCtrl" class="tabsdemoDynamicHeight" ng-app="MyApp" ng-init="Cuestionarios()"> 
  <md-toolbar class="md-theme-light" style="background-color: #D4D4D4;">
    <h2 class="md-toolbar-tools">
      <span>Toma de Muestra SAGAT y SAM:</span>
      <span id="user" flex>${user.fullName}</span>
        <md-button ng-click="volver()">
        Volver a Login
      </md-button>
      
    </h2>
  </md-toolbar>
  <md-content>
    <md-tabs  md-selected="data.selectedIndex" md-dynamic-height="" md-border-bottom=""> 
       <md-tab  label={{secciones[0].tab}}>
       <form name="Form0">
        <md-content class="md-padding">
         <div flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'SAMI'}">
          <p class="md-title"  ng-model="pregunta.pregunta" >{{pregunta.glosa}}</p>
            <input type="hidden" name="country" ng-model="pregunta.imagen" value={{pregunta.imagen}}>
           <img ng-href="{{pregunta.imagen}}" src={{pregunta.imagen}} height="120" width="400">
          <md-radio-group ng-model="pregunta.respuesta" layout="row" required>
		  <md-radio-button value=0 class="md-primary"></md-radio-button>
  		  <md-radio-button value=1 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=2 class="md-primary"></md-radio-button>
  		  <md-radio-button value=3 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=4 class="md-primary"></md-radio-button>
  		  <md-radio-button value=5  class="md-primary"></md-radio-button>
  		    <md-radio-button value=6 class="md-primary"></md-radio-button>
  		  <md-radio-button value=7 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=8 class="md-primary">  </md-radio-button>
		</md-radio-group>

	    </div>
        </md-content>
        <div layout="row" layout-align="center center">
 		<md-button  class="md-raised md-primary" ng-click="VM1()" ng-disabled="Form0.$invalid" >Enviar</md-button>
		</div> 
		</form>        
      </md-tab>       
       <md-tab  label={{secciones[1].tab}}>
       <md-content class="md-padding">
         <div class="md-display-1">1)Aqui se inicia el Cuestionario SAGAT.
		</div> 
		
        <div ng-if="secciones[1].app=='VisualMail'" class="md-display-1">2)Favor comenzar a usar Visual Mail cuando se le indique.
		</div>		 
		 <div ng-if="secciones[1].app=='VisualMail'" class="md-display-1">3)Solo si el moderador le señaló que deje de usar Visual Mail, presione siguiente y conteste el cuestionario.
		</div>
		
		 <div ng-if="secciones[1].app=='Discource'" class="md-display-1">2)Favor comenzar a usar Discource cuando se le indique.
		</div>		 
		 <div ng-if="secciones[1].app=='Discource'"  class="md-display-1">3)Solo si el moderador le señaló que deje de usar Discource, presione siguiente y conteste el cuestionario.
		</div>     
		       
		</md-content>
		  <div layout="row" layout-align="center center"> 
		<md-button  class="md-raised md-primary" ng-click="siguiente()">Siguiente</md-button>  
		</div> 
      </md-tab>      
       <md-tab  label={{secciones[2].tab}}>
        <form name="Form1">
        <md-content class="md-padding">
         <div ng-if="secciones[2].app=='VisualMail'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T1VM'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
	     <div ng-if="secciones[2].app=='Discource'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T1DS'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
        </md-content>
        <div layout="row" layout-align="center center">
 		<md-button  class="md-raised md-primary" ng-click="VM1()" ng-disabled="Form1.$invalid" >Enviar</md-button>
		</div> 
		</form>        
      </md-tab>
      <md-tab  label={{secciones[3].tab}}>
       <md-content class="md-padding">
       
        <div ng-if="secciones[3].app=='VisualMail'" class="md-display-1">1)Favor comenzar a usar VisualMail cuando se le indique.
		</div> 
		 <div ng-if="secciones[3].app=='VisualMail'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar VisualMail, presione siguiente y conteste el cuestionario.
		</div>
		
		 <div ng-if="secciones[3].app=='Discource'" class="md-display-1">1)Favor comenzar a usar Discource cuando se le indique.
		</div> 
		 <div ng-if="secciones[3].app=='Discource'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar Discource, presione siguiente y conteste el cuestionario.
		</div>       
		       
		</md-content>
		  <div layout="row" layout-align="center center"> 
		<md-button  class="md-raised md-primary" ng-click="siguiente()">Siguiente</md-button>  
		</div> 
      </md-tab>      
      <md-tab label={{secciones[4].tab}}>
     <form name="Form2">
     <md-content class="md-padding">
     	  <div ng-if="secciones[4].app=='VisualMail'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T1VM'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
	     <div ng-if="secciones[4].app=='Discource'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T1DS'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
        </md-content>
                <div layout="row" layout-align="center center">
 		<md-button  class="md-raised md-primary" ng-click="DS1()" ng-disabled="Form2.$invalid" >Enviar</md-button>
		</div>
		</form>       
      </md-tab>
      <md-tab  label={{secciones[5].tab}}>
       <md-content class="md-padding">
        <div ng-if="secciones[5].app=='VisualMail'" class="md-display-1">1)Favor comenzar a usar VisualMail cuando se le indique.
		</div> 
		 <div ng-if="secciones[5].app=='VisualMail'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar VisualMail, presione siguiente y conteste el cuestionario.
		</div>
		
		 <div ng-if="secciones[5].app=='Discource'" class="md-display-1">1)Favor comenzar a usar Discource cuando se le indique.
		</div> 
		 <div ng-if="secciones[5].app=='Discource'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar Discource, presione siguiente y conteste el cuestionario.
		</div>       
		</md-content>
		  <div layout="row" layout-align="center center"> 
		<md-button  class="md-raised md-primary" ng-click="siguiente()">Siguiente</md-button>  
		</div> 
      </md-tab>      
      <md-tab label={{secciones[6].tab}}>
     <form name="Form3">     
     <md-content class="md-padding">
     
           <div ng-if="secciones[6].app=='VisualMail'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T2VM'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
	     <div ng-if="secciones[6].app=='Discource'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T2DS'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
        </md-content>
                <div layout="row" layout-align="center center">
 		<md-button  class="md-raised md-primary" ng-click="VM2()" ng-disabled="Form3.$invalid">Enviar</md-button>
		</div>
	 </form>
      </md-tab>
      <md-tab  label={{secciones[7].tab}}>
       <md-content class="md-padding">
          <div ng-if="secciones[7].app=='VisualMail'" class="md-display-1">1)Favor comenzar a usar VisualMail cuando se le indique.
		</div> 
		 <div ng-if="secciones[7].app=='VisualMail'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar VisualMail, presione siguiente y conteste el cuestionario.
		</div>
		
		 <div ng-if="secciones[7].app=='Discource'" class="md-display-1">1)Favor comenzar a usar Discource cuando se le indique.
		</div> 
		 <div ng-if="secciones[7].app=='Discource'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar Discource, presione siguiente y conteste el cuestionario.
		</div>       
		</md-content>
		  <div layout="row" layout-align="center center"> 
		<md-button  class="md-raised md-primary" ng-click="siguiente()">Siguiente</md-button>  
		</div> 
      </md-tab>      
      <md-tab label={{secciones[8].tab}}>
      <form name="Form4">   
     <md-content class="md-padding">
            <div ng-if="secciones[8].app=='VisualMail'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T2VM'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
	     <div ng-if="secciones[8].app=='Discource'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T2DS'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
        </md-content>
                <div layout="row" layout-align="center center">
 		<md-button  class="md-raised md-primary" ng-click="DS2()" ng-disabled="Form4.$invalid">Enviar</md-button>
		</div>
		 </form>
      </md-tab>
      <md-tab  label={{secciones[9].tab}}>
       <md-content class="md-padding">
          <div ng-if="secciones[9].app=='VisualMail'" class="md-display-1">1)Favor comenzar a usar VisualMail cuando se le indique.
		</div> 
		 <div ng-if="secciones[9].app=='VisualMail'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar VisualMail, presione siguiente y conteste el cuestionario.
		</div>
		
		 <div ng-if="secciones[9].app=='Discource'" class="md-display-1">1)Favor comenzar a usar Discource cuando se le indique.
		</div> 
		 <div ng-if="secciones[9].app=='Discource'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar Discource, presione siguiente y conteste el cuestionario.
		</div>       
		</md-content>
		  <div layout="row" layout-align="center center"> 
		<md-button  class="md-raised md-primary" ng-click="siguiente()">Siguiente</md-button>  
		</div> 
      </md-tab>      
       <md-tab label={{secciones[10].tab}}>
        <form name="Form5">   
     <md-content class="md-padding">
                <div ng-if="secciones[10].app=='VisualMail'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T3VM'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
	     <div ng-if="secciones[10].app=='Discource'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T3DS'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
        </md-content>
                <div layout="row" layout-align="center center">
 		<md-button  class="md-raised md-primary" ng-click="VM3()"  ng-disabled="Form5.$invalid">Enviar</md-button>
		</div>
		</form>
      </md-tab>
       <md-tab  label={{secciones[11].tab}}>
       <md-content class="md-padding">
           <div ng-if="secciones[11].app=='VisualMail'" class="md-display-1">1)Favor continue usando Visual Mail.
		</div> 
		 <div ng-if="secciones[11].app=='VisualMail'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar Visual Mail,  presione siguiente y conteste el cuestionario SAM final para Visual Mail.
		</div>
		
		<div ng-if="secciones[11].app=='Discource'" class="md-display-1">1)Favor continue usando Discource.
		</div> 
		 <div ng-if="secciones[11].app=='Discource'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar Discource,  presione siguiente y conteste el cuestionario SAM final para Discource.
		</div>
       
      
		</md-content>
		  <div layout="row" layout-align="center center"> 
		<md-button  class="md-raised md-primary" ng-click="siguiente()">Siguiente</md-button>  
		</div> 
      </md-tab> 
       <md-tab  label={{secciones[12].tab}}>
       <form name="Form7">
        <md-content class="md-padding">
         
         <div ng-if="secciones[12].app=='Discource'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'SAMFDS'}">
          <p class="md-title"  ng-model="pregunta.pregunta" >{{pregunta.glosa}}</p>
            <input type="hidden" name="country" ng-model="pregunta.imagen" value={{pregunta.imagen}}>
           <img ng-href="{{pregunta.imagen}}" src={{pregunta.imagen}} height="120" width="400">
          <md-radio-group ng-model="pregunta.respuesta" layout="row" required>
		 <md-radio-button value=0 class="md-primary"></md-radio-button>
  		  <md-radio-button value=1 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=2 class="md-primary"></md-radio-button>
  		  <md-radio-button value=3 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=4 class="md-primary"></md-radio-button>
  		  <md-radio-button value=5  class="md-primary"></md-radio-button>
  		    <md-radio-button value=6 class="md-primary"></md-radio-button>
  		  <md-radio-button value=7 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=8 class="md-primary">  </md-radio-button>
		</md-radio-group>
	    </div>
	    
	    <div ng-if="secciones[12].app=='VisualMail'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'SAMFVM'}">
          <p class="md-title"  ng-model="pregunta.pregunta" >{{pregunta.glosa}}</p>
            <input type="hidden" name="country" ng-model="pregunta.imagen" value={{pregunta.imagen}}>
           <img ng-href="{{pregunta.imagen}}" src={{pregunta.imagen}} height="120" width="400">
          <md-radio-group ng-model="pregunta.respuesta" layout="row" required>
		 <md-radio-button value=0 class="md-primary"></md-radio-button>
  		  <md-radio-button value=1 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=2 class="md-primary"></md-radio-button>
  		  <md-radio-button value=3 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=4 class="md-primary"></md-radio-button>
  		  <md-radio-button value=5  class="md-primary"></md-radio-button>
  		    <md-radio-button value=6 class="md-primary"></md-radio-button>
  		  <md-radio-button value=7 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=8 class="md-primary">  </md-radio-button>
		</md-radio-group>
	    </div>
	    
	    
	    
        </md-content>
        <div layout="row" layout-align="center center">
 		<md-button  class="md-raised md-primary" ng-click="VM1()" ng-disabled="Form7.$invalid" >Enviar</md-button>
		</div> 
		</form>        
      </md-tab>   
        <md-tab  label={{secciones[13].tab}}>
       <md-content class="md-padding">
          <div ng-if="secciones[13].app=='VisualMail'" class="md-display-1">1)Favor comenzar a usar VisualMail cuando se le indique.
		</div> 
		 <div ng-if="secciones[13].app=='VisualMail'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar VisualMail, presione siguiente y conteste el cuestionario.
		</div>
		
		 <div ng-if="secciones[13].app=='Discource'" class="md-display-1">1)Favor comenzar a usar Discource cuando se le indique.
		</div> 
		 <div ng-if="secciones[13].app=='Discource'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar Discource, presione siguiente y conteste el cuestionario.
		</div>       
		</md-content>
		  <div layout="row" layout-align="center center"> 
		<md-button  class="md-raised md-primary" ng-click="siguiente()">Siguiente</md-button>  
		</div> 
      </md-tab>               
      <md-tab label={{secciones[14].tab}}>
      <form name="Form6">   
     <md-content class="md-padding">
              <div ng-if="secciones[14].app=='VisualMail'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T3VM'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
	     <div ng-if="secciones[14].app=='Discource'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'T3DS'}">
          <p class="md-title" ng-model="pregunta" >{{pregunta.glosa}}</p>
          <textarea id="{{pregunta.pregunta}}" ng-model="pregunta.respuesta" rows="3" cols="97" ng-required="true">
		</textarea>    
	    </div>
        </md-content>
                <div layout="row" layout-align="center center">
 		<md-button  class="md-raised md-primary" ng-click="DS3()" ng-disabled="Form6.$invalid">Enviar</md-button>
		</div>
		</form>
      </md-tab>
        <md-tab  label={{secciones[15].tab}}>
       <md-content class="md-padding">
            <div ng-if="secciones[15].app=='VisualMail'" class="md-display-1">1)Favor continue usando Visual Mail.
		</div> 
		 <div ng-if="secciones[15].app=='VisualMail'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar Visual Mail,  presione siguiente y conteste el cuestionario SAM final para Visual Mail.
		</div>
		
		<div ng-if="secciones[15].app=='Discource'" class="md-display-1">1)Favor continue usando Discource.
		</div> 
		 <div ng-if="secciones[15].app=='Discource'" class="md-display-1">2)Solo si el moderador le señaló que deje de usar Discource,presione siguiente y conteste el cuestionario SAM final para Discource.
		</div>
            
		</md-content>
		  <div layout="row" layout-align="center center"> 
		<md-button  class="md-raised md-primary" ng-click="siguiente()">siguiente</md-button>  
		</div> 
      </md-tab>
       <md-tab  label={{secciones[16].tab}}>
       <form name="Form8">
        <md-content class="md-padding">
         
         <div ng-if="secciones[13].app=='Discource'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'SAMFDS'}">
          <p class="md-title"  ng-model="pregunta.pregunta" >{{pregunta.glosa}}</p>
            <input type="hidden" name="country" ng-model="pregunta.imagen" value={{pregunta.imagen}}>
           <img ng-href="{{pregunta.imagen}}" src={{pregunta.imagen}} height="120" width="400">
          <md-radio-group ng-model="pregunta.respuesta" layout="row" required>
		 <md-radio-button value=0 class="md-primary"></md-radio-button>
  		  <md-radio-button value=1 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=2 class="md-primary"></md-radio-button>
  		  <md-radio-button value=3 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=4 class="md-primary"></md-radio-button>
  		  <md-radio-button value=5  class="md-primary"></md-radio-button>
  		    <md-radio-button value=6 class="md-primary"></md-radio-button>
  		  <md-radio-button value=7 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=8 class="md-primary">  </md-radio-button>
		</md-radio-group>
		 </div>
		
		 <div ng-if="secciones[16].app=='VisualMail'" flex="50" ng-repeat="pregunta in cuestionario  | filter:{tipo:'SAMFVM'}">
          <p class="md-title"  ng-model="pregunta.pregunta" >{{pregunta.glosa}}</p>
            <input type="hidden" name="country" ng-model="pregunta.imagen" value={{pregunta.imagen}}>
           <img ng-href="{{pregunta.imagen}}" src={{pregunta.imagen}} height="120" width="400">
          <md-radio-group ng-model="pregunta.respuesta" layout="row" required>
		 <md-radio-button value=0 class="md-primary"></md-radio-button>
  		  <md-radio-button value=1 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=2 class="md-primary"></md-radio-button>
  		  <md-radio-button value=3 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=4 class="md-primary"></md-radio-button>
  		  <md-radio-button value=5  class="md-primary"></md-radio-button>
  		    <md-radio-button value=6 class="md-primary"></md-radio-button>
  		  <md-radio-button value=7 class="md-primary">  </md-radio-button>
  		    <md-radio-button value=8 class="md-primary">  </md-radio-button>
		</md-radio-group>

	    </div>
        </md-content>
        <div layout="row" layout-align="center center">
 		<md-button  class="md-raised md-primary" ng-click="VM1()" ng-disabled="Form8.$invalid" >Enviar</md-button>
		</div> 
		</form>        
      </md-tab>
      <md-tab  label={{secciones[17].tab}}>
       <md-content class="md-padding">
        <div class="md-display-1">1)Muchas gracias por su participación.
		</div> 
		 <div class="md-display-1">2)Presione Finalizar Toma Muestral.
		</div>       
		</md-content>
		  <div layout="row" layout-align="center center"> 
		<md-button  class="md-raised md-primary" ng-href="/VisualMail1.0/Login" >Finalizar Toma Muestral</md-button>  
		</div> 
      </md-tab>         
    </md-tabs>
  </md-content>
</div>

</body>