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
    <title>E-insertion | Offre d'Emploi</title>
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
    <c:if test="${requestScope.type == 'Entreprise'}">
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
                        <table>
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${message == 'vide'}">
                                            <div class="alert alert-info" style="width: 40%; margin-left: 22%; margin-top: 10px">
                                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                Actuellement aucune candidature n'a &eacute;t&eacute; sollicit&eacute; pour vos offres d'emploi sur notre plate-forme
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <table id="example" class="table table-hover table-condensed" cellspacing="0">
                                                <thead>
                                                    <tr style="color: seagreen">
                                                        <th style="width: 175px">Nom et Pr&eacute;nom</th>
                                                       <th>Poste</th>
                                                       <th>Postul&eacute; le</th>
                                                       <th style="width: 100px">cv</th>
                                                       <th>lettre de motivation</th>
                                                   </tr>
                                               </thead>
                                               <c:forEach items="${ requestScope.listPost}" var="postulat" varStatus="i">
                                                    <tbody>
                                                         <tr>
                                                             <td style="font-style: italic; font-size: 20px" class="text-info">
                                                                 <c:out value="${postulat.getCandidat().getNomCan()}"/> &nbsp; <c:out value="${postulat.getCandidat().getPrenomCan()}"/>  
                                                             </td>
                                                             <td>
                                                                 <label style="color: red"> <c:out value="${postulat.getOffreEmploi().getPoste()}"/> </label>
                                                             </td>
                                                             <td>
                                                                 <label style="color: red"> <c:out value="${postulat.datePost}"/> </label>
                                                             </td>
                                                             <td>
                                                                 <a href="<c:url value="/DetailServlet?action=detailcv&codeCan=${postulat.getCandidat().getCodeCan()}&id=${sessionScope.sessionUtilisateur.code.code}"/>" class="btn-small btn-info" type="submit">
                                                                     <i class="icon-white icon-eye-open"></i> D&eacute;tails...
                                                                 </a>
                                                             </td>
                                                             <td>
                                                                 <a href="<c:url value="/AffichageLettreServlet?&codeCan=${postulat.getCandidat().codeCan}&codeEnt=${sessionScope.sessionUtilisateur.code.code}&codeOffreEmp=${postulat.getOffreEmploi().codeOffreEmp}"/>" class="btn-small btn-info" type="submit">
                                                                     <i class="icon-white icon-eye-open"></i> Lire...
                                                                 </a>
                                                             </td>
                                                         </tr>
                                                     </tbody>
                                               </c:forEach>
                                           </table>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>   
                            <tr>
                                <td>
                                    <a class="btn btn-primary" href="<c:url value="/OffreEmploiServlet?action=affich&id=${sessionScope.sessionUtilisateur.codeEnt}&codeOffreEmp=null"/>"><i class="icon-arrow-left icon-white"></i>&nbsp;Retour</a>
                                </td>
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
    </c:if>
    <c:if test="${requestScope.type == 'Candidat'}">
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
                        </div>
                        <div class="span7">
                            <c:choose>
                                <c:when test="${message == 'vide'}">
                                    <div class="alert alert-info" style="width: 40%; margin-left: 22%; margin-top: 10px">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        Actuellement vous n'avez sollicit&eacute; aucune offre d'emploi sur notre plate-forme
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${ requestScope.Candidat.postulatList}" var="postulat" varStatus="i">
                                        <c:forEach items="${ requestScope.offreEmploiList}" var="offreEmploi" varStatus="j">
                                            <c:if test="${i.index == j.index}">
                                                <div class="well sidebar-nav">
                                                    <div class="row-fluid">
                                                        <div class="span6">
                                                            <p class="text-info">
                                                                <i class=" icon-flag icon-white"></i>
                                                                <strong>Candidature n° <c:out value="${i.index}"/> pour l'offre N°<c:out value="${offreEmploi.codeOffreEmp}"/></strong> 
                                                            </p>  
                                                        </div>
                                                        <div class="span6">
                                                            <p class="lead">
                                                                Candidature pour le poste de <c:out value="${offreEmploi.poste}"/> &agrave; <c:out value="${offreEmploi.villePoste}"/> 
                                                                soumis le <c:out value="${postulat.datePost}"/>
                                                            </p>
                                                            <p>
                                                                
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </c:otherwise>
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
    </c:if>
    <script src="bootstrap/js/bootstrap-dropdown.js"></script>
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
  </body>

</html>
