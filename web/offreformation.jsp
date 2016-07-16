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
            <c:import url="vue/menuinstitut.jsp" />
        <div class="container-fluid">
            <div class="row-fluid">
            <div class="span3">
                <div class="well sidebar-nav">
                    <c:import url="vue/login.jsp" />
                </div>
            </div>
            <div class="span7">
                <div id="affichoffreformation">
                    <table>
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="btn btn-primary" href="#" onclick="hide('affichoffreformation');show('ajoutoffreformation');"><i class="icon-plus icon-white"></i>                               
                                    Ajouter une nouvelle formation acad&eacute;mique ou professionnelle
                                </button>
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <table>
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${ empty requestScope.listForm or requestScope.formation == 'vide'}">
                                        <div class="alert alert-info" style="width: 40%; margin-left: 22%; margin-top: 10px">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            Actuellement aucune information concernant vos formations n'est enregistr&eacute; sur notre plate-forme
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <table id="example" class="table table-hover table-condensed" cellspacing="0" width="100%">
                                             <thead>
                                                 <tr style="color: red">
                                                    <th></th>
                                                    <th>Domaine</th>
                                                    <th style="width: 150px">Post&eacute;e le</th>
                                                    <th style="width: 150px">Lieux</th>
                                                    <th>Action</th>
                                                    <th style="width: 100px"></th>
                                                </tr>
                                            </thead>
                                            <c:forEach items="${ requestScope.listForm}" var="form" varStatus="boucle">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <img class="img-polaroid" alt="logo" width="30px" height="30px" src="<c:url value="images/profil/images4.jpg"/>">
                                                    </td>
                                                    <td style="font-style: italic; font-size: 15px; width: 150px" class="text-info">
                                                        <c:out value="${form.domaine}"/>
                                                    </td>
                                                    <td style="font-style: italic; font-size: 15px" class="text-info">
                                                        <c:out value="${form.dateOffreForm}"/>
                                                    </td>
                                                    <td style="font-style: italic; font-size: 15px" class="text-info">
                                                        <c:out value="${form.adressForm}"/> &agrave; <c:out value="${form.villeForm}"/>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-mini btn-inverse" href="<c:url value="/OffreEmploiServlet?action=modifoffreform&id=${sessionScope.sessionUtilisateur.codeIns}&codeOffreForm=${form.codeOffreForm}"/>"><i class="icon-pencil icon-white"></i></a>
                                                        <a class="btn btn-mini btn-danger" href="#"><i class="icon-remove icon-white"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="<c:url value="/DetailServlet?action=detailoffreformation&id=${sessionScope.sessionUtilisateur.code.code}&codeIns=${form.codeIns.codeIns}&codeOffreForm=${form.codeOffreForm}"/>" class="btn btn-mini btn-inverse">
                                                            <i class="icon-white icon-eye-open"></i> <span class="badge badge-info"><c:out value="${requestScope.nbInscrits[boucle.index]}"/></span>
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
                    </table>
                </div>
                <div id="ajoutoffreformation" style="display:none;">
                    <form action="<c:url value="/OffreFormationServlet"/>" method="post">
                        <input type="hidden" name="codeIns" value="<c:out value="${sessionScope.sessionUtilisateur.codeIns}"/>"/>
                        <input type="hidden" name="action" value="ajoutoffreform"/>
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
                                                    <input class="input" type="text" name="adresse_form" placeholder="Adresse">
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
                                                    <span class="add-on"><i class="icon-globe"></i></span>
                                                    <input class="input" type="text" name="ville_form" placeholder="Ville">
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
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="input-prepend">
                                                    <span class="add-on"><i class="icon-comment"></i></span>
                                                    <textarea class="input" rows="7" style="width:650px" name="descr_ent" placeholder="Saississez la description de la formation"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
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
                                    <td><button class="btn btn-danger" type="reset" onclick="hide('ajoutoffreformation');show('affichoffreformation');"><i class="icon-remove icon-white"></i> Annuler</button></td>
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
    <script>
        function hide(hide){
                        document.getElementById(hide).style.display = "none";
                }
        function show(show){
                        document.getElementById(show).style.display = "block";
                }
    </script>
        </c:otherwise>
    </c:choose>
    <script src="bootstrap/js/bootstrap-dropdown.js"></script>    
  </body>

</html>
