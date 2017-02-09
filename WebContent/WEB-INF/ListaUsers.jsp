<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<spring:url value="/resources/js/angular.min.js" var="AngularJs" />
<script src="${AngularJs}"></script>
	<spring:url value="/resources/js/jquery-1.11.3.min.js" var="jqueryJs" />
    <spring:url value="/resources/js/d3.min.js" var="d3Js" />
    <spring:url value="/resources/js/fisheye.js" var="fisheyeJs" />
	<spring:url value="/resources/css/VisualMail.css" var="mainCss" />
    <spring:url value="/resources/js/VisualMail.js" var="mainJs" />
	<spring:url value="/resources/js/flare.json" var="jsonFlare" />
	<spring:url value="/resources/js/d3-transform.js" var="d3JsT" />
	<spring:url value="/resources/js/jquery-ui-1.11.4/jquery-ui.min.js" var="jqueryUIJs" />
	<spring:url value="/resources/js/jquery-ui-1.11.4/jquery-ui.css" var="jqueryUICss" />	
	<spring:url value="/resources/js/jQuery-TE_v.1.4.0/jquery-te-1.4.0.min.js" var="jqueryte" />
	<spring:url value="/resources/js/jQuery-TE_v.1.4.0/jquery-te-1.4.0.css" var="jqueryteCSS" />
	
	
	
	<spring:url value="/resources/js/contextmenu/jquery.contextMenu.css" var="contextMenuCss" />	
	<spring:url value="/resources/js/contextmenu/jquery.ui.position.js" var="jqueryuiposition" />
	<spring:url value="/resources/js/contextmenu/jquery.contextMenu.js" var="contextMenujs" />
	
		<spring:url value="/resources/css/bootstrap.min.css" var="bCSS" />	
		<spring:url value="/resources/js/bootstrap.min.js" var="bJS" />	
		

	
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
  
    <script src="${bJS}"></script>
  <link href="${bCSS}" rel="stylesheet" />



<style>
table, td  {
  border: 1px solid grey;
  border-collapse: collapse;
  padding: 5px;
}
.error {
  border-color: red;
}
 
.warning {
  border-color: yellow;
}
</style>
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administracion de Usuarios</title>
</head>
<body style="background: #eee;">
<script>
$(document).ready(function() {
} );
</script>
<div class="container">
<form name="form" ng-app="myApp" ng-controller="users" ng-init="users()" novalidate > 

<h2>Administración de Usuarios</h2>
	   <button type="button" class="btn btn-success pull-left" data-toggle="modal" data-target="#myModal" ng-click="goVM()">Volver</button>
	   <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#myModal" ng-click="addHeader()">Nuevo Usuario</button>
	   <br>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h2>Nuevo Usuario</h2>
        </div>
        <div class="modal-body">

      <div>

          <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" class="form-control" placeholder="fullName" name="fullName" ng-model="fullName" required>
             <span ng-show="!form.$pristine && form.fullName.$error.required">full Name is required.</span>
          </div>
 
          <div class="form-group">
            <label for="User Name">User Name (Iniciales de 3 letras)</label>
            <input type="text" class="form-control" placeholder="userName" name="userName" ng-model="userName" required ng-minlength="3" ng-maxlength="3">
               <span ng-show="!form.$pristine && form.userName.$error.required">userName is required.</span>
               <span ng-show="form.userName.$error.minlength">Please enter 3 characters</span>
                 <span ng-show="form.userName.$error.maxlength">Please enter 3 characters</span>
          </div>
 
          <div class="form-group">
            <label for="email">mail</label>
            <input type="email" class="form-control" placeholder="example@email.com" name="Mail" ng-model="Mail" required>
               <span ng-show="!form.$pristine && form.Mail.$error.required">Mail is required.</span>
               <span ng-show="!form.$pristine && form.Mail.$error.email">Please enter a valid email</span>
          </div>
            <div class="form-group">
            <label for="email">Url Icon</label>
            <input  class="form-control" placeholder="https://www.google.cl/img.jpg" name="UrlIcon" ng-model="UrlIcon" >
          </div>
          
           <div class="form-group">
            <label for="pasword">password</label>
            <input class="form-control" placeholder="password" name="password" ng-model="password" required>
               <span ng-show="!form.$pristine && form.Mail.$error.required">password is required.</span>
          </div>
          
          <div class="form-group">
            <label for="color">Color Interaction</label><BR>
              <input type="color" name="favcolor" id="color" ng-model="colorInteraction" value="#ff0000">
          </div>
          <div>
            <label for="admin">Admin</label>
            <br>
               <input type="checkbox" ng-model="admin"  value="{{admin}}"  
           		>
   			</label>
             <br/>            
          </div>
 
          <input id="add" type="submit" class="btn btn-success pull-right" ng-disabled="!form.$valid" data-dismiss="modal"  ng-click="addUser()" />
		   <input id="edit"  type="submit"  class="btn btn-success pull-right" ng-disabled="!form.$valid" data-dismiss="modal"  ng-click="editCallSerice()" />
      </div>
    </div>
        </div>
       
      </div>
      
    </div>

	 
	 
	 
	 
	 <br>
	 <div id="msg" class="alert alert-success fade in">
  <strong>Exito:</strong> {{msg}}
