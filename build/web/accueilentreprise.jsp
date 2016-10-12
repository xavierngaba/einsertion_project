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
        <c:import url="vue/menuentreprise.jsp" />
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
                        <fieldset>
                            <legend style="color: red">Quelques Profils de Postulants
                                <a href="<c:url value="/CvThequeServlet?id=${sessionScope.sessionUtilisateur.codeEnt}"/>" class="btn btn-danger" style="margin-left: 35px" type="submit">
                                    <i class="icon-white icon-eye-open"></i> Voir tous...
                                </a>
                            </legend>
                            <table class="table table-striped">
                                <thead class="text-info">
                                <th></th>
                                <th>Nom et Pr&eacute;nom</th>
                                <th>Domaine de Competence</th>
                                <th>Addresse</th>
                                <th></th>
                                </thead>
                                <c:forEach items="${ requestScope.listCan}" var="can" varStatus="boucle">
                                    <c:if test="${ boucle.index < 4 }">
                                        <tr style="color: forestgreen">
                                            <td>
                                                <img class="img-polaroid" alt="logo" width="30px" height="30px" src="<c:url value="images/profil/profil.jpg"/>">
                                            </td>
                                            <td><c:out value="${can.nomCan}"/> <c:out value="${can.prenomCan}"/></td>
                                            <td><c:out value="${can.domaine}"/></td>
                                            <td><c:out value="${can.adresse}"/> &aacute; <c:out value="${can.villeCan}"/></td>
                                            <td>
                                                <ul class="nav">
                                                    <li>
                                                        <a href="<c:url value="/DetailServlet?action=detailcv&codeCan=${can.codeCan}&id=${sessionScope.sessionUtilisateur.code.code}"/>" class="btn-mini btn-info" type="submit">
                                                            <i class="icon-white icon-eye-open"></i> D&eacute;tails...
                                                        </a>
                                                    </li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </table>
                        </fieldset>
                    </div>
                </div>
                <div class="well sidebar-nav" style="padding: 10px 0">
                    <div class="row" style="margin-left:25px">
                        <fieldset>
                            <legend style="color: red">Quelques Offres de Formation les plus r&eacute;centes
                                <a href="<c:url value="/AfficheListeOffreServlet?affich=entreprise&offre=formation"/>" class="btn btn-danger" style="margin-left: 35px" type="submit">
                                    <i class="icon-white icon-eye-open"></i> Voir toutes...
                                </a>
                            </legend>
                            <table class="table table-striped">
                                <thead class="text-info">
                                <th></th>
                                <th>Postée le </th>
                                <th>Institut</th>
                                <th>Domaine</th>
                                <th>Addresse</th>
                                <th></th>
                                </thead>
                                <c:forEach items="${ requestScope.listForm}" var="form" varStatus="boucle">
                                    <c:if test="${ boucle.index < 4 }">
                                        <tr style="color: forestgreen">
                                            <td>
                                                <img class="img-polaroid" alt="logo" width="30px" height="30px" src="<c:url value="images/profil/images4.jpg"/>">
                                            </td>
                                            <td><c:out value="${form.dateOffreForm}"/></td>
                                            <td><c:out value="${form.codeIns.nomIns}"/></td>
                                            <td><c:out value="${form.domaine}"/></td>
                                            <td><c:out value="${form.adressForm}"/> &agrave;; <c:out value="${form.villeForm}"/></td>
                                            <td>
                                                <ul class="nav">
                                                    <li>
                                                        <a href="<c:url value="/DetailServlet?action=detailoffreformation&id=${sessionScope.sessionUtilisateur.code.code}&codeIns=${form.codeIns.codeIns}&codeOffreForm=${form.codeOffreForm}"/>" class="btn-mini btn-info" type="submit">
                                                            <i class="icon-white icon-eye-open"></i> D&eacute;tails...
                                                        </a>
                                                    </li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </table>
                        </fieldset>
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
