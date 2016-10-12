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
    <title>E-insertion | Information</title>
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
                <div class="well sidebar-nav">
                    <div class="row" style="margin-left:25px">
                        <fieldset>
                            <legend style="color: tomato">Offre de formation de <c:out value="${requestScope.institut.nomIns}"/></legend>
                            <table>
                                <tr>
                                    <td>
                                        <img class="img-polaroid" alt="logo" width="70px" height="70px" src="<c:url value="images/profil/logodefo.png"/>">
                                    </td>  
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="lead" style="font-style: italic"><label class="text-info">Offre de Formation post&eacute;e le :</label></td>
                                    <td><span class="label label-info" style="font-size: large"><i><c:out value="${requestScope.offreFormation.dateOffreForm}"/></i></span></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="lead" style="font-style: italic"><label class="text-info">Concernant la branche d'activit&eacute; :</label></td>
                                    <td><span class="label label-info" style="font-size: large"><i><c:out value="${requestScope.offreFormation.domaine}"/></i></span></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="lead" style="font-style: italic"><label class="text-info">Lieux de la Formation :</label></td>
                                    <td><span class="label label-info" style="font-size: large"><i><c:out value="${requestScope.offreFormation.adressForm}"/></i></span></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="lead" style="font-style: italic"><label class="text-info">Ville d&eacute;roulement de la Formation :</label></td>
                                    <td><span class="label label-info" style="font-size: large"><i><c:out value="${requestScope.offreFormation.villeForm}"/></i></span></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="lead" style="font-style: italic"><label class="text-info">Description de la Formation :</label></td>
                                    <td><span class="label label-info" style="font-size: large"><i><c:out value="${requestScope.offreFormation.descripForm}"/></i></span></td>
                                </tr>
                            </table>
                            <br/>
                            <table>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>
                                        <a href="#" class="btn btn-info" type="submit" style="width: 100px">
                                            <i class="icon-white icon-arrow-left"></i>&nbsp;Annuler
                                        </a>
                                    </td>
                                    <td>&nbsp;&nbsp;</td>
                                    <td>
                                        <a href="<c:url value="/InscriptionOffreFormationServlet?action=inscrire&idcan=${sessionScope.sessionUtilisateur.code.code}&idoffreform=${form.codeOffreForm}"/>" class="btn btn-info" type="submit" style="width: 100px; height: 20px">
                                            <i class="icon-white icon-pencil"></i>&nbsp;S'inscrire ici!
                                        </a>
                                    </td>
                                </tr>
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
