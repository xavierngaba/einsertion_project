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
import model.Cv;

/**
 *
 * @author XAVIER
 */
@Stateless
public class CvImplDAO implements CvDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public boolean verifCV(Candidat candidat) {
        Query query = em.createNamedQuery("Cv.verif");
        query.setParameter("codeCan", candidat.getCodeCan());
        Long result = (Long) query.getSingleResult();
        return result==1 ;
    }

    @Override
    public void creerCV(Cv cv) {
        em.persist(cv);
    }

    @Override
    public void modifCv(Cv cv,Long codeCv) {
        em.merge(cv);
        em.remove(getCv(codeCv));
    }

    @Override
    public void suprCv(Long codeCv) {
        em.remove(getCv(codeCv));
    }

    @Override
    public List<Cv> getAllCv() {
        return em.createNamedQuery("Cv.findAll").getResultList();
    }

    @Override
    public Cv getCvCandidat(Long codeCan) {
        Query query = em.createNamedQuery("Cv.findByCodeCan");
        query.setParameter("codeCan", codeCan);
        return (Cv) query.getSingleResult();
    }

    @Override
    public Cv getCv(Long codeCv) {
        return em.find(Cv.class, codeCv);
    }
}
