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
    <title>E-insertion | Espace Candidat</title>
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
    <!-- NAVBAR
    ================================================== -->
        <c:import url="vue/menuac.jsp" />
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3">
                    <div class="well sidebar-nav">
                        <c:import url="vue/login.jsp" />
                    </div>
                </div>
                <div class="span7">
                    <div>
                        <h2 style="border-bottom: 5px solid #dedede">Bienvenue!</h2>
                        <a href="<c:url value="/index.jsp"/>"><img class="img-perso" alt="Photo de profil" width="210px" height="210px" src="<c:url value="images/logo.png"/>"></a>                
                        <br/>
                        <blockquote>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;est une plate-forme de recherche d'emploi en ligne, permettant 
                        aux diplom&eacute;s de poster leur CV en ligne, de consulter toutes les offres d'emploi et de formation d&eacute;ja 
                        inscrites sur notre plate forme, de postuler aux offres d'emploi pour les postes qu'ils convoitent, et/ou de s'inscrire 
                        aux formations que les instituts postent.</blockquote>
                        <h2 style="border-bottom: 5px solid #dedede">Comment &ccedil;a marche?</h2>
                        <h3 style="margin-bottom: 0px; text-align: center" class="text-info">Le candidat pour &ecirc;tre actif sur notre plate-forme devra</h3><br/>
                        <p style="text-align: justify; line-height: 1.5; font-size: 17px; color:#585858 ;"> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <i class="icon-arrow-right icon-bold"></i><a href="<c:url value="/inscription.jsp"/>" class="text-error"> 
                            Cr&eacute;er un compte utilisateur;</a> avec lequel il aura acc&egrave;s
                            aux diff&eacute;rentes options offertes par la plate-forme. Pour la cr&eacute;ation de ce compte, le candidat est pri&eacute; 
                            de remplir les champs par ses vraies informations; car celles-ci seront re-utilis&eacute;es pour l'&eacute;tablissement du CV.<br/> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <i class="icon-arrow-right icon-bold"></i> Apr&egrave;s la cr&eacute;ation du compte, le candidat devra remplir les informations
                            (Formations, Comp&eacute;tences et Exp&eacute;riences Professionnelles) au niveau de son profil. toutes ses informations seront prises
                            en compte pour l'&eacute;tablissement de son CV.<br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <i class="icon-arrow-right icon-bold"></i> Une fois toutes les informations inscrites dans le profil du candidat, la 
                            possibilit&eacute; lui est donn&eacute; de chercher les offres de formation et d'emploi et d&DiacriticalAcute;y postuler.
                            par ce moyen l'entreprise sera inform&eacute;e du d&eacute;sir exprim&eacute; par le candidat de rejoindre son &eacute;ffectif
                            pour un poste bien d&eacute;fini.<br/>
                        </p>
                    </div> 
                </div>
                <div class="span2">
                    <c:import url="vue/sidebar.jsp" />
                </div>
                <div class="container marketing">
                    <c:import url="vue/footer.jsp" />
                </div>
            </div>
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
