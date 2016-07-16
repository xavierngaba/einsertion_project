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
import model.Postulat;

/**
 *
 * @author xavier_ng
 */
@Stateless
public class PostulationImplDAO implements PostulationDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void ajoutPostulation(Postulat postulat) {
        em.persist(postulat);
    }

    @Override
    public List<Postulat> getAllPostulationByOffreEmploi(Long codeOffreEmp) {
        Query query = em.createNamedQuery("Postulat.findByCodeOffreEmp");
        query.setParameter("codeOffreEmp", codeOffreEmp);
        return query.getResultList();
    }

    @Override
    public List<Postulat> getAllPostulationByCandidat(Long codeCan) {
        Query query = em.createNamedQuery("Postulat.findByCodeCan");
        query.setParameter("codeCan", codeCan);
        return query.getResultList();
    }

    @Override
    public Boolean verifPostulation(Long codeCan, Long codeOffreEmp) {
        Query query = em.createNamedQuery("Postulat.verif");
        query.setParameter("codeCan", codeCan);
        query.setParameter("codeOffreEmp", codeOffreEmp);
        Long result = (Long) query.getSingleResult();
        return result == 1;
    }

    @Override
    public Postulat getPostulatByCandidatOffreEmp(Long codeCan, Long codeOffreEmp) {
        Query query = em.createNamedQuery("Postulat.findByCandidatOffreEmp");
        query.setParameter("codeCan", codeCan);
        query.setParameter("codeOffreEmp", codeOffreEmp);
        return (Postulat) query.getSingleResult();
    }

    @Override
    public void suprPostulation(Long codeCan, Long codeOffreEmp) {
        em.remove(getPostulatByCandidatOffreEmp(codeCan, codeOffreEmp));
    }

    @Override
    public List<Postulat> getAllPostulationByCodeEnt(long codeEnt) {
        Query query = em.createNamedQuery("Postulat.findByCodeEnt");
        query.setParameter("codeEnt", codeEnt);
        return query.getResultList();
    }
    
    
}
