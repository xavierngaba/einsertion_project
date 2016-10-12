 <%-- 
    Document   : partenaires
    Created on : Aug 6, 2014, 5:05:35 PM
    Author     : Dry Bass
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.joda.org/joda/time/tags"  prefix="joda" %>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <title>E-insertion | D&eacute;tail Offre Emploi</title>
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
      dd {
          line-height: 1.5;
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
        <c:if test="${ type == 'Candidat' }">
            <c:import url="vue/menu.jsp" />
        </c:if>
        <c:if test="${ type == 'Entreprise' }">
            <c:import url="vue/menuentreprise.jsp" />
        </c:if>
        <c:if test="${ type == 'Institut' }">
            <c:import url="vue/menuinstitut.jsp" />
        </c:if>
            <div class="row-fluid">
                    <div class="span3">
                        <div class="well sidebar-nav">
                            <c:import url="vue/login.jsp" />
                        </div>
                        <div class="well sidebar-nav" style="padding: 10px 0; padding-left: 10px">
                            <table>
                                <tr>
                                    <td style="color: #0088cc; font-style: italic; font-size: 20px">Publi&eacute;e par: </td>
                                    <td style="color: seagreen; font-style: italic; font-size: 25px"><c:out value="${requestScope.OffreEmploi.codeEnt.nomEnt}"/></td>
                                </tr>
                            </table>
                        </div>
                        <div class="well sidebar-nav" style="padding: 10px 0; padding-left: 25px">    
                            <table>
                                <tr>
                                    <dl>
                                        <dt style="color: #0088cc; font-style: italic">Secteur d'activit&eacute;</dt>
                                        <dd style="color: seagreen; font-style: italic"><c:out value="${requestScope.OffreEmploi.codeEnt.sectAct}"/></dd>
                                    </dl>
                                    <dl>
                                        <dt style="color: #0088cc; font-style: italic">Description de l'entreprise</dt>
                                        <dd style="color: seagreen; font-style: italic"><c:out value="${requestScope.OffreEmploi.codeEnt.descrEnt}"/></dd>
                                    </dl>
                                </tr>
                            </table>
                            <address>
                                <strong style="color: #0088cc; font-style: italic">Contact</strong><br>
                                <abbr title="Phone" style="color: seagreen; font-style: italic">Tel: (237) <c:out value="${requestScope.OffreEmploi.codeEnt.telEnt}"/></abbr><br>
                                <a style="color: tomato;" href="mailto:<c:out value="${requestScope.OffreEmploi.codeEnt.emailEnt}"/>"><c:out value="${requestScope.OffreEmploi.codeEnt.emailEnt}"/></a><br>
                                <a href="<c:url value="${requestScope.OffreEmploi.codeEnt.siteEnt}"/>"><c:out value="${requestScope.OffreEmploi.codeEnt.siteEnt}"/></a>
                            </address>
                        </div>
                    </div>
                    <div class="span7">
                        <div class="well sidebar-nav" style="padding: 10px 0">
                            <div class="row" style="margin-left: 25px">
                               <dl>
                                   <dt style="color: tomato; font-size: 25px">Domaine d'expertise</dt><br/>
                                   <dd class="text-info" style="font-size: 20px; margin-left: 35px">
                                       <i class="icon-arrow-right icon-bold"></i> <c:out value="${requestScope.OffreEmploi.domaine}"/>
                                   </dd>
                                </dl>
                               <dl>
                                  <dt style="color: tomato; font-size: 25px">Description du Poste</dt><br/>
                                  <dd class="text-info" style="font-size: 20px; margin-left: 35px">
                                      <i class="icon-arrow-right icon-bold"></i> <c:out value="${requestScope.OffreEmploi.descripPoste}"/>
                                  </dd>
                                </dl>
                                <dl>
                                  <dt style="color: tomato; font-size: 25px">Profil souhait&eacute;</dt><br/>
                                  <dd class="text-info" style="font-size: 20px; margin-left: 35px">
                                      <i class="icon-arrow-right icon-bold"></i> <c:out value="${requestScope.OffreEmploi.qualiteReq}"/>
                                  </dd>
                                </dl>
                                <dl>
                                  <dt style="color: tomato; font-size: 25px">Lieu de Travail</dt><br/>
                                  <dd class="text-info" style="font-size: 20px; margin-left: 35px">
                                      <i class="icon-arrow-right icon-bold"></i> &agrave; <c:out value="${requestScope.OffreEmploi.adressePost}"/> dans la ville de <c:out value="${requestScope.OffreEmploi.villePoste}"/>
                                  </dd>
                                </dl>
                            </div>
                                <table>
                                    <tr>
                                        <c:if test="${ type == 'Candidat' }">
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>                             
                                            <a class="btn btn-primary" href="<c:url value="/DetailServlet?action=affichoffreemploient&id=${sessionScope.sessionUtilisateur.code.code}&codeEnt=${Entreprise.codeEnt}"/>"><i class="icon-arrow-left icon-white"></i>&nbsp;Retour</a><br/>
                                        </td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            <td>
                                                <a class="btn btn-primary" href="<c:url value="/PostulationServlet?action=effectuer&id=${sessionScope.sessionUtilisateur.codeCan}&codeEnt=${Entreprise.codeEnt}&codeOffreEmp=${OffreEmploi.codeOffreEmp}"/>">Postuler&nbsp;<i class="icon-arrow-right icon-white"></i></a><br/>
                                            </td>
                                        </c:if>
                                    </tr>                   
                                </table>
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
