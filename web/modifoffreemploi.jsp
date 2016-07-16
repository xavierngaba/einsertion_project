 <%-- 
    Document   : partenaires
    Created on : Aug 6, 2014, 5:05:35 PM
    Author     : Dry Bass
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  uri="http://www.joda.org/joda/time/tags" prefix="joda"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <title>E-insertion | Offre d'Emploie</title>
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
      .span7{
          padding: 45px 0;
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
            <c:import url="vue/menuentreprise.jsp" />
        <div class="container-fluid">
            <div class="row-fluid">
            <div class="span3">
                <div class="well sidebar-nav">
                    <c:import url="vue/login.jsp" />
                </div>
            </div>
            <div class="span7">
                <div>
                    <form action="<c:url value="/OffreEmploiServlet"/>" method="post">
                        <input type="hidden" name="codeEnt" value="<c:out value="${sessionScope.sessionUtilisateur.codeEnt}"/>"/>
                        <input type="hidden" name="codeOffreEmp" value="<c:out value="${OffreEmploi.codeOffreEmp}"/>"/>
                        <input type="hidden" name="action" value="modifoffreemp"/>
                        <div class="row" style="margin-left:25px">
                            <table>
                                <tr>
                                    <td>
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="input-prepend">
                                                    <span class="add-on"><i class="icon-briefcase"></i></span>
                                                    <select class="input-xlarge" name="domaine">
                                                        <c:import url="vue/domaine.jsp"/>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="input-prepend">
                                                    <span class="add-on"><i class="icon-map-marker"></i></span>
                                                    <input class="input" type="text" name="poste" placeholder="poste" value="<c:out value="${OffreEmploi.poste}"/>">
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="input-prepend">
                                                    <span class="add-on"><i class="icon-comment"></i></span>
                                                    <textarea class="input" rows="7" style="width:650px" name="descrip_poste" placeholder="Saississez la description du poste..."><c:out value="${OffreEmploi.descripPoste}"/></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </td>&nbsp;
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="input-prepend">
                                                    <span class="add-on"><i class="icon-comment"></i></span>
                                                    <textarea class="input" rows="7" style="width:650px" name="qualite_req" placeholder="Saississez les qualités requises pour l'offre d'emploie..."><c:out value="${OffreEmploi.qualiteReq}"/></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </td>&nbsp;
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="input-prepend">
                                                    <span class="add-on"><i class="icon-map-marker"></i></span>
                                                    <input class="input" type="text" name="ville_poste" placeholder="Ville" value="<c:out value="${OffreEmploi.villePoste}"/>">
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="input-prepend">
                                                    <span class="add-on"><i class="icon-map-marker"></i></span>
                                                    <input class="input" type="text" name="adresse_poste" placeholder="Adresse" value="<c:out value="${OffreEmploi.adressePost}"/>">
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td><a class="btn btn-danger" href="<c:url value="/OffreEmploiServlet?action=affich&id=${sessionScope.sessionUtilisateur.codeEnt}&codeOffreEmp=null"/>"><i class="icon-remove icon-white"></i> Annuler</a></td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td><button class="btn btn-info" type="submit" name=""><i class="icon-plus icon-white"></i> Valider</button></td>
                                </tr>
                            </table>
                        </div>
                      </form>
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
        function hide(hide){
                        document.getElementById(hide).style.display = "none";
                }
        function show(show){
                        document.getElementById(show).style.display = "block";
                }
    </script>
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
