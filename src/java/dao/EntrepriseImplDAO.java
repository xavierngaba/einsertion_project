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
import model.Entreprise;
import model.Users;

/**
 *
 * @author XAVIER
 */
@Stateless
public class EntrepriseImplDAO implements EntrepriseDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void ajoutEntreprise(Entreprise entreprise) {
        em.persist(entreprise);
        em.persist(entreprise.getCode());
    }

    @Override
    public void modifEntreprise(Entreprise entreprise) {
        em.merge(entreprise);
    }

    @Override
    public Entreprise getEntreprise(Users user) {
        Query query = em.createNamedQuery("Entreprise.findByCode");
        query.setParameter("code", user.getCode());
        return (Entreprise) query.getSingleResult();
    }

    @Override
    public List<Entreprise> getAllEntreprise() {
        return em.createNamedQuery("Entreprise.findAll").getResultList();
    }

    @Override
    public boolean verifEntreprise(Users user) {
        Query query = em.createNamedQuery("Entreprise.verifEntreprise");
        query.setParameter("code", user.getCode());
        Long result = (Long)query.getSingleResult();
        return result==1;
    }

    @Override
    public Entreprise getEntreprise(Long codeEnt) {
        return em.find(Entreprise.class, codeEnt);
    }
}
