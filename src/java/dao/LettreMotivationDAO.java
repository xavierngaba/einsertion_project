/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import model.LettreMotivation;

/**
 *
 * @author Dry Bass
 */
public interface LettreMotivationDAO {

    void ajoutLettreMotivation(LettreMotivation lettreMotivation);

    void modifLettreMotivation(LettreMotivation lettreMotivation);
    
    List<LettreMotivation> getLettreMotivation(long codeOffreEmp);

    LettreMotivation getLettreCandidatOffre(Long codeCan, Long codeOffreEmp);

    void suprLettreMotivation(Long codeCan, Long codeOffreEmp);
}
