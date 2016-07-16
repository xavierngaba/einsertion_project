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
import model.Users;

/**
 *
 * @author XAVIER
 */
@Stateless
public class CandidatImplDAO implements CandidatDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void ajoutCandidat(Candidat candidat) {
        em.persist(candidat);
        em.persist(candidat.getCode());
    }

    @Override
    public void modifCandidat(Candidat candidat) {
        em.merge(candidat);
    }

    @Override
    public Candidat getCandidat(Users user) {
        Query query = em.createNamedQuery("Candidat.findByCode");
        query.setParameter("code", user.getCode());
        return (Candidat) query.getSingleResult();
    }

    @Override
    public List<Candidat> getAllCandidat() {
        return em.createNamedQuery("Candidat.findAll").getResultList();
    }

    @Override
    public Candidat getCandidatById(Long codeCan) {
        return em.find(Candidat.class, codeCan);
    }

    @Override
    public void suprCandidat(Long codeCan) {
        em.remove(getCandidatById(codeCan));
    }

    @Override
    public boolean verifCandidat(Users user) {
        Query query = em.createNamedQuery("Candidat.verifCandidat");
        query.setParameter("code", user.getCode());
        Long result = (Long)query.getSingleResult();
        return result==1;
    }
}
