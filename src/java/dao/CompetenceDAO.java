/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Candidat;
import model.Competence;

/**
 *
 * @author XAVIER
 */
public interface CompetenceDAO {

    void ModifCompetence(Competence competence);

    void SuprCompetence(Long codeComp);

    void creerCompetence(Competence competence);

    Competence getCompetence(Long codeComp);

    List<Competence> getCompetenceCandidat(Candidat candidat);
    
}
