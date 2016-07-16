/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.LettreMotivation;

/**
 *
 * @author Dry Bass
 */
@Stateless
public class LettreMotivationImplDAO implements LettreMotivationDAO{
    @PersistenceContext
    private EntityManager em;
    
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    @Override
    public void ajoutLettreMotivation(LettreMotivation lettreMotivation) {
        em.persist(lettreMotivation);
    }

    @Override
    public void modifLettreMotivation(LettreMotivation lettreMotivation) {
        em.merge(lettreMotivation);
    }

    @Override
    public List<LettreMotivation> getLettreMotivation(long codeOffreEmp) {
        Query query = em.createNamedQuery("LettreMotivation.findByCodeOffreEmp");
        query.setParameter("codeOffreEmp", codeOffreEmp);
        return query.getResultList();
    }   

    @Override
    public LettreMotivation getLettreCandidatOffre(Long codeCan, Long codeOffreEmp) {
        Query query = em.createNamedQuery("LettreMotivation.findByCandidatOffreEmp");
        query.setParameter("codeCan", codeCan);
        query.setParameter("codeOffreEmp", codeOffreEmp);
        return (LettreMotivation) query.getSingleResult();
    }

    @Override
    public void suprLettreMotivation(Long codeCan, Long codeOffreEmp) {
        em.remove(getLettreCandidatOffre(codeCan, codeOffreEmp));
    }
}
