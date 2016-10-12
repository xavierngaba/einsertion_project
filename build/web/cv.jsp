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
    <title>E-insertion | CV</title>
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
      .span7 {
        padding: 0px 0;
      }
      .tab-pane active {
        margin-left: 15px;
      }
    </style>
  </head>

  <body>
    <!-- NAVBAR
    ================================================== -->
    <c:choose>
             <c:when test="${ empty sessionScope.sessionUtilisateur }">
                 <jsp:forward page="/index.jsp" />
             </c:when>
        <c:otherwise>
            <c:import url="vue/menu.jsp" />
            <div class="container-fluid">
                <div class="row-fluid">
                <div class="span3">
                    <div class="well sidebar-nav">
                        <c:import url="vue/login.jsp" />                     
                    </div>
                    <div class="well sidebar-nav">
                        <ul class="nav nav-list">
                            <li class="nav-header"><h5 style="color: #0088cc">Donn&eacute;es Personnelles</h5></li>
                       </ul>
                        <table>
                            <tr>
                                <td colspane="6">
                                    <img class="img-rounded" alt="Photo de profil" width="100px" height="100px" src="<c:url value="images/profil/profil.jpg"/>">
                                </td>
                                <td style="color: #ee5f5b">&nbsp;&nbsp;&nbsp;<c:out value="${requestScope.cv.objectif}"/></td>
                            </tr>
                        </table>
                        <br/>
                        <table>
                            <tr>
                                <td style="color: #000000">Nom : </td>
                                <td style="font-style: italic; color: #0480be"><c:out value="${sessionUtilisateur.nomCan}"/></td>
                            </tr>
                            <tr>
                                <td style="color: #000000">Prenom : </td>
                                <td style="font-style: italic ; color: #0480be"><c:out value="${sessionUtilisateur.prenomCan}"/></td>
                            </tr>
                            <tr>
                                <td style="color: #000000">&Acirc;ge : </td>
                                <td style="font-style: italic ; color: #0480be"><c:out value="${requestScope.age}"/> ans</td>
                            </tr>
                            <tr>
                                <td style="color: #000000">Adresse : </td>
                                <td style="font-style: italic; color: #0480be"><c:out value="${sessionUtilisateur.adresse}"/></td>
                            </tr>
                            <tr>
                                <td style="color: #000000">Ville : </td>
                                <td style="font-style: italic; color: #0480be"><c:out value="${sessionUtilisateur.villeCan}"/></td>
                            </tr>
                            <tr>
                                <td style="color: #000000">T&eacute;l&eacute;phone : </td>
                                <td style="font-style: italic; color: #0480be"><c:out value="${sessionUtilisateur.tel1Can}"/></td>
                            </tr>
                            <tr>
                                <td style="color: #000000">E-mail : </td>
                                <td style="font-style: italic; color: #0480be"><c:out value="${sessionUtilisateur.emailCan}"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="span7">
                    <div class="row" style="margin:25px 0px 25px 0px">
                        <c:if test="${!empty requestScope.cv.formationList}">
                          <a class="btn btn-primary" href="<c:url value="/PdfServlet?id=${sessionScope.sessionUtilisateur.codeCan}"/>"><i class="icon-print icon-white"></i> PDF</a>  
                        </c:if>
                    </div>
                    <div class="well sidebar-nav">
                        <div class="row" style="margin-left:25px">
                            <fieldset>
                                <legend>Compétences Personnelles</legend>
                                <c:choose>
                                    <c:when test="${ empty requestScope.cv.competenceList}">
                                        <div class="alert alert-info" style="width: 40%; margin-left: 30%;">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            Actuellement aucune information concernant vos Comp&eacute;tences n'est enregistr&eacute; sur notre plate-forme
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${ requestScope.cv.competenceList }" var="competence" varStatus="boucle">
                                            <table>
                                                <tr>
                                                    <td class="lead"><label class="nav-header" style="font-size: 15px; padding: 3px 0px"><c:out value="${competence.domaine}"/>&nbsp;&nbsp;</label></td>
                                                 </tr>
                                            </table>
                                            <table>
                                                 <tr>
                                                     <td class="lead"><label class="text-info">Sp&eacute;cialit&eacute;:</label></td>
                                                     <td class="lead"><label class="text-info"><b><c:out value="${competence.specialite}"/></b></label></td>
                                                </tr>
                                                <tr>
                                                    <td class="lead"><i class="icon-arrow-right"></i></td>
                                                    <td class="lead"><label class="text-info"><b><c:out value="${competence.libelleComp}"/></b></label></td>
                                                </tr>
                                            </table>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </fieldset>
                        </div>
                    </div>
                    <div class="well sidebar-nav">
                        <div class="row" style="margin-left:25px">
                            <fieldset>
                                <legend>Experience Professionnelle</legend>
                                <c:choose>
                                    <c:when test="${ empty requestScope.cv.experienceProList}">
                                        <div class="alert alert-info" style="width: 40%; margin-left: 30%;">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            Actuellement aucune information concernant vos Exp&eacute;rience professionnelles n'est enregistr&eacute;e sur notre plate-forme
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${ requestScope.cv.experienceProList }" var="experience" varStatus="boucle">
                                            <table>
                                             <tr>
                                                 <td class="lead"><label class="nav-header" style="font-size: 15px; padding: 3px 0px">De <c:out value="${experience.dateDebut}"/>  &agrave; <c:out value="${experience.dateFin}"/> :&nbsp;&nbsp;</label></td>
                                                 <td class="lead"><label class="nav-header" style="font-size: 13px"><b><c:out value="${experience.poste}"/> au sein de <c:out value="${experience.nomStructure}"/></b>&nbsp;&nbsp;</label></td>
                                              </tr>
                                             </table>
                                              <table>
                                                  <tr>
                                                     <td class="lead"><label class="text-info">Secteur d'activit&eacute; :</label></td>
                                                     <td class="lead"><label class="text-info"><b><c:out value="${experience.activiteStructure}"/></b></label></td>
                                                </tr>
                                              </table>
                                             <table>
                                                 <tr>
                                                     <td class="lead"><label class="text-info"><b><c:out value="${experience.tachesEffectuees}"/></b></label></td>
                                                 </tr>
                                             </table> 
                                         </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </fieldset>
                        </div>
                    </div>
                    <div class="well sidebar-nav">
                        <div class="row" style="margin-left:25px">
                            <fieldset>
                                <legend>Formation Academique ou Professionnelle</legend>
                                <c:choose>
                                    <c:when test="${ empty requestScope.cv.formationList}">
                                        <div class="alert alert-info" style="width: 40%; margin-left: 30%;">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            Actuellement aucune information concernant vos formations n'est enregistr&eacute; sur notre plate-forme
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                       <c:forEach items="${ requestScope.cv.formationList }" var="formation" varStatus="boucle">
                                            <table>
                                                 <tr>
                                                     <td class="lead"><label class="nav-header" style="font-size: 15px; padding: 3px 0px"><c:out value="${formation.diplome}"/>&nbsp;&nbsp;</label></td>
                                                  </tr>   
                                             </table>
                                             <table>
                                                 <tr>
                                                     <td class="lead"><label class="text-info " style="font-size: 13px">Option :</label></td>
                                                     <td class="lead"><label class="text-info" style="font-size: 15px"><b><c:out value="${formation.option}"/></b></label></td>
                                                </tr>
                                             </table>
                                              <table>
                                                 <tr>
                                                     <td class="lead"><label class="text-info " style="font-size: 13px">Etablissement d'obtention :</label></td>
                                                     <td class="lead"><label class="text-info" style="font-size: 15px"><b><c:out value="${formation.etablissement}"/></b></label></td>
                                                </tr>
                                             </table>
                                             <table>
                                                <tr>
                                                    <td class="lead"><label class="text-info" style="font-size: 13px">Ann&eacute; d'obtention:</label></td>
                                                    <td class="lead"><label class="text-info" style="font-size: 15px"><b><c:out value="${formation.anneeAca}"/></b></label></td>
                                                </tr>    
                                             </table>
                                        </c:forEach> 
                                    </c:otherwise>
                                </c:choose>
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
        </c:otherwise>
    </c:choose>
  </body>

</html>
