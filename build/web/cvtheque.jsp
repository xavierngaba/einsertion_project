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
    <title>E-insertion | CVthèque</title>
    <link rel="shortcut icon" type="image/png" href="<c:url value="images/logo.png"/>" />

    <!-- Le styles -->
    <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="resources/syntax/shCore.css">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="accueil.css" rel="stylesheet">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="bootstrap/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="bootstrap/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="bootstrap/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="bootstrap/ico/apple-touch-icon-57-precomposed.png">
    <script type="text/javascript" language="javascript" src="js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" language="javascript" src="resources/syntax/shCore.js"></script>
    <script type="text/javascript" language="javascript" class="init">
        $(document).ready(function() {
            var table = $('#example').DataTable({
                "language": {
                    "url": "fr_FR.txt"
                }
            } );
            new $.fn.dataTable.AutoFill( table );
            } );
    </script>
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
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
                <div class="span7" style="padding: 45px 0;">
                    <table id="example" class="table table-hover table-condensed" cellspacing="0" width="100%">
                        <thead>
                            <tr class="text-info">
                                <th></th>
                                <th>Nom & Pr&eacute;nom</th>
                                <th>Domaine</th>
                                <th>Consulter</th>
                            </tr>    
                        </thead>
                        <tbody>
                            <c:forEach items="${ requestScope.listCv }" var="cv" varStatus="boucle">
                                <tr>
                                    <td>
                                        <img class="img-polaroid" alt="logo" width="30px" height="30px" src="<c:url value="images/profil/profil.jpg"/>">
                                    </td>
                                    <td style="color: green; font-family: cursive; font-size: 15px">
                                        <b><c:out value="${cv.codeCan.nomCan}"/>&nbsp;<c:out value="${cv.codeCan.prenomCan}"/></b>
                                    </td>
                                    <td class="text-info"><c:out value="${cv.codeCan.domaine}"/></td>
                                    <td>
                                        <a href="<c:url value="/DetailServlet?action=detailcv&codeCan=${cv.codeCan.codeCan}&id=${sessionScope.sessionUtilisateur.code.code}"/>" class="btn-small btn-info" type="submit">
                                            <i class="icon-white icon-eye-open"></i>
                                        </a>
                                    </td>
                                </tr> 
                            </c:forEach>
                        </tbody>
                    </table>
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
    <script src="bootstrap/js/bootstrap-dropdown.js"></script>
  </body>
</html>
