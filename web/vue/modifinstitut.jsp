<%-- 
    Document   : modifinstitut
    Created on : Nov 4, 2014, 9:51:28 AM
    Author     : Dry Bass
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:choose>
    <c:when test="${requestScope.erreur == 'ErreurInstitut'}">
        <div class="tab-pane active" id="tab3">
            <div class="well sidebar-nav">
                <form action="<c:url value="/InscriptionInstitutServlet"/>" method="post">
                    <div class="row" style="margin-left:25px">
                        <table>
                            <tr>
                                <td>
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-briefcase"></i></span>
                                                <input class="input-medium" type="text" name="nom_ins" placeholder="Nom de l'Institut">
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-envelope"></i></span>
                                                <input class="input-medium" type="text" name="email_ins" placeholder="E-mail">
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
                                                <<input class="input-medium" type="text" name="tel_ins" placeholder="Téléphone">
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="text-error">${form.erreurs['nom_ins']}</span></td>
                                <td>&nbsp;</td>
                                <td><span class="text-error">${form.erreurs['email_ins']}</span></td>
                                <td>&nbsp;</td>
                                <td><span class="text-error">${form.erreurs['tel_ins']}</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-globe"></i></span>
                                                <input class="input-medium" type="text" name="site_ins" placeholder="Site internet">
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
                                                <input class="input-medium" type="text" name="nom_resp_ins" placeholder="Nom du responsable">
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
                                                <input class="input-medium" type="text" name="prenom_resp_ins" placeholder="Prénom du responsable">
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td><span class="text-error">${form.erreurs['nom_resp_ins']}</span></td>
                                <td>&nbsp;</td>
                                <td><span class="text-error">${form.erreurs['prenom_resp_ins']}</span></td>
                            </tr>
                            <tr>
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
                                                <input class="input-medium" type="password" name="pass1" placeholder="Mot de Passe">
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
                                                <input class="input-medium" type="password" name="pass2" placeholder="Mot de Passe">
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="text-error">${form.erreurs['login']}</span></td>
                                <td>&nbsp;</td>
                                <td><span class="text-error">${form.erreurs['pass1']}</span></td>
                                <td>&nbsp;</td>
                                <td><span class="text-error">${form.erreurs['pass2']}</span></td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-comment"></i></span>
                                                <textarea class="input" rows="2" style="width:650px" name="descr_ins" placeholder="Saississez la description de l'institut de formation"></textarea>
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
                                <td><button class="btn btn-danger" type="reset"></i> Annuler</button></td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><button class="btn btn-info" type="submit"></i> Valider</button></td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <form action="<c:url value="/ProfilInstitutServlet"/>" method="post">
            <input type="hidden" name="codeIns" value="<c:out value="${sessionScope.sessionUtilisateur.codeIns}"/>"/>
            <input type="hidden" name="action" value="modifprofil"/>
            <div class="row" style="margin-left:25px">
                <table>
                    <tr>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-briefcase"></i></span>
                                        <input class="input-medium" type="text" name="nom_ins" value="<c:out value="${sessionScope.sessionUtilisateur.nomIns}"/>">
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-envelope"></i></span>
                                        <input class="input-medium" type="text" name="email_ins" value="<c:out value="${sessionScope.sessionUtilisateur.emailIns}"/>">
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
                                        <<input class="input-medium" type="text" name="tel_ins" value="<c:out value="${sessionScope.sessionUtilisateur.telIns}"/>">
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
                                        <input class="input-medium" type="text" name="site_ins" value="<c:out value="${sessionScope.sessionUtilisateur.siteIns}"/>">
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
                                        <input class="input-medium" type="text" name="nom_resp_ins" value="<c:out value="${sessionScope.sessionUtilisateur.nomRespIns}"/>">
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
                                        <input class="input-medium" type="text" name="prenom_resp_ins" value="<c:out value="${sessionScope.sessionUtilisateur.prenomRespIns}"/>">
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
                                        <input class="input-medium" type="password" name="pass1" placeholder="Mot de Passe">
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
                                        <input class="input-medium" type="password" name="pass2" placeholder="Mot de Passe">
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
                </table>
                <table>
                    <tr>
                        <td>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-comment"></i></span>
                                        <textarea class="input" rows="2" style="width:650px" name="descr_ins"><c:out value="${sessionScope.sessionUtilisateur.descripIns}"/></textarea>
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
                        <td><a class="btn btn-danger" href="<c:url value="/ProfilInstitutServlet?action=affich&id=${sessionScope.sessionUtilisateur.codeIns}"/>"></i> Annuler</a></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td><button class="btn btn-info" type="submit"></i> Valider</button></td>
                    </tr>
                </table>
            </div>
        </form> 
    </c:otherwise>
</c:choose>

