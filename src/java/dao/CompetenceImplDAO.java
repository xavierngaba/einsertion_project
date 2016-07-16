/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Candidat;
import model.Competence;

/**
 *
 * @author XAVIER
 */
@Stateless
public class CompetenceImplDAO implements CompetenceDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void creerCompetence(Competence competence) {
        em.persist(competence);
    }

    @Override
    public void ModifCompetence(Competence competence) {
        em.merge(competence);
    }

    @Override
    public void SuprCompetence(Long codeComp) {
        em.remove(getCompetence(codeComp));
    }

    @Override
    public List<Competence> getCompetenceCandidat(Candidat candidat) {
        Query query = em.createNamedQuery("Competence.findAllByCodeCan");
        query.setParameter("codeCan", candidat.getCodeCan());
        return query.getResultList();
    }

    @Override
    public Competence getCompetence(Long codeComp) {
        return em.find(Competence.class, codeComp);
    }
}
