<%-- 
    Document   : ajoutformation
    Created on : 18 août 2014, 17:46:52
    Author     : XAVIER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="affichformation">
    <c:choose>
        <c:when test="${ empty requestScope.cv.formationList or requestScope.formation == 'vide'}">
            <div class="alert alert-info" style="width: 40%; margin-left: 30%;">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                Actuellement aucune information concernant vos formations n'est enregistr&eacute; sur notre plate-forme
            </div>
            <table>
                <tr>
                    <td>
                        <button id="affich1" class="btn btn-primary" href="#"><i class="icon-plus icon-white"></i></button>
                    </td>
                    <td>
                        <label class="text-info">Ajouter une nouvelle formation acad&eacute;mique ou professionnelle</label>
                    </td>
                </tr>
            </table>
        </c:when>
        <c:otherwise>
                <c:forEach items="${ requestScope.cv.formationList }" var="formation" varStatus="boucle">
                    <table>
                        <tr>
                            <td class="lead"><label class="nav-header" style="font-size: 15px; padding: 3px 0px"><c:out value="${formation.diplome}"/>&nbsp;&nbsp;</label></td>
                             <td>
                                 <a class="btn btn-mini btn-inverse" href="<c:url value="/FormationServlet?action=modifform&id=${sessionScope.sessionUtilisateur.codeCan}&codeform=${formation.codeForm}"/>"><i class="icon-pencil icon-white"></i></a>
                             </td>
                             <td>
                                 <a class="btn btn-mini btn-primary" href="<c:url value="/FormationServlet?action=suprform&id=${sessionScope.sessionUtilisateur.codeCan}&codeform=${formation.codeForm}"/>"><i class="icon-remove icon-white"></i></a>
                             </td>
                         </tr>   
                    </table>
                    <table>
                        <tr>
                            <td class="lead"><label class="text-info " style="font-size: 13px">Option :</label></td>
                            <td class="lead"><label class="text-info" style="font-size: 15px"><b><c:out value="${formation.option}"/></b></label></td>
                       </tr>
                    </table>
                     <table>
                        <tr>
                            <td class="lead"><label class="text-info " style="font-size: 13px">Etablissement d'obtention :</label></td>
                            <td class="lead"><label class="text-info" style="font-size: 15px"><b><c:out value="${formation.etablissement}"/></b></label></td>
                       </tr>
                    </table>
                    <table>
                       <tr>
                           <td class="lead"><label class="text-info" style="font-size: 13px">Ann&eacute; d'obtention:</label></td>
                           <td class="lead"><label class="text-info" style="font-size: 15px"><b><c:out value="${formation.anneeAca}"/></b></label></td>
                       </tr>    
                     </table>
                </c:forEach>
                 <table>
                     <tr>
                        <td>
                            <button id="affich1" class="btn btn-primary" href="#"><i class="icon-plus icon-white"></i></button>
                        </td>
                        <td>
                            <label class="text-info">Ajouter une nouvelle formation acad&eacute;mique ou professionnelle</label>
                        </td>
                    </tr>
                 </table>
        </c:otherwise>
    </c:choose> 
 </div>
 <div id="ajoutformation" style="display:none;">
     <form action="<c:url value="/ProfilCandidatServlet"/>" method="post">
         <input type="hidden" name="codeCan" value="<c:out value="${sessionScope.sessionUtilisateur.codeCan}"/>"/>
         <input type="hidden" name="action" value="ajoutform"/>
         <div class="row" style="margin-left:25px">
             <table>
                 <tr>
                     <td>
                         <div class="control-group">
                             <div class="controls">
                                 <div class="input-prepend">
                                     <span class="add-on"><i class="icon-home"></i></span>
                                     <input type="text" name="etablissement" placeholder="Etablissement">
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
                                     <input class="input" type="text" name="anneeAca" placeholder="AAAA/AAAA">
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
                                     <span class="add-on"><i class="icon-bookmark"></i></span>
                                     <select name="diplome">
                                        <c:import url="vue/listDiplome.jsp" />
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
                                     <span class="add-on"><i class="icon-calendar"></i></span>
                                     <input type="text" name="options" placeholder="option/série/filière">
                                 </div>
                             </div>
                         </div>
                     </td>&nbsp;
                     <td></td>
                 </tr>
             </table>
             <table style="margin-left: 50px">
                 <tr>
                     <td><button id="masque1" class="btn btn-danger" type="reset" onclick="hide('ajoutformation');show('affichformation');"><i class="icon-remove icon-white"></i> Annuler</button></td>
                     <td><button class="btn btn-info" type="submit" name=""><i class="icon-plus icon-white"></i> Valider</button></td>
                 </tr>
             </table>
         </div>
       </form>
   </div>
<script type="text/javascript">
    $(function() {
      $('#ajoutformation').hide();
      $('#affich1').click(function(){
        $('#affichformation').hide('5000');
        $('#ajoutformation').show('5000');
      });
      $('#masque1').click(function(){
        $('#affichformation').show('5000');
        $('#ajoutformation').hide('5000');
      });
    });
</script>
