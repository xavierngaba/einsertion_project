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
import model.Formation;

/**
 *
 * @author XAVIER
 */
@Stateless
public class FormationImplDAO implements FormationDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void creerFormation(Formation formation) {
        em.persist(formation);
    }

    @Override
    public void modifFormation(Formation formation) {
        em.merge(formation);
    }

    @Override
    public void suprFormation(Long codeForm) {
        em.remove(getFormation(codeForm));
    }

    @Override
    public List<Formation> getFormationCandidat(Candidat candidat) {
        Query query = em.createNamedQuery("Formation.findAllByCodeCan");
        query.setParameter("codeCan", candidat.getCodeCan());
        return query.getResultList();
    }

    @Override
    public Formation getFormation(Long codeForm) {
        return em.find(Formation.class, codeForm);
    }
}
