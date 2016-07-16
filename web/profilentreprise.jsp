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
    <link rel="stylesheet" href="css/themes/base/jquery.ui.all.css">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="accueil.css" rel="stylesheet">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="bootstrap/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="bootstrap/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="bootstrap/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="bootstrap/ico/apple-touch-icon-57-precomposed.png">
    <script src="bibliotheque/jquery-1.9.1.js"></script>
    <script src="js/jquery.ui.core.js"></script>
    <script src="js/jquery.ui.widget.js"></script>
    <script src="js/jquery.ui.datepicker.js"></script>
    <script src="js/jquery.ui.datepicker-fr.js"></script>
    
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      dd {
          line-height: 1.5;
      }
      .sidebar-nav {
        padding: 45px 0;
      }
      table{
          margin-bottom: 10px
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
             <c:import url="vue/menuentreprise.jsp" />
                <div class="container-fluid">
                    <div class="row-fluid">
                    <div class="span3">
                        <div class="well sidebar-nav">
                            <c:import url="vue/login.jsp" />
                        </div>
                    </div>
                        <div class="span7">
                            <div class="well sidebar-nav">
                                <div id="affiche" style="margin-left: 25px">
                                    <table>
                                         <tr>
                                             <td colspane="7">
                                                 <img class="img-polaroid" alt="Photo de profil" width="210px" height="210px" src="<c:url value="images/profil/images.jpg"/>">
                                             </td>
                                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                             <td>
                                                 <dl>
                                                     <dd class="text-info" style="font-style: italic; font-size: 45px"><c:out value="${sessionScope.sessionUtilisateur.nomEnt}"/>
                                                         <a class="btn btn-primary" id="profil" href="#"><i class="icon-pencil icon-white"></i></a>
                                                     </dd>
                                                </dl>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td>
                                                 <button class="btn btn-primary" href="#" ><i class="icon-pencil icon-white"></i> Modifier votre photo de Profil</button>
                                             </td>
                                         </tr>
                                      </table>
                                      <br/>
                                    <table>
                                        <tr>
                                            <dl>
                                                <dt style="color: #0088cc; font-style: italic; font-size: 20px">Secteur d'activit&eacute;</dt>
                                                <dd style="color: seagreen; font-style: italic; font-size: 25px"><c:out value="${sessionScope.sessionUtilisateur.sectAct}"/></dd>
                                            </dl>
                                            <dl>
                                                <dt style="color: #0088cc; font-style: italic; font-size: 20px">T&eacute;l&eacute;phone: </dt>
                                                <dd style="color: seagreen; font-style: italic; font-size: 25px"><c:out value="${sessionScope.sessionUtilisateur.telEnt}"/></dd>
                                            </dl>
                                            <dl>
                                                <dt style="color: #0088cc; font-style: italic; font-size: 20px">Site: </dt>
                                                <dd style="color: seagreen; font-style: italic; font-size: 25px"><c:out value="${sessionScope.sessionUtilisateur.siteEnt}"/></dd>
                                            </dl>
                                            <dl>
                                                <dt style="color: #0088cc; font-style: italic; font-size: 20px">Description: </dt>
                                                <dd style="color: seagreen; font-style: italic; font-size: 25px"><c:out value="${sessionScope.sessionUtilisateur.descrEnt}"/></dd>
                                            </dl>
                                            <dl>
                                                <dt style="color: #0088cc; font-style: italic; font-size: 20px">Responsable: </dt>
                                                <dd style="color: seagreen; font-style: italic; font-size: 25px"><c:out value="${sessionScope.sessionUtilisateur.nomRespEnt}"/>&nbsp;<c:out value="${sessionScope.sessionUtilisateur.prenomRespEnt}"/></dd>
                                            </dl>
                                            <dl>
                                                <dt style="color: #0088cc; font-style: italic; font-size: 20px">E-mail: </dt>
                                                <dd style="color: seagreen; font-style: italic; font-size: 25px"><c:out value="${sessionScope.sessionUtilisateur.emailEnt}"/></dd>
                                            </dl>
                                        </tr>
                                    </table> 
                                </div>
                                <div id="photo" style="display:none; margin-left: 25px">
                                    <form action="<c:url value="upload" />" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="description" value="<c:out value="${sessionScope.sessionUtilisateur.code.login}"/>"/>
                                        <br />
                                        <input type="file" id="fichier" name="fichier" value="<c:out value="${sessionScope.sessionUtilisateur.code.login}"/>" />
                                        <br />
                                        <button class="btn btn-primary" type="submit"><i class="icon-plus icon-white"></i> Envoyer</button>
                                        <button class="btn btn-inverse" type="reset" ><i class="icon-remove icon-white"></i> Annuler</button>
                                        <br />
                                    </form>
                                </div>
                                <div id="modifprofil" style="display: none;">
                                    <c:import url="vue/modifentreprise.jsp" />
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
                  $('#modifprofil').hide();
                  $('#profil').click(function(){
                    $('#affiche').hide('5000');
                    $('#modifprofil').show('5000');
                  });
                });
            </script>
            
            <script src="bootstrap/js/bootstrap-modal.js"></script>
            <script src="bootstrap/js/bootstrap-dropdown.js"></script>
            <script src="bootstrap/js/bootstrap-tab.js"></script>
            <script src="bootstrap/js/bootstrap-button.js"></script> 
          </c:otherwise>
     </c:choose>
    <!-- NAVBAR ================================================== -->    
  </body>

</html>
