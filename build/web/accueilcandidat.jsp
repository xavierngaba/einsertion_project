 <%-- 
    Document   : partenaires
    Created on : Aug 6, 2014, 5:05:35 PM
    Author     : Dry Bass
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <title>E-insertion | Acceuil</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" type="image/png" href="<c:url value="images/logo.png"/>" />

    <!-- Le styles -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="accueil.css" rel="stylesheet">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="bootstrap/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="bootstrap/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="bootstrap/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="bootstrap/ico/apple-touch-icon-57-precomposed.png">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 45px 0;
      }
      .span7 {
        padding: 45px 0;
      }
      .tab-pane active {
        margin-left: 15px;
      }
    </style>
  </head>

  <body>

      <c:choose>
             <c:when test="${ empty sessionScope.sessionUtilisateur }">
                 <jsp:forward page="/index.jsp" />
             </c:when>
          <c:otherwise>
    <!-- NAVBAR
    ================================================== -->
        <c:import url="vue/menu.jsp" />
        <div class="container-fluid">
            <div class="row-fluid">
            <div class="span3">
                <div class="well sidebar-nav">
                    <c:import url="vue/login.jsp" />
                </div>
            </div>
            <div class="span7">
                <div class="well sidebar-nav" style="padding: 10px 0">
                    <div class="row" style="margin-left:25px"> 
                        <legend style="color: red;  font-size: 25px">Quelques Entreprises et leurs Offres d'Emploi
                            <a href="<c:url value="/AfficheListeOffreServlet?affich=candidat&offre=emploi"/>" class="btn btn-danger" style="margin-left: 35px" type="submit">
                                <i class="icon-white icon-eye-open"></i> Voir toutes...
                            </a>
                        </legend> 
                        <c:choose>
                                <c:when test="${requestScope.listOffreEmploi.size() == 0}">
                                    <div class="alert alert-info" style=" margin-left: 10%; margin-top: 10px">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        Actuellement aucune offre d'emploi n'est publi&eacute;e sur notre plate-forme
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${ requestScope.listEntreprise}" var="Entreprise" varStatus="boucle">
                                        <c:if test="${ Entreprise.offreEmploiList.size() != 0}">
                                            <c:if test="${boucle.index < 3}">
                                                <div class="span3" style="margin-left:35px" >
                                                    <img class="img-rounded" data-src="holder.js/80x80" height="120px" width="140px" src="<c:url value="images/profil/images.jpg"/>">
                                                    <h2 class="text-info" style="font-style: italic; font-family: monospace"><c:out value="${Entreprise.nomEnt}"/></h2>
                                                    <p style="color: forestgreen">${ Entreprise.offreEmploiList.size()} offres publi&eacute;es sur la plate-forme</p>
                                                    <a class="btn btn-info" href="<c:url value="/DetailServlet?action=affichoffreemploient&id=${sessionScope.sessionUtilisateur.code.code}&codeEnt=${Entreprise.codeEnt}"/>"><i class="icon-white icon-eye-open"></i> D&eacute;tails...</a>
                                                </div><!-- /.span4 -->
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                          </c:choose>
                    </div>
                </div>
                <div class="well sidebar-nav" style="padding: 10px 0">
                    <div class="row" style="margin-left:25px">
                        <legend style="color: red;  font-size: 25px">Quelques Instituts et leurs Offres de Formation 
                            <a href="<c:url value="/AfficheListeOffreServlet?affich=candidat&offre=formation"/>" class="btn btn-danger" style="margin-left: 35px" type="submit">
                                <i class="icon-white icon-eye-open"></i> Voir toutes...
                            </a>
                        </legend>
                        <c:choose>
                                <c:when test="${requestScope.listOffreFormation.size() == 0}">
                                    <div class="alert alert-info" style=" margin-left: 22%; margin-top: 10px">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        Actuellement aucune offre de formation n'est publi&eacute;e sur notre plate-forme
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${ requestScope.listInstitut}" var="Institut" varStatus="boucle">
                                        <c:if test="${ Institut.offreFormationList.size() != 0}">
                                            <c:if test="${boucle.index < 3}">
                                                <div class="span3" style="margin-left:35px" >
                                                    <img class="img-rounded" data-src="holder.js/80x80" height="120px" width="140px" src="<c:url value="images/profil/images4.jpg"/>">
                                                    <h2 class="text-info" style="font-style: italic; font-family: monospace"><c:out value="${Institut.nomIns}"/></h2>
                                                    <p style="color: forestgreen">${ Institut.offreFormationList.size()} formations publi&eacute;es sur la plate-forme</p>
                                                    <a class="btn btn-info" href="<c:url value="/DetailServlet?action=affichoffreformationins&id=${sessionScope.sessionUtilisateur.code.code}&codeIns=${Institut.codeIns}"/>"><i class="icon-white icon-eye-open"></i> D&eacute;tails...</a>
                                                </div><!-- /.span4 -->
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                    </div>
                </div>  
        </div>
        <div class="span2">
            <c:import url="vue/sidebar.jsp" />
        </div>
        </div>
        <div class="container marketing">
            <c:import url="vue/footer.jsp" />
        </div>
        </div>
        </c:otherwise>
     </c:choose>
    
    <script src="bootstrap/js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap-transition.js"></script>
    <script src="bootstrap/js/bootstrap-alert.js"></script>
    <script src="bootstrap/js/bootstrap-modal.js"></script>
    <script src="bootstrap/js/bootstrap-dropdown.js"></script>
    <script src="bootstrap/js/bootstrap-scrollspy.js"></script>
    <script src="bootstrap/js/bootstrap-tab.js"></script>
    <script src="bootstrap/js/bootstrap-tooltip.js"></script>
    <script src="bootstrap/js/bootstrap-popover.js"></script>
    <script src="bootstrap/js/bootstrap-button.js"></script>
    <script src="bootstrap/js/bootstrap-collapse.js"></script>
    <script src="bootstrap/js/bootstrap-carousel.js"></script>
    <script src="bootstrap/js/bootstrap-typeahead.js"></script>
   
    <script>
      !function ($) {
        $(function(){
          // carousel demo
          $('#myCarousel').carousel();
        });
      }(window.jQuery);
    </script>
  </body>

</html>
