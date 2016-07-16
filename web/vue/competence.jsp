<%-- 
    Document   : competence
    Created on : 20 août 2014, 03:32:46
    Author     : XAVIER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="affichcompetence">
    <c:choose>
        <c:when test="${ empty requestScope.cv.competenceList or requestScope.competence == 'vide'}">
            <div class="alert alert-info" style="width: 40%; margin-left: 30%;">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                Actuellement aucune information concernant vos Comp&eacute;tences n'est enregistr&eacute; sur notre plate-forme
            </div>
            <table>
                <tr>
                    <td>
                        <button id="affich3" class="btn btn-primary" href="#"><i class="icon-plus icon-white"></i></button>
                    </td>
                    <td>
                        <label class="text-info">Ajouter une comp&eacute;tence &agrave; votre profil</label>
                    </td>
                </tr>
            </table>
        </c:when>
        <c:otherwise>
                <c:forEach items="${ requestScope.cv.competenceList }" var="competence" varStatus="boucle">
                <table>
                    <tr>
                        <td class="lead"><label class="nav-header" style="font-size: 15px; padding: 3px 0px"><c:out value="${competence.domaine}"/>&nbsp;&nbsp;</label></td>
                         <td>
                             <a class="btn btn-mini btn-inverse" href="<c:url value="/CompetenceServlet?action=modifcomp&id=${sessionScope.sessionUtilisateur.codeCan}&codeComp=${competence.codeComp}"/>"><i class="icon-pencil icon-white"></i></a>
                         </td>
                         <td>
                             <a class="btn btn-mini btn-inverse" href="<c:url value="/CompetenceServlet?action=suprcomp&id=${sessionScope.sessionUtilisateur.codeCan}&codeComp=${competence.codeComp}"/>"><i class="icon-remove icon-white"></i></a>
                         </td>
                     </tr>
                </table>
                <table>
                     <tr>
                         <td class="lead"><label class="text-info">Sp&eacute;cialit&eacute;:</label></td>
                         <td class="lead"><label class="text-info"><b><c:out value="${competence.specialite}"/></b></label></td>
                    </tr>
                    <tr>
                        <td class="lead"><i class="icon-arrow-right"></i></td>
                        <td class="lead"><label class="text-info"><b><c:out value="${competence.libelleComp}"/></b></label></td>
                    </tr>
                </table>
            </c:forEach>
            <table>
                <tr>
                    <td>
                        <button id="affich3" class="btn btn-primary" href="#"><i class="icon-plus icon-white"></i></button>
                    </td>
                    <td>
                        <label class="text-info">Ajouter une nouvelle formation comp&eacute;tence</label>
                    </td>
                </tr>
            </table>
        </c:otherwise>
    </c:choose> 
 </div>
 <div id="ajoutcompetence" style="display:none;">
     <form action="<c:url value="/ProfilCandidatServlet"/>" method="post">
         <input type="hidden" name="codeCan" value="<c:out value="${sessionScope.sessionUtilisateur.codeCan}"/>"/>
         <input type="hidden" name="action" value="ajoutcomp"/>
         <div class="row" style="margin-left:25px">
             <table>
                 <tr>
                     <td>
                         <div class="control-group">
                             <div class="controls">
                                 <div class="input-prepend">
                                     <span class="add-on"><i class="icon-home"></i></span>
                                     <input type="text" name="domaine" placeholder="domaine">
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
                                     <input type="text" name="specialite" placeholder="Spécialité">
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
                                     <textarea name="description" placeholder="description domaine" cols="15" rows="5"></textarea>
                                 </div>
                             </div>
                         </div>
                     </td>
                     <td></td>
                 </tr>
                 <tr>
                     <td><button id="masque3" class="btn btn-danger" type="reset"><i class="icon-remove icon-white"></i> Annuler</button></td>
                     <td><button class="btn btn-info" type="submit" name=""><i class="icon-plus icon-white"></i> Valider</button></td>
                 </tr>
             </table>
         </div>
       </form>
   </div>
<script type="text/javascript">
    $(function() {
      $('#ajoutexperience').hide();
      $('#affich3').click(function(){
        $('#affichcompetence').hide('5000');
        $('#ajoutcompetence').show('5000');
      });
      $('#masque3').click(function(){
        $('#affichcompetence').show('5000');
        $('#ajoutcompetence').hide('5000');
      });
    });
</script>