</div>
	 
	
    <div class="form-group">
            <label for="Buscar">Buscar</label>
              <input class="form-control" placeholder="buscar"  ng-model="test">
          </div>	
<div >
		<table  class="table table-hover table-bordered .table-responsive table-striped" style="background-color: white !important;" ng-show="users != null" >
			    <thead>
            <tr>
                <th>id</th>
                <th>fullName</th>
                <th>userName</th>
                <th>mail</th>
                   <th>password</th>
                    <th>Icon</th>
                      <th>admin</th>
                         <th>color interaction</th>
                        <th></th>
                            <th></th>
            </tr>
        </thead>
			
			<tr class="film-info-bottom"  ng-repeat="user in users | filter:test">
				<td> {{ user.id}} </td>
			<td> {{ user.fullName}} </td>
			<td> {{  user.userName }}</td> 
			<td>    {{  user.mail }} </td> 
			<td>    {{  user.password }} </td> 
			<td> 
			<div  ng-if="user.urlIcon == null">sin imagen</div>  
			<img  ng-if="user.urlIcon != null" src=" {{  user.urlIcon }}" height="32" width="32">   
			
			
			</td> 
				<td>    {{  user.admin }} </td> 
					<td>          <input  disabled type="color" name="favcolor" ng-model="user.colorInteraction" id="color"> </td>
			
			<td><input type="button" value="Editar" class="btn btn-primary"  data-toggle="modal" data-target="#myModal"  ng-click="editUser(user)"/></td> 
				<td><input type="button" value="Eliminar" class="btn btn-primary" ng-click="removeUser(user)"/></td> 
			</tr>
		</table>
		<pagination 
  		ng-model="currentPage"
  		total-items="users.length"
  		max-size="maxSize"  
  		boundary-links="true">
</pagination>

<div class="modal fade" id="myModalCuestionarios" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h2>Desea Eliminar los cuestionarios</h2>
        </div>
        <div class="modal-body">

      <div>

          <div class="form-group">
             <button type="button" class="btn btn-warning center-inline" data-toggle="modal" ng-click="ResetCuuestionarios()" data-target="#myModalCuestionarios" >SI</button>
             <button type="button" class="btn btn-primary" data-toggle="modal" data-dismiss="modal" >NO</button>
          </div>
          </div>
       </div>
 </div>
 </div>  
 </div>
     
          


	</div>
	 <button type="button" class="btn btn-warning center-inline" data-toggle="modal"  data-target="#myModalCuestionarios" >Reset Cuestionarios</button>
	
	

</form>
</div>

