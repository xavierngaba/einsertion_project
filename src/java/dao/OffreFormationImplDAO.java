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
import model.OffreFormation;

/**
 *
 * @author xavier_ng
 */
@Stateless
public class OffreFormationImplDAO implements OffreFormationDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void ajoutOffreFormation(OffreFormation offreFormation) {
        em.persist(offreFormation);
    }

    @Override
    public void modifOffreFormation(OffreFormation offreFormation) {
        em.merge(offreFormation);
    }

    @Override
    public void suprOffreFormation(Long codeOffreForm) {
        em.remove(getOffreFormation(codeOffreForm));
    }

    @Override
    public OffreFormation getOffreFormation(Long codeOffreForm) {
        return em.find(OffreFormation.class, codeOffreForm);
    }

    @Override
    public OffreFormation getOffreFormationByCode(OffreFormation offreFormation) {
        Query query = em.createNamedQuery("OffreFormation.findByCodeOffreForm");
        query.setParameter("codeOffreForm", offreFormation.getCodeOffreForm());
        return (OffreFormation) query.getSingleResult();
    }

    @Override
    public List<OffreFormation> getOffreFormationByDomaine(String domaine) {
        Query query = em.createNamedQuery("OffreFormation.findByDomaineOffreForm");
        query.setParameter("domaine", domaine);
        return query.getResultList();
    }

    @Override
    public List<OffreFormation> getOffreFormationByIns(Long codeIns) {
        Query query = em.createNamedQuery("OffreFormation.findByIns");
        query.setParameter("codeIns", codeIns);
        return query.getResultList();
    }

    @Override
    public List<OffreFormation> getOffreFormationByVille(String ville) {
        Query query = em.createNamedQuery("OffreFormation.findByVilleForm");
        query.setParameter("villeForm", ville);
        return query.getResultList();
    }

    @Override
    public List<OffreFormation> getAllFormation() {
        return em.createNamedQuery("OffreFormation.findAll").getResultList();
    }
}
