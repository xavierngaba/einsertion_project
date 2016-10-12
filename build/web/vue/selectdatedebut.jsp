<%-- 
    Document   : selectdate
    Created on : 6 sept. 2014, 19:52:19
    Author     : xavier_ng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<select class="span3" name="jourdebut">
    <option value=" ">JJ</option>
    <c:forEach var="i" begin="1" end="31" step="1">
        <option value="<c:out value="${i}"/>"><c:out value="${i}"/></option>
    </c:forEach>
</select>&nbsp;&nbsp;
<select class="input-small" name="moisdebut">
    <option value=" ">MMMM</option>
    <option value="01">Janvier</option>
    <option value="02">F&eacute;vrier</option>
    <option value="03">Mars</option>
    <option value="04">Avril</option>
    <option value="05">Mai</option>
    <option value="06">Juin</option>
    <option value="07">Juillet</option>
    <option value="08">Ao&ucirc;t</option>
    <option value="09">Septembre</option>
    <option value="10">Octobre</option>
    <option value="11">Novembre</option>
    <option value="12">Decembre</option>
</select>&nbsp;&nbsp;
<select class="input-small" name="anneedebut">
    <option value=" ">AAAA</option>
    <c:forEach var="i" begin="1970" end="2014" step="1">
        <option value="<c:out value="${i}"/>"><c:out value="${i}"/></option>
    </c:forEach>
</select>
