<%-- 
    Document   : cvtheque
    Created on : 28 sept. 2014, 18:48:07
    Author     : xavier_ng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="affichtableau1">
    <table class="table table-hover">
        <c:forEach items="${ requestScope.listCandidat }" var="candidat" varStatus="boucle">
            <c:if test="${ boucle.index < 3 }">

                   <tr class="${boucle.index % 2 == 0 ? 'info' : ''}">
                    <td>
                        <img class="img-polaroid" alt="Photo de profil" width="70px" height="70px" src="<c:url value="images/profil/profil.jpg"/>">
                    </td>
                    <td>
                        <a href="<c:url value="/DetailServlet?action=detailcv&codeCan=${candidat.codeCan}&codeUser=${sessionScope.sessionUtilisateur.codeEnt}&type=entreprise"/>" style="text-decoration: none">
                        <b class="text-error" style="font-style: italic">
                            <c:out value="${candidat.domaine}"/>
                        </b><br/>
                        <c:out value="${candidat.nomCan}"/>&nbsp;
                        <c:out value="${candidat.prenomCan}"/><br/>
                        <c:out value="${candidat.tel1Can}"/><br/>
                        <c:out value="${candidat.villeCan}"/><br/>
                        </a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    </div>
    <div id="affichtableau2" style="display:none;">
    <table class="table table-condensed">
        <c:forEach items="${ requestScope.listCandidat }" var="candidat" varStatus="boucle">
            <c:if test="${ boucle.index >= 3 }">
                <tr class="${boucle.index % 2 == 0 ? 'info' : ''}">
                    <td>
                        <img class="img-polaroid" alt="Photo de profil" width="70px" height="70px" src="<c:url value="images/profil/profil.jpg"/>">
                    </td>
                    <td>
                        <!-- NAVBAR
                        <a href="/CvServlet?id=${candidat.codeCan}" style="text-decoration: none">
                        -->
                        <b class="text-error" style="font-style: italic">
                            <c:out value="${candidat.domaine}"/>
                        </b><br/>
                        <c:out value="${candidat.nomCan}"/>&nbsp;
                        <c:out value="${candidat.prenomCan}"/><br/>
                        <c:out value="${candidat.tel1Can}"/><br/>
                        <c:out value="${candidat.villeCan}"/><br/>
                        </a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    </div>
    <div class="pagination pagination-centered">
    <ul class="pager">
        <li class="previous disabled">
            <a href="#" onclick="hide('affichtableau2');show('affichtableau1');">&larr; Precedent</a>
        </li>
        <li>
        <li class="active">
            <a href="#" onclick="hide('affichtableau2');show('affichtableau1');">1</a>
        </li>
        <li>
            <a href="#" onclick="hide('affichtableau1');show('affichtableau2');">2</a>
        </li>
        <li class="next">
            <a href="#" onclick="hide('affichtableau1');show('affichtableau2');">Suivant &rarr;</a>
        </li>
    </ul>
</div>

