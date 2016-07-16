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
public class PostulatImplDAO {
   @PersistenceContext
    private EntityManager em; 

    public void ajoutPostulation(Postulat postulat) {
        em.persist(postulat);
    }

    public List<Postulat> getPostulationByCandidat(Long codeCan) {
        Query query = em.createNamedQuery("Postulat.findByCodeCan");
        query.setParameter("codeCan", codeCan);
        return query.getResultList();
    }

    public List<Postulat> getPostulationByOffreEmploi(Long codeOffreEmploi) {
        Query query = em.createNamedQuery("Postulat.findByCodeCan");
        query.setParameter("codeOffreEmp", codeOffreEmploi);
        return query.getResultList();
    }
}
