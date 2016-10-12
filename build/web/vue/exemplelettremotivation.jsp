<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.joda.org/joda/time/tags"  prefix="joda" %>

<form method="Post" action="<c:url value="/PostulationServlet"/>">
    <input type="hidden" name="action" value="valider"/>
    <input type="hidden" name="codeCan" value="${sessionScope.sessionUtilisateur.codeCan}"/>
    <input type="hidden" name="codeEnt" value="${requestScope.Entreprise.codeEnt}"/>
    <input type="hidden" name="codeOffreEmp" value="${requestScope.OffreEmploi.codeOffreEmp}"/>
        <table>
            <tr>
              <td>
                  <div class="control-group">
                      <div class="controls">
                          <div class="input-prepend">
                              <span class="add-on"><i class="icon-envelope"></i></span>
                              <textarea class="input" rows="32" style="width:675px; line-height: 1.5" name="libelle">
              &nbsp;<c:out value="${sessionScope.sessionUtilisateur.nomCan}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${sessionScope.sessionUtilisateur.villeCan}"/> le <joda:format value="${ requestScope.date }" pattern="dd MMMM yyyy"/>
              &nbsp;<c:out value="${sessionScope.sessionUtilisateur.prenomCan}"/>
              &nbsp;T&eacute;l: <c:out value="${sessionScope.sessionUtilisateur.tel1Can}"/>
              &nbsp;Email: <c:out value="${sessionScope.sessionUtilisateur.emailCan}"/>
              &nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;Objet: Lettre de Motivation &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A monsieur le Directeur Générale de <c:out value="${requestScope.OffreEmploi.codeEnt.nomEnt}"/>
              &nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp; Monsieur le Charg&eacute; des Ressources Humaines,
              &nbsp;&nbsp;&nbsp;
              Votre &eacute;tablissement de par son  professionnalisme et par sa grande notori&eacute;t&eacute;, a suscit&eacute; en moi des sentiments d&DiacriticalAcute;admiration et de grande estime pour celui-ci. Titulaire d&DiacriticalDot;un diplome de <c:out value="${requestScope.formation.diplome}"/> Option <c:out value="${requestScope.formation.option}"/> obtenu durant l&DiacriticalAcute;ann&eacute;e acad&eacute;mique <c:out value="${requestScope.formation.anneeAca}"/>. Je suis à la recherche d&DiacriticalAcute;un emploi.
              &nbsp;&nbsp;&nbsp;
              Votre entreprise de grande renomm&eacute;e, retient toute mon attention car je sais m&DiacriticalAcute;y former efficacement en acqu&eacute;rant un grand nombre de connaissances et de comp&eacute;tences. Je viens aupr&egrave;s de votre haute personnalit&eacute;, dot&eacute;e de mon dynamisme, d&DiacriticalAcute;une volont&eacute; d&DiacriticalAcute;acier, d&DiacriticalAcute;un grand sens du travail coupl&eacute; d&DiacriticalAcute;une bonne assiduit&eacute; et enfin de <c:out value="${requestScope.nbEx}"/> exp&eacute;rience(s) en entreprise dont les d&eacute;tails sont mentionn&eacute;s dans mon Curriculum Vitae, joint &agrave; ma postulation.
              &nbsp;&nbsp;&nbsp;
              Souhaitant vous exposer l&DiacriticalAcute;&eacute;tendue de mes motivations pour le poste de <c:out value="${requestScope.OffreEmploi.poste}"/>, en r&eacute;ponse &agrave; l&DiacriticalAcute;annonce d&DiacriticalAcute;offre d&DiacriticalAcute;emploi du <c:out value="${requestScope.OffreEmploi.dateOffreEmp}"/>, je vous serais reconnaissant de bien vouloir m&DiacriticalAcute;accorder une opportunit&eacute; qui me permettrait de  vous faire part de  mes aptitudes d&DiacriticalAcute;apprentissage, de mon projet professionnel et de mes autres qualit&eacute;s que j&DiacriticalAcute;aurais omis de citer.
              &nbsp;&nbsp;&nbsp;&nbsp;
              Dans l&DiacriticalAcute;attente d&DiacriticalAcute;une suite favorable, je vous prie monsieur le Directeur, d&DiacriticalAcute;accepter  mes salutations les plus vertueuses.


                                                                                                                          <c:out value="${sessionScope.sessionUtilisateur.prenomCan}"/>&nbsp;<c:out value="${sessionScope.sessionUtilisateur.nomCan}"/>
                              </textarea>
                          </div>
                      </div>
                  </div>
              </td>
          </tr> 
      </table>
       <div class="row" style="margin-left: 300px">
            <table>
                <tr>
                    <td>
                       <a class="btn btn-danger" href="<c:url value="/DetailServlet?action=detailoffreemploi&id=${sessionScope.sessionUtilisateur.code.code}&codeEnt=${Entreprise.codeEnt}&codeOffreEmp=${OffreEmploi.codeOffreEmp}&type=candidat"/>">Annuler <i class="icon-remove icon-white"></i></a> 
                    </td>
                    <td>
                       <button class="btn btn-info" type="submit"><i class="icon-plus icon-white"></i>Confirmer</button> 
                    </td>
                </tr>
            </table>
        </div>
    </form>

