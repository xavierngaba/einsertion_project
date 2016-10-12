<%-- 
    Document   : modifentreprise
    Created on : Oct 25, 2014, 11:45:44 AM
    Author     : Dry Bass
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:choose>
    <c:when test="${requestScope.erreur == 'ErreurEntreprise'}">
        <form action="<c:url value="/ProfilEntrepriseServlet"/>" method="post">
            <div class="row" style="margin-left:25px">
                <table>
                    <tr>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-briefcase"></i></span>
                                        <input class="input-medium" type="text" name="nom_ent" placeholder="Nom de la Société">
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-folder-close"></i></span>
                                        <input class="input-medium" type="text" name="sect_act" placeholder="Domaine d'activité">
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-signal"></i></span>
                                        <<input class="input-medium" type="text" name="tel_ent" placeholder="Téléphone">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="text-error">${form.erreurs['nom_ent']}</span></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><span class="text-error">${form.erreurs['tel_ent']}</span></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-globe"></i></span>
                                        <input class="input-medium" type="text" name="site_ent" placeholder="Site internet">
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
                                        <input class="input-medium" type="text" name="nom_resp_ent" placeholder="Nom du responsable">
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
                                        <input class="input-medium" type="text" name="prenom_resp_ent" placeholder="Prénom du responsable">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><span class="text-error">${form.erreurs['nom_resp_ent']}</span></td>
                        <td>&nbsp;</td>
                        <td><span class="text-error">${form.erreurs['prenom_resp_ent']}</span></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-envelope"></i></span>
                                        <input class="input-medium" type="text" name="email_ent" placeholder="E-mail">
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
                                        <input class="input-medium" type="text" name="login" placeholder="Login">
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
                                        <input class="input-medium" type="password" name="password" placeholder="Mot de Passe">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="text-error">${form.erreurs['email_ent']}</span></td>
                        <td>&nbsp;</td>
                        <td><span class="text-error">${form.erreurs['login']}</span></td>
                        <td>&nbsp;</td>
                        <td><span class="text-error">${form.erreurs['password']}</span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-eye-close"></i></span>
                                        <input class="input-medium" type="password" name="password2" placeholder="Mot de Passe">
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><span class="text-error">${form.erreurs['password2']}</span></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-comment"></i></span>
                                        <textarea class="input" rows="2" style="width:650px" name="descr_ent" placeholder="Saississez la description de l'entreprise"></textarea>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>  
                        <td><button class="btn btn-danger" type="reset"></i> Effacer</button></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td><button class="btn btn-info" type="submit"></i> Valider</button></td>
                    </tr>
                </table>
            </div>
        </form>
    </c:when>
    <c:otherwise>
        <form action="<c:url value="/ProfilEntrepriseServlet"/>" method="post">
            <input type="hidden" name="codeEnt" value="<c:out value="${sessionScope.sessionUtilisateur.codeEnt}"/>"/>
            <input type="hidden" name="action" value="modifprofil"/>
            <div class="row" style="margin-left:25px">
                <table>
                    <tr>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-briefcase"></i></span>
                                        <input class="input-medium" type="text" name="nom_ent" value="<c:out value="${sessionScope.sessionUtilisateur.nomEnt}"/>">
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-folder-close"></i></span>
                                        <input class="input-medium" type="text" name="sect_act" value="<c:out value="${sessionScope.sessionUtilisateur.sectAct}"/>">
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-signal"></i></span>
                                        <<input class="input-medium" type="text" name="tel_ent" value="<c:out value="${sessionScope.sessionUtilisateur.telEnt}"/>">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-globe"></i></span>
                                        <input class="input-medium" type="text" name="site_ent" value="<c:out value="${sessionScope.sessionUtilisateur.siteEnt}"/>">
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
                                        <input class="input-medium" type="text" name="nom_resp_ent" value="<c:out value="${sessionScope.sessionUtilisateur.nomRespEnt}"/>">
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
                                        <input class="input-medium" type="text" name="prenom_resp_ent" value="<c:out value="${sessionScope.sessionUtilisateur.prenomRespEnt}"/>">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-envelope"></i></span>
                                        <input class="input-medium" type="text" name="email_ent" value="<c:out value="${sessionScope.sessionUtilisateur.emailEnt}"/>">
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
                                        <input class="input-medium" type="text" name="login" value="<c:out value="${sessionScope.sessionUtilisateur.code.login}"/>">
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
                                        <input class="input-medium" type="password" name="password" placeholder="Mot de Passe">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-eye-close"></i></span>
                                        <input class="input-medium" type="password" name="password2" placeholder="Mot de Passe">
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-comment"></i></span>
                                        <textarea class="input" rows="2" style="width:650px" name="descr_ent" ><c:out value="${sessionScope.sessionUtilisateur.descrEnt}"/></textarea>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>  
                        <td><a class="btn btn-danger" href="<c:url value="/ProfilEntrepriseServlet?action=affich&id=${sessionScope.sessionUtilisateur.codeEnt}"/>"></i> Annuler</a></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td><button class="btn btn-info" type="submit"></i> Valider</button></td>
                    </tr>
                </table>
            </div>
        </form>
    </c:otherwise>
</c:choose>
        