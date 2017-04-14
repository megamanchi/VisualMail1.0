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

<link data-require="bootstrap@*" data-semver="3.3.1" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<script data-require="bootstrap@*" data-semver="3.3.1" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>


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
<title>Login Visual Mail</title>
</head>
<body style="background: #eee;">
<script>
$(document).ready(function() {
} );
</script>
<div class="container">
<form name="form" ng-app="myApp" ng-controller="users" ng-init="users()" novalidate > 

<h2>Visual Mail</h2>
	   <br>
			 <div id="msg" class="alert alert-warning">
  <strong>Error:</strong> {{msg}}
</div>
        <div class="modal-body">

      <div> 
          <div class="form-group">
            <label for="email">mail</label>
            <input type="email" class="form-control" placeholder="example@email.com" name="Mail" ng-model="Mail" required>
               <span ng-show="!form.$pristine && form.Mail.$error.required">Mail is required.</span>
               <span ng-show="!form.$pristine && form.Mail.$error.email">Please enter a valid email</span>
          </div>
          
           <div class="form-group">
            <label for="pasword">password</label>
            <input class="form-control" type="password" placeholder="password" name="password" ng-model="password" required>
               <span ng-show="!form.$pristine && form.Mail.$error.required">password is required.</span>
          </div>
             <br/>            
          </div>
 	         	  <input id="cuestionarios" type="submit" value="Cuestionarios" class="btn btn-success pull-right" ng-disabled="!form.$valid" data-dismiss="modal"  ng-click="loginUserCuestionarios()" />
          <input id="add" type="submit" value="Iniciar Sesión Visual Mail" class="btn btn-success pull-right" ng-disabled="!form.$valid" data-dismiss="modal"  ng-click="loginUser()" />
  
      </div>
    </div>

      

	 
	 
	 
	 
	 <br>
	 

		<pagination 
  		ng-model="currentPage"
  		total-items="users.length"
  		max-size="maxSize"  
  		boundary-links="true">
</pagination>
	</div>
	
	
	

</form>
</div>

<script>
var app = angular.module('myApp', []);
var loc = window.location;
var pathName = loc.pathname.substring(0, loc.pathname.lastIndexOf('/') + 1);
app.controller('users', [ '$scope', '$http',                                   
                                		function($scope, $http) {
										$("#msg").hide();
										$scope.loginUser = function(){
                                			$http.post(pathName+'users/login', 
                                				{
                                					mail : $scope.Mail,
                                					password: $scope.password
                                				}
                                			).success(function(data) {
                                			     if (data==true){
                                			 		window.location.href = pathName+'Cargar';
                                			    	// $scope.vmRedirect();  
                                			    	/*
                                			 		$scope.$on("myEvent", function (event, args) {
                                			 		   $scope.rest_id = args.username;
                                			 		   $scope.getMainCategories();
                                			 		});*/				                                			     
                                			     }
                                			     else
                                			    	 {
                                			    		$scope.msg = "Credenciales Incorrectas vuelva a intentar";
                                			     		$("#msg").show();
                                			     		$("#msg").fadeOut(4000); 
                                			    	 }
                                			}).error(function(data) {
                                				$("#msg").show();
                                				$("#msg").fadeOut(4000); 
                                				$scope.msg = 'Se ha producido un error';
                                			});
										}
										$scope.vmRedirect = function(){
                                			$http.post(pathName+'users/Cargar', 
                                				{
                                					mail : $scope.Mail,
                                					password: $scope.password
                                				}
                                			).success(function(data) {
                                				
                                			}).error(function(error) {
                                				$scope.msg = 'Se ha producido un error';
                                			});
										}
										$scope.loginUserCuestionarios = function(){
                                			$http.post(pathName+'users/login', 
                                				{
                                					mail : $scope.Mail,
                                					password: $scope.password
                                				}
                                			).success(function(data) {
                                				   if (data==true)
                                   			 		window.location.href = pathName+'Cuestionarios';
                                			}).error(function(error) {
                                				$scope.msg = 'Se ha producido un error';
                                			});
										}
										
										
										
										
										
									} ]);

                                 


</script>


</body>
</html>