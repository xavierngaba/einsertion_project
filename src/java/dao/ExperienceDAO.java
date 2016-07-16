/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Candidat;
import model.ExperiencePro;

/**
 *
 * @author XAVIER
 */
public interface ExperienceDAO {

    void creerExpPro(ExperiencePro experience);

    ExperiencePro getExperience(Long codeExp);

    List<ExperiencePro> getExperienceCandidat(Candidat candidat);

    void modifExpPro(ExperiencePro experience);

    void suprExpPro(Long codeExp);
    
}
