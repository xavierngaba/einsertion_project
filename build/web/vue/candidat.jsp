<%-- 
    Document   : candidat
    Created on : 3 déc. 2014, 08:58:37
    Author     : xavier_ng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="affichprofil">
    <table>
        <tr>
             <td class="lead" style="font-style: italic"><label class="text-info">Nom :</label></td>
             <td style="font-style: italic"><b><c:out value="${sessionUtilisateur.nomCan}"/></b></td>
        </tr>

        <tr>
             <td class="lead" style="font-style: italic"><label class="text-info">Prénom :</label></td>
             <td style="font-style: italic"><b><c:out value="${sessionUtilisateur.prenomCan}"/></b></td>
         </tr>
         <tr>
             <td class="lead" style="font-style: italic"><label class="text-info">&Acirc;ge:</label></td>
             <td style="font-style: italic"><b><c:out value="${requestScope.age}"/> ans</b></td>
         </tr>
         <tr>
             <td class="lead" style="font-style: italic"><label class="text-info">Adresse :</label></td>
             <td style="font-style: italic"><b><c:out value="${sessionUtilisateur.adresse}"/></b></td>
         </tr>
         <tr>
             <td class="lead" style="font-style: italic"><label class="text-info">Ville :</label></td>
             <td style="font-style: italic"><b><c:out value="${sessionUtilisateur.villeCan}"/></b></td>
         </tr>
         <tr>
             <td class="lead" style="font-style: italic"><label class="text-info">Téléphone :</label></td>
             <td style="font-style: italic"><b><c:out value="${sessionUtilisateur.tel1Can}"/></b></td>
         </tr>
         <tr>
             <td class="lead" style="font-style: italic"><label class="text-info">E-mail :</label></td>
             <td style="font-style: italic"><b><c:out value="${sessionUtilisateur.emailCan}"/></b></td>
         </tr>
         <tr>
             <td rowspane="2">
                 <button id="affiche5" class="btn btn-primary" href="#"><i class="icon-pencil icon-white"></i></button>
             </td>
             <td>
                 <label class="text-info">Modifier Vos Donn&eacute;es personnelles</label> 
             </td>
         </tr>
     </table>
</div>
<div id="modifprofil">
    <form action="<c:url value="/ProfilCandidatServlet"/>" method="post">
        <input type="hidden" name="codeCan" value="<c:out value="${sessionScope.sessionUtilisateur.codeCan}"/>"/>
        <input type="hidden" name="action" value="modifprofil"/>
        <div class="row" style="margin-left:25px">
            <table>
                <tr>
                    <td></td>
                    <td>
                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on"><i class="icon-user"></i></span>
                                    <input class="input-medium" type="text" name="nomCandidat" placeholder="Nom" value="<c:out value="${sessionScope.sessionUtilisateur.nomCan}"/>">
                                </div>
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <td>
                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on"><i class="icon-user"></i></span>
                                    <input class="input-medium" type="text" name="prenomCandidat" placeholder="Prénom" value="<c:out value="${sessionScope.sessionUtilisateur.prenomCan}"/>">
                                </div>
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <td>
                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                    <input type="text" class="input-medium" id="datepicker" name="date_naiss" value="<c:out value="${sessionScope.sessionUtilisateur.dateNaiss}"/>"/>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td><span class="text-error">${form.erreurs['nomCandidat']}</span></td>
                    <td>&nbsp;</td>
                    <td><span class="text-error">${form.erreurs['prenomCandidat']}</span></td>
                    <td>&nbsp;</td>
                    <td><span class="text-error">${form.erreurs['date']}</span></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td>
                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on"><i class="icon-eye-open"></i></span>
                                    <input class="input-medium" type="text" name="loginCandidat" placeholder="Login" value="<c:out value="${sessionScope.sessionUtilisateur.code.login}"/>">
                                </div>
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <td>
                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on"><i class="icon-eye-close"></i></span>
                                    <input class="input-medium" type="password" name="password" placeholder="Mot de Passe" value="<c:out value="${sessionScope.sessionUtilisateur.code.pass}"/>">
                                </div>
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <td>
                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on"><i class="icon-eye-close"></i></span>
                                    <input class="input-medium" type="password" name="password2" placeholder="Re - Mot de Passe">
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td><span class="text-error">${form.erreurs['loginCandidat']}</span></td>
                    <td>&nbsp;</td>
                    <td><span class="text-error">${form.erreurs['password']}</span></td>
                    <td>&nbsp;</td>
                    <td><span class="text-error">${form.erreurs['password']}</span></td>
                </tr> 
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td>
                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on"><i class="icon-map-marker"></i></span>
                                    <input class="input-medium" type="text" name="adresseCandidat" placeholder="Adresse" value="<c:out value="${sessionScope.sessionUtilisateur.adresse}"/>">
                                </div>
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <td>
                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on"><i class="icon-globe"></i></span>
                                    <input class="input-medium" type="text" name="villeCandidat" placeholder="Ville" value="<c:out value="${sessionScope.sessionUtilisateur.villeCan}"/>">
                                </div>
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <td>
                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on"><i class="icon-signal"></i></span>
                                    <input class="input-medium" type="text" name="telCandidat" placeholder="Téléphone" value="<c:out value="${sessionScope.sessionUtilisateur.tel1Can}"/>">
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td><span class="text-error">${form.erreurs['adresseCandidat']}</span></td>
                    <td>&nbsp;</td>
                    <td><span class="text-error">${form.erreurs['villeCandidat']}</span></td>
                    <td>&nbsp;</td>
                    <td><span class="text-error">${form.erreurs['telCandidat']}</span></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td></td>
                    <td></td>
                    <td>
                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on"><i class="icon-envelope"></i></span>
                                    <input class="input-medium" type="text" name="emailCandidat" placeholder="E-mail" value="<c:out value="${sessionScope.sessionUtilisateur.emailCan}"/>">
                                </div>
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <td>
                        <c:import url="vue/listDomaine.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td></td>
                    <td></td>
                    <td><span class="text-error">${form.erreurs['emailCandidat']}</span></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td></td>
                    <td></td>
                    <td>
                        <button id="masque5" class="btn btn-danger" type="reset"><i class="icon-remove icon-white"></i> Annuler</button>
                        &nbsp;&nbsp;
                        <button class="btn btn-info" type="submit"><i class="icon-plus icon-white"></i> Valider</button>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(function() {
      $('#modifprofil').hide();
      $('#affiche5').click(function(){
        $('#affichprofil').hide('5000');
        $('#modifprofil').show('5000');
      });
      $('#masque5').click(function(){
        $('#affichprofil').show('5000');
        $('#modifprofil').hide('5000');
      });
    });
</script>