<script>
var app = angular.module('myApp', []);
app.controller('users', [ '$scope', '$http',
                                    
                                	function($scope, $http) {
										$("#msg").hide();
                                		$scope.users = function() {
                                			$http.get('/VisualMail1.0/users').success(function(data) {
                                				$scope.users = data.users;
                                				   
                                				
                                				   
                                				                               				                               				
                                			});
                                		}
                                		
                                		$scope.addUser = function() {
                                			$http.post('/VisualMail1.0/users', 
                                				{
                                					fullName : $scope.fullName,
                                					userName : $scope.userName,
                                					mail : $scope.Mail,
                                					password: $scope.password,
                                					admin: $scope.admin,
                                					colorInteraction: $scope.colorInteraction,
                                					urlIcon:$scope.UrlIcon
                                				}
                                			).success(function(data) {
                                				$scope.msg = 'Usuario creado correctamente';
                                				$scope.users = data.users;
                                				$scope.fullName="";
                                				$scope.userName="";
                                				$scope.Mail="";
                                				$scope.password="";
                                				$("#msg").show();
                                				$("#msg").fadeOut(4000); 
                                			}).error(function(data) {
                                				$scope.msg = 'Se ha producido un error';
                                			});
                                	
                                		}
                                		$scope.editUser = function(user) {
                                			$(".modal-header H2").text("Editar Usuario");
                                			$("#edit").show();
											$("#add").hide();
                            				$scope.fullName=user.fullName;
                            				$scope.userName=user.userName;
                            				$scope.Mail=user.mail;
                            				$scope.password=user.password;
                            				$scope.id=user.id;
                            				if (user.admin==null)
                            				user.admin=false;
                            				
                            				 $scope.admin = user.admin,
                            				 $scope.colorInteraction =user.colorInteraction
                            				 $scope.UrlIcon =user.urlIcon
                            				
                            			//	$scope.admin= $scope.$eval(user.admin);
                            				//$scope.
                            				
                            				
                                	
                                		}
                                		$scope.removeUser = function(user) {
                                			$http.delete('/VisualMail1.0/users/'+user.id
                                    			).success(function(data) {
                                    				$scope.msg = 'Usuario eliminado correctamente';
                                    				$scope.users = data.users;
                                    				$("#msg").show();
                                    				$("#msg").fadeOut(4000); 
                                    			}).error(function(data) {
                                    				$scope.msg = 'Se ha producido un error';
                                    			});
                                			
                                        	
                                		}
										$scope.addHeader = function(id) {
                                			
											$(".modal-header H2").text("Nuevo Usuario");
											$("#edit").hide();
											$("#add").show();
											$scope.fullName="";
                            				$scope.userName="";
                            				$scope.Mail="";
                            				$scope.password="";
                            				$scope.admin=false;
                            				$scope.UrlIcon="";
                                        	
                                		}
                                		
										$scope.editCallSerice = function(id) {
										$http.put('/VisualMail1.0/users', 
                                				{
                                					fullName : $scope.fullName,
                                					userName : $scope.userName,
                                					mail : $scope.Mail,
                                					id: $scope.id,
                                					password: $scope.password,
													admin: $scope.admin,
													colorInteraction: $scope.colorInteraction,
													urlIcon:$scope.UrlIcon
                                				}
                                			).success(function(data) {
                                				$scope.msg = 'Usuario editado correctamente';
                                				$scope.users = data.users;
                                				$scope.fullName="";
                                				$scope.userName="";
                                				$scope.Mail="";
                                				$scope.password="";
                                				$("#msg").show();
                                				$("#msg").fadeOut(4000); 
                                			}).error(function(data) {
                                				$scope.msg = 'Se ha producido un error';
                                			});
										}
										$scope.goVM = function() {
											
											window.location.href = "/VisualMail1.0/Login";
										}
										$scope.ResetCuuestionarios = function() {											
											$http.post('/VisualMail1.0/users/ResetCuestionarios'                               			
	                                			).success(function(data) {
	                                				$scope.msg = 'Cuestionarios elminados correctamente';
	                                				$("#msg").show();
	                                				$("#msg").fadeOut(4000); 
	                                			}).error(function(data) {
	                                				$scope.msg = 'Se ha producido un error';
	                                			});
											
										}

										
									
                                		
                                		
                                } ]);
                                
                                


/*
var app = angular.module('myApp', []);
app.controller('users', 
	function($scope, $http) {
    $http.get("http://localhost:8086/VisualMail1.0/users")
    .success(function(response) {$scope.users = response.users;});
    
    $scope.addUser = function($scope, $http) {
	    $http.Post("http://localhost:8086/VisualMail1.0/users")
	    .success(function(response) {$scope.users = response.users;});
);*/
</script>


</body>
</html>