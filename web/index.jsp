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
        padding-bottom: 40px;
      }
      h2 {
          margin-left: 15px;
      }
      .tab-pane active {
        margin-left: 15px;
      }
    </style>
  </head>

  <body>
    <!-- NAVBAR
    ================================================== -->
    <div class="navbar-wrapper">
    <!-- Wrap the .navbar in .container to center it within the absolutely positioned parent. -->
    </div>
    
    <c:import url="vue/carousel.jsp" />
    
        <div class="row-fluid">
            <div class="span3">
                <div class="well sidebar-nav">
                    <c:import url="vue/login.jsp" />
                </div>
            </div>
            <div class="span7">
                <div class="tabbable">                   
                    <div class="well sidebar-nav">
                        <div class="row">
                            <a href="<c:url value="/AffichageServlet?affich=candidatinconnu"/>">
                            <div class="span3" style="margin-left:70px" >
                                <h2>Espace Candidat</h2>
                                <img class="img-rounded" alt="Photo de candidat" width="200px" height="250px" src="<c:url value="bootstrap/img/index.jpg"/>">
                            </div>
                            </a>
                            <a href="#">
                                <div class="span3" style="margin-left:70px" >
                                    <h2>Espace Entreprise</h2>
                                    <img class="img-rounded" alt="Photo de l'entreprise" width="200px" height="250px" src="<c:url value="bootstrap/img/espaceentreprise.jpg"/>">
                                </div>    
                            </a>
                            <a href="#">
                                <div class="span3" style="margin-left:70px" >
                                    <h2>Espace Institution</h2>
                                    <img class="img-rounded" alt="Photo de l'institution" width="200px" height="250px" src="<c:url value="bootstrap/img/espaceinstitution.jpg"/>">
                                </div>
                            </a>
                        </div>  
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
