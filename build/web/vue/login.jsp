<%-- 
    Document   : login
    Created on : Aug 7, 2014, 3:38:52 PM
    Author     : Dry Bass
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${ message == 'error' }">
    <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <h4>Echec!</h4>
        Login et/ou Mot de passe incorrect...Veuillez saisir un login et/ou un mot de passe correct!!!
    </div>
</c:if>
<c:choose>
    <c:when test="${ empty sessionScope.sessionUtilisateur }">
        <form class="form-horizontal" action="<c:url value="/ConnexionServlet"/>" method="post" style="margin-left:25px">
           <div class="input-prepend">
               <span class="add-on"><i class=" icon-user"></i></span>
               <input  id="prependedInput" type="text" placeholder="Login" name="login">
           </div>
           <br/>
           <br/>
           <div class="input-append">
               <input id="appendedInput" type="password" placeholder="Password" name="password">
               <span class="add-on"><i class=" icon-eye-close"></i></span>
           </div>
           <br/>
           <br/>
           <button class="btn btn-info" type="submit">Connexion</button>
       </form>
       <a href="<c:url value="/inscription.jsp"/>" class="text-error" style="margin-left:25px"><small>Pas de compte? Créer un compte</small></a>
    </c:when>
     <c:otherwise>
         
         <ul class="nav nav-list">
             <li class="nav-header"><h4>Espace <c:out value="${type}"/></h4></li>
        </ul>
        <div class="navbar-text">
            <div class="btn-group">
                <c:if test="${ type == 'Candidat' }">
                    <a class="btn btn-large btn-info" href="#" style="margin-left:25px"></i> <c:out value="${sessionScope.sessionUtilisateur.nomCan}"/>&nbsp;<c:out value="${sessionScope.sessionUtilisateur.prenomCan}"/> </a>
                    <a class="btn btn-large btn-info dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                    <li><a href="<c:url value="/ConnexionServlet"/>"><i class="icon-off"></i> Log out</a></li>
                    <li><a href="<c:url value="/ProfilCandidatServlet?action=affiche&id=${sessionScope.sessionUtilisateur.codeCan}&codeform=null&codecomp=null&codeexp=null"/>"><i class="icon-user"></i> Mon Profil</a></li>
                    <li><a href="<c:url value="/CvServlet?id=${sessionScope.sessionUtilisateur.codeCan}"/>"><i class="icon-file"></i> Mon CV</a></li>
                    <li><a href="<c:url value="/PostulationServlet?action=affichpostulation&codeUser=${sessionScope.sessionUtilisateur.code.code}"/>"><i class="icon-th-list"></i> Mes Postulations</a></li>
                    <li><a href="<c:url value="/InscriptionServlet?action=afficher&codeUser=${sessionScope.sessionUtilisateur.code.code}"/>"><i class="icon-book"></i>   Mes Formations</a></li>
                </c:if>
                <c:if test="${ type == 'Entreprise' }">
                        <a class="btn btn-large btn-info" href="#" style="margin-left:25px"></i> <c:out value="${sessionScope.sessionUtilisateur.nomEnt}"/> </a>
                        <a class="btn btn-large btn-info dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                        <li><a href="<c:url value="/ConnexionServlet"/>"><i class="icon-off"></i> Log out</a></li>
                        <li><a href="<c:url value="/ProfilEntrepriseServlet?action=affich&id=${sessionScope.sessionUtilisateur.codeEnt}"/>"><i class="icon-user"></i> Mon Profil</a></li>
                        <li><a href="<c:url value="/OffreEmploiServlet?action=affich&id=${sessionScope.sessionUtilisateur.codeEnt}&codeOffreEmp=null"/>"><i class="icon-file"></i> Mes Offres d'emploi</a></li>
                        <li><a href="<c:url value="/CvThequeServlet?id=${sessionScope.sessionUtilisateur.codeEnt}"/>"><i class="icon-th-list"></i> CVth&egrave;ques</a></li>
                   </c:if>
                   <c:if test="${ type == 'Institut' }">
                        <a class="btn btn-large btn-info" href="#" style="margin-left:25px"></i> <c:out value="${sessionScope.sessionUtilisateur.code.login}"/> </a>
                        <a class="btn btn-large btn-info dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                        <li><a href="<c:url value="/ConnexionServlet"/>"><i class="icon-off"></i> Log out</a></li>
                        <li><a href="<c:url value="/ProfilInstitutServlet?action=affich&id=${sessionScope.sessionUtilisateur.codeIns}"/>"><i class="icon-user"></i> Mon Profil</a></li>
                        <li><a href="<c:url value="/OffreFormationServlet?action=affich&id=${sessionScope.sessionUtilisateur.codeIns}"/>"><i class="icon-file"></i> Mes Annonces de Formation</a></li>
                        <li><a href="<c:url value="#"/>"><i class="icon-folder-open"></i>   Mes Candidatures</a></li>
                   </c:if>
               </ul>
            </div> 
        </div>
     </c:otherwise>
</c:choose>

</br><br/>

