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
    <title>E-insertion | Lettre de Motivation</title>
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
                    <c:choose>
                    <c:when test="${!empty requestScope.message}">
                        <c:if test="${ message == 'vide' }">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <h4>Echec!</h4>
                                Aucune lettre de motivation n'a &eacute;t&eacute; envoy&eacute; par le candidat pour cette offre
                            </div>
                            </c:if>
                        <c:if test="${ message == 'ok' }">
                            <p style="text-align: justify; margin: 3px 25px">
                                <c:out value="${lettre.libelle}"/>
                            </p>
                        </c:if>
                    </c:when>
                    </c:choose>
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
