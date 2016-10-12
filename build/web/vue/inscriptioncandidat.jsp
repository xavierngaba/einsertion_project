<%-- 
    Document   : inscriptioncandidat
    Created on : Sep 13, 2014, 4:15:15 PM
    Author     : Dry Bass
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${requestScope.erreur == 'ErreurEntreprise' || requestScope.erreur == 'ErreurInstitut'}">
        <div class="tab-pane" id="tab1">
            <div class="well sidebar-nav">
                <form action="<c:url value="/InscriptionCandidatServlet"/>" method="post">
                    <div class="row" style="margin-left:25px">
                        <table>
                            <tr>
                                <td></td>
                                <td>
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-user"></i></span>
                                                <input class="input-medium" type="text" name="nomCandidat" placeholder="Nom" value="<c:out value="${candidat.nomCan}"/>">
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
                                                <input class="input-medium" type="text" name="prenomCandidat" placeholder="Prénom" value="<c:out value="${candidat.prenomCan}"/>">
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
                                                <input type="text" class="input-medium" id="datepicker" name="date_naiss" />
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
                                                <input class="input-medium" type="text" name="loginCandidat" placeholder="Login" value="<c:out value="${candidat.code.login}"/>">
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
                                                <input class="input-medium" type="password" name="password" placeholder="Mot de Passe" value="<c:out value="${candidat.code.pass}"/>">
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
                                                <input class="input-medium" type="text" name="adresseCandidat" placeholder="Adresse" value="<c:out value="${candidat.adresse}"/>">
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
                                                <input class="input-medium" type="text" name="villeCandidat" placeholder="Ville" value="<c:out value="${candidat.villeCan}"/>">
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
                                                <input class="input-medium" type="text" name="telCandidat" placeholder="Téléphone" value="<c:out value="${candidat.tel1Can}"/>">
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
                                                <input class="input-medium" type="text" name="emailCandidat" placeholder="E-mail" value="<c:out value="${candidat.emailCan}"/>">
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
                                    <a class="btn btn-danger" href="<c:url value="/ConnexionServlet"/>"><i class="icon-remove icon-white"></i> Annuler</a>
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
        </div>
    </c:when>
    <c:otherwise>
        <div class="tab-pane active" id="tab1">
            <div class="well sidebar-nav">
                <form action="<c:url value="/InscriptionCandidatServlet"/>" method="post">
                    <div class="row" style="margin-left:25px">
                        <table>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-user"></i></span>
                                                <input class="input-medium" type="text" name="nomCandidat" placeholder="Nom" value="<c:out value="${candidat.nomCan}"/>">
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-user"></i></span>
                                                <input class="input-medium" type="text" name="prenomCandidat" placeholder="Prénom" value="<c:out value="${candidat.prenomCan}"/>">
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
                                                <input type="text" class="input-medium" id="datepicker" name="date_naiss" placeholder="Date de Naissance"/>
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
                                <td><span class="text-error">${form.erreurs['date_naiss']}</span></td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;</td>
                                <td>
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-eye-open"></i></span>
                                                <input class="input-medium" type="text" name="loginCandidat" placeholder="Login" value="<c:out value="${candidat.code.login}"/>">
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
                                                <input class="input-medium" type="password" name="password" placeholder="Mot de Passe" value="<c:out value="${candidat.code.pass}"/>">
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
                                                <input class="input-medium" type="text" name="adresseCandidat" placeholder="Adresse" value="<c:out value="${candidat.adresse}"/>">
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
                                                <input class="input-medium" type="text" name="villeCandidat" placeholder="Ville" value="<c:out value="${candidat.villeCan}"/>">
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
                                                <input class="input-medium" type="text" name="telCandidat" placeholder="Téléphone" value="<c:out value="${candidat.tel1Can}"/>">
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
                                                <input class="input-medium" type="text" name="emailCandidat" placeholder="E-mail" value="<c:out value="${candidat.emailCan}"/>">
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
                                    <a class="btn btn-danger" href="<c:url value="/ConnexionServlet"/>"><i class="icon-remove icon-white"></i> Annuler</a>
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
        </div>
    </c:otherwise>
 </c:choose>

