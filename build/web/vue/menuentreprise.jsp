<%-- 
    Document   : accueil
    Created on : Aug 6, 2014, 4:01:29 PM
    Author     : Dry Bass
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
      <!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="<c:url value="/ConnexionServlet"/>"><img src="<c:url value="images/logo2.png"/>"/></a>
      <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
      <div class="nav-collapse collapse">
          <div class="navbar-text pull-right">
              <ul class="nav">
                <li><a href="<c:url value="/AffichageServlet?affich=entreprise"/>"><h4  class="text-info">Accueil</h4></a></li>
                <li><a href="<c:url value="/OffreEmploiServlet?action=affich&id=${sessionScope.sessionUtilisateur.codeEnt}&codeOffreEmp=${form.codeOffreEmp}"/>"><h4  class="text-info">Offre d'emploi</h4></a></li>
                <li><a href="<c:url value="/AfficheListeOffreServlet?affich=entreprise&offre=formation"/>"><h4  class="text-info">Offre de Formation</h4></a></li>
                <li><a href="<c:url value="/PostulationServlet?action=affichpostulation&codeUser=${sessionScope.sessionUtilisateur.code.code}&codeOffreEmp=0"/>"><h4  class="text-info">Candidatures</h4></a></li>
                <li><a href="<c:url value="/CvThequeServlet?id=${sessionScope.sessionUtilisateur.codeEnt}"/>"><h4  class="text-info">CVthèque</h4></a></li>
              </ul>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          </div>
      </div>
    </div>
  </div>

 
  
