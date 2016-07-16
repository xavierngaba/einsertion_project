/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Candidat;
import model.Formation;

/**
 *
 * @author XAVIER
 */
public interface FormationDAO {

    void creerFormation(Formation formation);

    Formation getFormation(Long codeForm);

    List<Formation> getFormationCandidat(Candidat candidat);

    void modifFormation(Formation formation);

    void suprFormation(Long codeForm);
    
}
