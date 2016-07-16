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
import model.OffreEmploi;
import model.Users;

/**
 *
 * @author xavier_ng
 */
@Stateless
public class OffreEmploieImplDAO implements OffreEmploiDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void ajoutOffreEmploie(OffreEmploi offreEmploi) {
        em.persist(offreEmploi);
    }

    @Override
    public void modifOffreEmploie(OffreEmploi offreEmploi) {
        em.merge(offreEmploi);
    }

    @Override
    public void suprOffreEmploi(Long codeOffreEmp) {
        em.remove(getOffreEmploi(codeOffreEmp));
    }

    @Override
    public OffreEmploi getOffreEmploi(Long codeOffreEmploi) {
        return em.find(OffreEmploi.class, codeOffreEmploi);
    }

    @Override
    public OffreEmploi getOffreEmploiByCode(OffreEmploi offreEmploi) {
        Query query = em.createNamedQuery("OffreEmploi.findByCodeOffreEmp");
        query.setParameter("codeOffreEmp", offreEmploi.getCodeOffreEmp());
        return (OffreEmploi) query.getSingleResult();
    }

    @Override
    public List<OffreEmploi> getOffreEmploiByDomaine(String domaine) {
        Query query = em.createNamedQuery("OffreEmploi.findByDomaine");
        query.setParameter("domaine", domaine);
        return query.getResultList();
    }

    @Override
    public List<OffreEmploi> getOffreEmploiByEnt(Long codeEnt) {
        Query query = em.createNamedQuery("OffreEmploi.findByEnt");
        query.setParameter("codeEnt", codeEnt);
        return query.getResultList();
    }

    @Override
    public List<OffreEmploi> getOffreEmpByVille(String ville) {
        Query query = em.createNamedQuery("OffreEmploi.findByVillePoste");
        query.setParameter("villePoste", ville);
        return query.getResultList();
    }

    @Override
    public List<OffreEmploi> getOffreEmploiByEntByUser(Users codeUser) {
        Query query = em.createNamedQuery("OffreEmploi.findByVillePoste");
        query.setParameter("codeUser", codeUser.getCode());
        return query.getResultList();
    }

    @Override
    public List<OffreEmploi> getAllOffreEmploi() {
        return em.createNamedQuery("OffreEmploi.findAll").getResultList();
    }
}
