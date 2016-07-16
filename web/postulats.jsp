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
    <title>E-insertion | Candidatures - Offre d'emploi</title>
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
                <c:choose>
                    <c:when test="${!empty requestScope.message}">
                        <c:if test="${ message == 'reussi' }">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <h4>Succ&egrave;s</h4>
                                Votre postulation a &eacute;t&eacute; bien effectu&eacute;e!!!
                            </div>
                        </c:if>
                        <c:if test="${ message == 'echec' }">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <h4>Echec!</h4>
                                Votre postulation n'a pas p&ucirc; &ecirc;tre effectu&eacute;e...bien vouloir r&eacute;essayer
                            </div>
                            <a class="btn btn-error" href="<c:url value="/DetailServlet?action=detailoffreemploi&id=${sessionScope.sessionUtilisateur.code.code}&codeEnt=${Entreprise.codeEnt}&codeOffreEmp=${OffreEmploi.codeOffreEmp}"/>">R&egrave;essayer <i class="icon-refresh icon-white"></i></a>
                        </c:if>
                        <c:if test="${ message == 'deja' }">
                            <div class="alert alert-info">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <h4>Attention!!!</h4>
                                Vous avez d&eacute;j&agrave; postul&eacute; &agrave; cette offre d'emploi. Pri&egrave;re d'attendre que l'entreprise vous contacte...
                            </div>
                            <a class="btn btn-info" href="<c:url value="/AfficheListeOffreServlet?affich=candidat&offre=emploi"/>"><i class="icon-arrow-left icon-white"></i> Retour</a>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <div class="well sidebar-nav">
                            <div class="row" style="margin-left: 25px">
                                <p>
                                    Vous &ecirc;tes sur le point de postuler pour l'offre d'emploi de l'entreprise <c:out value="${requestScope.Entreprise.nomEnt}"/>
                                    au poste de <c:out value="${requestScope.OffreEmploi.poste}"/> dans le domaine
                                    <c:out value="${requestScope.OffreEmploi.domaine}"/>
                                </p> 
                            </div>
                            <div class="row" style="margin-left: 25px">
                                <table>
                                    <tr>
                                        <td>
                                           <a class="btn btn-danger" href="<c:url value="/DetailServlet?action=detailoffreemploi&id=${sessionScope.sessionUtilisateur.code.code}&codeEnt=${Entreprise.codeEnt}&codeOffreEmp=${OffreEmploi.codeOffreEmp}&type=candidat"/>">Annuler <i class="icon-remove icon-white"></i></a> 
                                        </td>
                                        <td>
                                           <a class="btn btn-primary" href="<c:url value="/PostulationServlet?action=valider&id=${sessionScope.sessionUtilisateur.codeCan}&codeEnt=${Entreprise.codeEnt}&codeOffreEmp=${OffreEmploi.codeOffreEmp}"/>">Confirmer <i class="icon-ok icon-white"></i></a> 
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
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
