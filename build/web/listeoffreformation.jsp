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
    <title>E-insertion | Offre de Formation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
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
                <table id="example" class="table table-hover table-condensed" cellspacing="0" width="100%">
                    <thead>
                            <tr style="color: seagreen">
                                <th></th>
                                <th>Instituts</th>
                                <th>Domaines</th>
                                <th>Quartiers</th>
                                <th>Villes</th>
                                <th></th>
                            </tr>    
                        </thead>
                        <tbody>
                            <c:forEach items="${ requestScope.listForm }" var="form" varStatus="boucle">
                                <tr>
                                    <td>
                                        <img class="img-polaroid" alt="logo" width="25px" height="25px" src="<c:url value="images/profil/images4.jpg"/>">
                                    </td>
                                    <td style="font-style: italic; font-size: 20px" class="text-info">
                                        <c:out value="${form.codeIns.nomIns}"/>
                                    </td>
                                    <td style="width: 280px">
                                        <label style="color: red">
                                            <c:out value="${form.domaine}"/>
                                        </label>
                                    </td>
                                    <td style="font-style: italic; font-size: 15px" class="text-info">
                                        <c:out value="${form.adressForm}"/>
                                    </td>
                                    <td style="font-style: italic; font-size: 15px" class="text-info">
                                        <c:out value="${form.villeForm}"/>
                                    </td>
                                    <td>
                                        <a href="<c:url value="/DetailServlet?action=detailoffreformation&id=${sessionScope.sessionUtilisateur.code.code}&codeIns=${form.codeIns.codeIns}&codeOffreForm=${form.codeOffreForm}"/>" class="btn-mini btn-info" type="submit">
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