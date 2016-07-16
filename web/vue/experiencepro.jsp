<%-- 
    Document   : experiencepro
    Created on : 20 août 2014, 03:32:10
    Author     : XAVIER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.joda.org/joda/time/tags"  prefix="joda" %>
<div id="affichexperience">
    <c:choose>
        <c:when test="${ empty requestScope.cv.experienceProList or requestScope.experience == 'vide'}">
            <div class="alert alert-info" style="width: 40%; margin-left: 30%;">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                Actuellement aucune information concernant vos Exp&eacute;rience professionnelles n'est enregistr&eacute;e sur notre plate-forme
            </div>
            <table>
                <tr>
                    <td>
                        <button id="affich2" class="btn btn-primary" href="#"><i class="icon-plus icon-white"></i></button>
                    </td>
                    <td>
                        <label class="text-info">Ajouter une nouvelle Exp&eacute;rience professionnelle &agrave; votre profil</label>
                    </td>
                </tr>
            </table>
        </c:when>
        <c:otherwise>
            <c:forEach items="${ requestScope.cv.experienceProList }" var="experience" varStatus="i">
                <c:forEach items="${ requestScope.duree }" var="duree" varStatus="j">
                    <c:if test="${i.index == j.index}">
                        <table>
                            <tr>
                                <td class="lead"><label class="nav-header" style="font-size: 13px"><b><c:out value="${experience.poste}"/> au sein de <c:out value="${experience.nomStructure}"/></b>&nbsp;</label></td>
                                <td class="lead"><label class="nav-header" style="font-size: 15px;">(<c:out value="${duree}"/>&nbsp;Mois)</label></td>
                                <td>
                                    <a class="btn btn-mini btn-inverse" href="<c:url value="/ExperienceServlet?action=modifexp&id=${sessionScope.sessionUtilisateur.codeCan}&codeExp=${experience.codeExp}"/>"><i class="icon-pencil icon-white"></i></a>
                                </td>
                                <td>
                                    <a class="btn btn-mini btn-primary" href="<c:url value="/ExperienceServlet?action=suprexp&id=${sessionScope.sessionUtilisateur.codeCan}&codeExp=${experience.codeExp}"/>"><i class="icon-remove icon-white"></i></a>
                                </td>
                            </tr>
                        </table>
                         <table>
                             <tr>
                                <td class="lead"><label class="text-info">Secteur d'activit&eacute; :</label></td>
                                <td class="lead"><label class="text-info"><b><c:out value="${experience.activiteStructure}"/></b></label></td>
                           </tr>
                         </table>
                        <table>
                            <tr>
                                <td class="lead"><label class="text-info"><b><c:out value="${experience.tachesEffectuees}"/></b></label></td>
                            </tr>
                        </table>
                    </c:if>
                </c:forEach>
            </c:forEach>
                <table>
                    <tr>
                        <td>
                            <button id="affich2" class="btn btn-primary" href="#"><i class="icon-plus icon-white"></i></button>
                        </td>
                        <td>
                            <label class="text-info">Ajouter une nouvelle Exp&eacute;rience professionnelle</label>
                        </td>
                    </tr>
                </table>
        </c:otherwise>
    </c:choose> 
 </div>
 <div id="ajoutexperience" style="display:none;">
     <form action="<c:url value="/ProfilCandidatServlet"/>" method="post">
         <input type="hidden" name="codeCan" value="<c:out value="${sessionScope.sessionUtilisateur.codeCan}"/>"/>
         <input type="hidden" name="action" value="ajoutexp"/>
         <div class="row" style="margin-left:25px">
             <table>
                 <tr>
                     <td>
                         <div class="control-group">
                             <div class="controls">
                                 <div class="input-prepend">
                                     <span class="add-on"><i class="icon-home"></i></span>
                                     <input type="text" name="nomStructure" placeholder="nom de la structure">
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
                                     <input type="text" name="activiteStructure" placeholder="activité de la structure">
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
                                     <input type="text" name="poste" placeholder="Poste occupé">
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
                                     <input type="text" class="input" id="datepicker" name="date_debut" placeholder="Date de début"/>
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
                                     <input type="text" class="input" id="datepicker2" name="date_fin" placeholder="Date de fin"/>
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
                                     <textarea name="tachesEffectuees" placeholder="description des tâches effectuées au sein de la structure" style="width: 700px; height: 100px"></textarea>
                                 </div>
                             </div>
                         </div>
                     </td>
                     <td></td>
                 </tr>
                 <table style="margin-left: 250px">
                     <tr>
                        <td><button id="masque2" class="btn btn-danger" type="reset"><i class="icon-remove icon-white"></i> Annuler</button></td>
                        <td><button class="btn btn-info" type="submit" name=""><i class="icon-plus icon-white"></i> Valider</button></td>
                    </tr>
                 </table>
             </table>
         </div>
       </form>
   </div>
<script type="text/javascript">
    $(function() {
      $('#ajoutexperience').hide();
      $('#affich2').click(function(){
        $('#affichexperience').hide('5000');
        $('#ajoutexperience').show('5000');
      });
      $('#masque2').click(function(){
        $('#affichexperience').show('5000');
        $('#ajoutexperience').hide('5000');
      });
    });
</script>
