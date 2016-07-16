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
    <title>E-insertion | Fiche d'Inscription</title>
    <link rel="shortcut icon" type="image/png" href="<c:url value="images/logo.png"/>" />

    <!-- Le styles -->
    <link rel="stylesheet" href="bibliotheque/themes/base/jquery.ui.all.css">
    <link href="accueil.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="bootstrap/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="bootstrap/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="bootstrap/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="bootstrap/ico/apple-touch-icon-57-precomposed.png">
    <script src="bibliotheque/jquery-1.9.1.js"></script>
    <script src="bibliotheque/ui/jquery.ui.core.js"></script>
    <script src="bibliotheque/ui/jquery.ui.widget.js"></script>
    <script src="bibliotheque/ui/jquery.ui.datepicker.js"></script>
    <script src="bibliotheque/ui/i18n/jquery.ui.datepicker-fr.js"></script>
    <script>
            $(function() {
                    $( "#datepicker" ).datepicker({
                            dateFormat: 'yy-mm-dd',
                            changeMonth: true,
                            changeYear: true
                    });
                    $( "#datepicker" ).datepicker($.datepicker.regional[ "fr" ]);
            });
    </script>
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
    <!-- NAVBAR
    ================================================== -->
        <c:import url="vue/menuac.jsp" />
        <div class="container-fluid">
            <div class="row-fluid">
            <div class="span3">
                <div class="well sidebar-nav">
                    <c:import url="vue/login.jsp" />
                </div>
            </div>
            <div class="span7">
                <div class="tabbable"> <!-- Only required for left/right tabs -->
                    <ul class="nav nav-tabs">
                        <c:choose>
                            <c:when test="${!empty requestScope.erreur}">
                                <c:if test="${requestScope.erreur == 'ErreurCandidat'}">
                                    <li class="active"><a href="#tab1" data-toggle="tab">Candidat</a></li>
                                    <li><a href="#tab2" data-toggle="tab">Entreprise</a></li>
                                    <li><a href="#tab3" data-toggle="tab">Institut de Formation</a></li>
                                </c:if>
                                <c:if test="${requestScope.erreur == 'ErreurEntreprise'}">
                                    <li><a href="#tab1" data-toggle="tab">Candidat</a></li>
                                    <li class="active"><a href="#tab2" data-toggle="tab">Entreprise</a></li>
                                    <li><a href="#tab3" data-toggle="tab">Institut de Formation</a></li>
                                </c:if>
                                <c:if test="${requestScope.erreur == 'ErreurInstitut'}">
                                    <li><a href="#tab1" data-toggle="tab">Candidat</a></li>
                                    <li><a href="#tab2" data-toggle="tab">Entreprise</a></li>
                                    <li class="active"><a href="#tab3" data-toggle="tab">Institut de Formation</a></li>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <li class="active"><a href="#tab1" data-toggle="tab">Candidat</a></li>
                                <li><a href="#tab2" data-toggle="tab">Entreprise</a></li>
                                <li><a href="#tab3" data-toggle="tab">Institut de Formation</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                    <div class="tab-content">
                        <c:import url="vue/inscriptioncandidat.jsp" />
                        <c:import url="vue/inscriptionentreprise.jsp" />
                        <c:import url="vue/inscriptioninstitut.jsp" />
                    </div>
                </div>
               <c:if test="${ form.resultat == 'echec' }">
                    <div class="alert alert-error" style="width: 40%; margin-left: 30%;">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <h4>Echec!</h4>
                        Veuillez r&eacute;essayez le processus....
                    </div>
                </c:if>
                <c:if test="${ form.resultat == 'succes' }">
                    <div class="alert alert-success" style="width: 40%;">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <h4>Succ&egrave;s!</h4>
                        Inscription réussi...
                   </div>
                </c:if>
            </div>
            <div class="span2">
                <c:import url="vue/sidebar.jsp" />
            </div>
        </div>
      <div class="container marketing">
          <c:import url="vue/footer.jsp" />
      </div>
        </div>
    <script src="bootstrap/js/bootstrap-tab.js"></script>
    <script src="bootstrap/js/bootstrap-alert.js"></script>
  </body>
</html>
