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
import model.ExperiencePro;

/**
 *
 * @author XAVIER
 */
@Stateless
public class ExperienceImplDAO implements ExperienceDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void creerExpPro(ExperiencePro experience) {
        em.persist(experience);
    }

    @Override
    public void modifExpPro(ExperiencePro experience) {
        em.merge(experience);
    }

    @Override
    public void suprExpPro(Long codeExp) {
        em.remove(getExperience(codeExp));
    }

    @Override
    public List<ExperiencePro> getExperienceCandidat(Candidat candidat) {
        Query query = em.createNamedQuery("ExperiencePro.findAllByCodeCan");
        query.setParameter("codeCan", candidat.getCodeCan());
        return query.getResultList();
    }

    @Override
    public ExperiencePro getExperience(Long codeExp) {
        return em.find(ExperiencePro.class, codeExp);
    }
}
