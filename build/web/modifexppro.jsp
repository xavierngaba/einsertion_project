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
    <title>E-insertion | Mon Profil</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" type="image/png" href="<c:url value="images/logo.png"/>" />

    <!-- Le styles -->
    <link rel="stylesheet" href="bibliotheque/themes/base/jquery.ui.all.css">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="accueil.css" rel="stylesheet">
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
    <script>
            $(function() {
                    $( "#datepicker2" ).datepicker({
                            dateFormat: 'yy-mm-dd',
                            changeMonth: true,
                            changeYear: true
                    });
                    $( "#datepicker2" ).datepicker($.datepicker.regional[ "fr" ]);
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
                            <div class="tabbable"> <!-- Only required for left/right tabs -->
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab2" data-toggle="tab">Exp&eacute;rience Professionnelle</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab2">
                                        <form action="<c:url value="/ExperienceServlet"/>" method="post">
                                            <input type="hidden" name="codeCan" value="<c:out value="${sessionScope.sessionUtilisateur.codeCan}"/>"/>
                                            <input type="hidden" name="codeExp" value="<c:out value="${experience.codeExp}"/>"/>
                                            <input type="hidden" name="action" value="modifexp"/>
                                            <div class="row" style="margin-left:25px">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <div class="control-group">
                                                                <div class="controls">
                                                                    <div class="input-prepend">
                                                                        <span class="add-on"><i class="icon-home"></i></span>
                                                                        <input type="text" name="nomStructure" placeholder="nom de la structure" value="<c:out value="${experience.nomStructure}"/>">
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
                                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                                        <input type="text" name="activiteStructure" placeholder="activité de la structure" value="<c:out value="${experience.activiteStructure}"/>">
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
                                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                                        <input type="text" name="poste" placeholder="Poste occupé" value="<c:out value="${experience.poste}"/>">
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
                                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                                        <input type="text" class="input" id="datepicker" name="date_debut" placeholder="Date de début" value="<c:out value="${experience.dateDebut}"/>"/>
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
                                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                                        <input type="text" class="input" id="datepicker2" name="date_fin" placeholder="Date de fin" value="<c:out value="${experience.dateFin}"/>"/>
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
                                                                        <textarea name="tachesEffectuees" placeholder="description des tâches effectuées au sein de la structure" style="width: 700px; height: 100px"><c:out value="${experience.tachesEffectuees}"/></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                                <table>
                                                    <tr style="margin-left: 40px">
                                                        <td><a class="btn btn-danger" href="<c:url value="/ProfilCandidatServlet?action=affiche&id=${sessionScope.sessionUtilisateur.codeCan}&codeform=null&codecomp=null&codeexp=null"/>"><i class="icon-remove icon-white"></i> Annuler</a></td>
                                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        <td><button class="btn btn-info" type="submit"><i class="icon-plus icon-white"></i> Valider</button></td>
                                                    </tr>
                                                </table>
                                            </div>
                                          </form>
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
            </div>
            <script src="bootstrap/js/bootstrap-modal.js"></script>
            <script src="bootstrap/js/bootstrap-dropdown.js"></script>
            <script src="bootstrap/js/bootstrap-tab.js"></script>
            <script src="bootstrap/js/bootstrap-button.js"></script> 
          </c:otherwise>
     </c:choose>
    <!-- NAVBAR
    ================================================== -->    
  </body>

</html>
