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
      table{
          margin-bottom: 10px
      }
      .span7 {
        padding: 45px 0;
      }
      .tab-pane active {
        margin-left: 15px;
      }
      #charge {
        position: absolute;
        left: 310px;
        top: 50px;
        visibility:hidden;
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
                                    <li class="active"><a href="#tab1" data-toggle="tab">R&eacute;sum&eacute;</a></li>
                                    <li><a href="#tab2" data-toggle="tab">Formations</a></li>
                                    <li><a href="#tab3" data-toggle="tab">Exp&eacute;riences</a></li>
                                    <li><a href="#tab4" data-toggle="tab">Comp&eacute;tences</a></li>
                                    <li><a href="#tab5" data-toggle="tab">Donn&eacute;es personnelles</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab1">
                                        <div id="affiche">
                                           <table>
                                                <tr>
                                                    <td colspane="7">
                                                        <img class="img-polaroid" alt="Photo de profil" width="210px" height="210px" src="<c:url value="images/profil/profil.jpg"/>">
                                                    </td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                    <td class="lead"><label class="text-error" style="font-style: italic; font-size: 1.1em"><c:out value="${requestScope.cv.objectif}"/></label></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <button class="btn btn-primary" href="#"><i class="icon-pencil icon-white"></i> Modifier votre photo de Profil</button>
                                                    </td>
                                                </tr>
                                             </table>
					     <br/>
                                             <table>
                                                <tr>
                                                    <td class="lead" style="font-style: italic"><label class="text-info">Formation :</label></td>
                                                    <c:choose>
                                                        <c:when test="${requestScope.cv.formationList.size() == 0}">
                                                            <td style="font-style: italic"><b>Aucunes Formations acad&eacute;miques ou professionnelles enregistr&eacute;es</b></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td style="font-style: italic"><b><c:out value="${requestScope.cv.formationList.size()}"/>&nbsp; Formations acad&eacute;miques ou professionnelles enregistr&eacute;es</b></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </tr>
                                                <tr>
                                                    <td class="lead" style="font-style: italic"><label class="text-info">Exp&eacute;rience Professionnelle :</label></td>
                                                    <c:choose>
                                                        <c:when test="${requestScope.cv.experienceProList.size() == 0}">
                                                            <td style="font-style: italic"><b>Aucunes exp&eacute;rience Professionnelle enregistr&eacute;es</b></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td style="font-style: italic"><b><c:out value="${requestScope.cv.experienceProList.size()}"/>&nbsp; exp&eacute;rience Professionnelle enregistr&eacute;es</b></td>
                                                        </c:otherwise>
                                                    </c:choose>  
                                                </tr>
                                                <tr>
                                                    <td class="lead" style="font-style: italic"><label class="text-info">Comp&eacute;tence :</label></td>
                                                    <c:choose>
                                                        <c:when test="${requestScope.cv.competenceList.size() == 0}">
                                                            <td style="font-style: italic"><b>Aucunes Comp&eacute;tence enregistr&eacute;es</b></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                           <td style="font-style: italic"><b><c:out value="${requestScope.cv.competenceList.size()}"/>&nbsp; Comp&eacute;tence enregistr&eacute;es</b></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </tr>
                                           </table> 
                                           </table> 
                                        </div>
                                        <div id="photo">
                                            <form action="<c:url value="upload" />" method="post" enctype="multipart/form-data">
                                                <input type="hidden" name="description" value="<c:out value="${sessionScope.sessionUtilisateur.code.login}"/>"/>
                                                <br />
                                                <input type="file" id="fichier" name="fichier" value="<c:out value="${sessionScope.sessionUtilisateur.code.login}"/>" />
                                                <br />
                                                <button class="btn btn-primary" type="submit"><i class="icon-plus icon-white"></i> Envoyer</button>
                                                <button id="masque" class="btn btn-inverse" type="reset"><i class="icon-remove icon-white"></i> Annuler</button>
                                                <br />
                                            </form>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab2">
                                        <c:import url="vue/formation.jsp" />
                                    </div>
                                    <div class="tab-pane" id="tab3">
                                        <c:import url="vue/experiencepro.jsp" />
                                    </div>
                                    <div class="tab-pane" id="tab4">
                                        <c:import url="vue/competence.jsp" />
                                    </div>
                                    <div class="tab-pane" id="tab5">
                                        <c:import url="vue/candidat.jsp" />
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
            <script type="text/javascript">
                $(function() {
                  $('#photo').hide();
                  $('#affich').click(function(){
                    $('#affiche').hide('5000');
                    $('#photo').show('5000');
                  });
                  $('#masque').click(function(){
                    $('#affiche').show('5000');
                    $('#photo').hide('5000');
                  });
                });
            </script>
          </c:otherwise>
     </c:choose>
    <!-- NAVBAR ================================================== -->
    <script src="bootstrap/js/bootstrap-modal.js"></script>
    <script src="bootstrap/js/bootstrap-dropdown.js"></script>
    <script src="bootstrap/js/bootstrap-tab.js"></script>
    <script src="bootstrap/js/bootstrap-button.js"></script>
  </body>
</html>
