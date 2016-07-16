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
import model.Institut;
import model.Users;

/**
 *
 * @author XAVIER
 */
@Stateless
public class InstitutImplDAO implements InstitutDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void ajoutInstitut(Institut institut) {
        em.persist(institut);
        em.persist(institut.getCode());
    }

    @Override
    public void modifInstitut(Institut institut) {
        em.merge(institut);
    }

    @Override
    public Institut getInstitut(Users user) {
        Query query = em.createNamedQuery("Institut.findByCode");
        query.setParameter("code", user.getCode());
        return (Institut) query.getSingleResult();
    }

    @Override
    public List<Institut> getAllInstitut() {
        return em.createNamedQuery("Institut.findAll").getResultList();
    }

    @Override
    public boolean verifInstitut(Users user) {
        Query query = em.createNamedQuery("Institut.verifInstitut");
        query.setParameter("code", user.getCode());
        Long result = (Long)query.getSingleResult();
        return result==1;
    }

    @Override
    public Institut getInstitut(Long codeIns) {
        return em.find(Institut.class, codeIns);
    }
}
