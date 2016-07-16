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
    <title>E-insertion | Les Offres de Formation</title>
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
        <c:if test="${ type == 'Candidat' }">
            <c:import url="vue/menu.jsp" />
        </c:if>
        <c:if test="${ type == 'Entreprise' }">
            <c:import url="vue/menuentreprise.jsp" />
        </c:if>
        <c:if test="${ type == 'Institut' }">
            <c:import url="vue/menuinstitut.jsp" />
        </c:if>
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
                                    <legend style="color: forestgreen;  font-size: 25px; font-style: italic; font-family: monospace"><c:out value="${requestScope.Institut.nomIns}"/></legend>
                                      <c:forEach items="${ requestScope.Institut.offreFormationList}" var="offreFormation" varStatus="boucle">
                                          <div class="span3" style="margin-left:50px" >
                                              <img class="img-rounded" data-src="holder.js/80x80" height="120px" width="120px" src="<c:url value="images/profil/images3.jpg"/>">
                                              <p><label><b>Propose une formation en</b></label>
                                              <label class="text-info" style="font-size: 20px; font-family: cursive"><c:out value="${offreFormation.domaine}"/></label>
                                              <label><b>Lieu :</b></label>
                                              <label style="font-size: 15px; font-family: cursive; color: red"><c:out value="${offreFormation.adressForm}"/> &agrave; <c:out value="${offreFormation.villeForm}"/></label>
                                              <a class="btn btn-info" href="<c:url value="/DetailServlet?action=detailoffreformation&id=${sessionScope.sessionUtilisateur.code.code}&codeIns=${offreFormation.codeIns.codeIns}&codeOffreForm=${offreFormation.codeOffreForm}"/>"><i class="icon-white icon-eye-open"></i>D&eacute;tails...</a></p>
                                          </div>  
                                      </c:forEach>  
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
