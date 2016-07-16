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
import model.Inscription;

/**
 *
 * @author xavier_ng
 */
@Stateless
public class InscriptionImplDAO implements InscriptionDAO {
    @PersistenceContext
    private EntityManager em;
    
    @Override
    public List<Inscription> getAllInscriptionByCandidat(Long codeCan){
        Query query = em.createNamedQuery("Inscription.findAllByCodeCan");
        query.setParameter("codeCan", codeCan);
        return query.getResultList();
    }
    
    @Override
    public void ajoutInscription(Inscription inscription) {
        em.persist(inscription);
    }

    @Override
    public List<Inscription> getInscriptionByCandidat(Long codeCan) {
        Query query = em.createNamedQuery("Inscription.findByCodeCan");
        query.setParameter("codeCan", codeCan);
        return query.getResultList();
    }

    @Override
    public List<Inscription> getInscriptionByOffreFormation(Long codeForm) {
        Query query = em.createNamedQuery("Inscription.findByCodeOffreForm");
        query.setParameter("codeOffreForm", codeForm);
        return query.getResultList();
    }
    
    @Override
    public List<Inscription> getInscription(long codeCan, long codeOffreForm) {
        Query query = em.createNamedQuery("Inscription.findDoublon");
        query.setParameter("codeCan", codeCan);
        query.setParameter("codeOffreForm", codeOffreForm);
        return query.getResultList();
    }
    
    @Override
    public void suprInscription(Long codeCan, Long codeOffreForm){
        em.remove(getInscription(codeCan, codeOffreForm));
    }
    
}
