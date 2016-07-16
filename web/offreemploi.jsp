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
    <script src="bibliotheque/jquery-1.9.1.js"></script>
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
            <c:import url="vue/menuentreprise.jsp" />
        <div class="container-fluid">
            <div class="row-fluid">
            <div class="span3">
                <div class="well sidebar-nav">
                    <c:import url="vue/login.jsp" />
                </div>
            </div>
            <div class="span7">
                <div id="affichoffreemploi">
                    <table>
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button id="affiche" class="btn btn-primary" href="#"><i class="icon-plus icon-white"></i>                               
                                    Ajouter une nouvelle Offre d'Emploi
                                </button>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${ empty requestScope.listOffreEmp or requestScope.emploi == 'vide'}">
                                        <div class="alert alert-info" style="width: 40%; margin-left: 22%; margin-top: 10px">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            Actuellement aucune information concernant vos offres d'emploi n'est enregistr&eacute; sur notre plate-forme
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <br/>
                                        <table id="example" class="table table-hover table-condensed" cellspacing="0" width="100%">
                                             <thead>
                                                 <tr style="color: seagreen">
                                                    <th></th>
                                                    <th>Domaine</th>
                                                    <th>Publi&eacute;</th>
                                                    <th>Action</th>
                                                    <th>Postulants</th>
                                                </tr>
                                            </thead>
                                            <c:forEach items="${ requestScope.listOffreEmp}" var="form" varStatus="boucle">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <img class="img-polaroid" alt="logo" width="25px" height="25px" src="<c:url value="images/profil/images5.jpg"/>">
                                                        </td>
                                                        <td style="font-style: italic; font-size: 15px" class="text-info">
                                                            <c:out value="${form.domaine}"/>
                                                        </td>
                                                        <td style="font-style: italic; font-size: 15px" class="text-info">
                                                            le <c:out value="${form.dateOffreEmp}"/>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-mini btn-inverse" href="<c:url value="/OffreEmploiServlet?action=modifoffreemp&id=${sessionScope.sessionUtilisateur.codeEnt}&codeOffreEmp=${form.codeOffreEmp}"/>"><i class="icon-pencil icon-white"></i></a>
                                                            <a class="btn btn-mini btn-danger" href="<c:url value="/OffreEmploiServlet?action=suproffreemp&id=${sessionScope.sessionUtilisateur.codeEnt}&codeOffreEmp=${form.codeOffreEmp}"/>"><i class="icon-remove icon-white"></i></a>
                                                        </td>
                                                        <td> 
                                                            <a class="btn btn-mini btn-inverse" href="<c:url value="/PostulationServlet?action=affichpostulation&codeUser=${sessionScope.sessionUtilisateur.code.code}&codeOffreEmp=${form.codeOffreEmp}"/>"><i class="icon-eye-open icon-white"></i> <span class="badge badge-info"><c:out value="${requestScope.nbPostulat[boucle.index]}"/></span></a>
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
                <div id="ajoutoffreemploi" style="display:none;">
                    <form action="<c:url value="/OffreEmploiServlet"/>" method="post">
                        <input type="hidden" name="codeEnt" value="<c:out value="${sessionScope.sessionUtilisateur.codeEnt}"/>"/>
                        <input type="hidden" name="action" value="ajoutoffreEmp"/>
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
                                                    <input class="input" type="text" name="poste" placeholder="poste" value="">
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
                                                    <textarea class="input" rows="7" style="width:650px" name="descrip_poste" placeholder="Saississez la description du poste..."></textarea>
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
                                                    <textarea class="input" rows="7" style="width:650px" name="qualite_req" placeholder="Saississez les qualités requises pour l'offre d'emploie..."></textarea>
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
                                                    <input class="input" type="text" name="ville_poste" placeholder="Ville" value="">
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
                                                    <input class="input" type="text" name="adresse_poste" placeholder="Adresse" value="">
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
                                    <td><button id="masque" class="btn btn-danger" type="reset"><i class="icon-remove icon-white"></i> Annuler</button></td>
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
        <script type="text/javascript">
            $(document).ready(function() {
                $('#ajoutoffreemploi').hide();
                $('#affiche').click(function(){
                  $('#affichoffreemploi').hide('5000');
                  $('#ajoutoffreemploi').show('5000');
                });
                $('#masque').click(function(){
                  $('#affichoffreemploi').show('5000');
                  $('#ajoutoffreemploi').hide('5000');
                });
              });
        </script>
        </c:otherwise>
    </c:choose>
    <script src="bootstrap/js/bootstrap-dropdown.js"></script>    
  </body>

</html>
