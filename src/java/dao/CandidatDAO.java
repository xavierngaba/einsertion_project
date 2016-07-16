/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Candidat;
import model.Users;

/**
 *
 * @author XAVIER
 */
public interface CandidatDAO {

    void ajoutCandidat(Candidat candidat);

    List<Candidat> getAllCandidat();

    Candidat getCandidat(Users user);

    void modifCandidat(Candidat candidat);

    Candidat getCandidatById(Long codeCan);

    void suprCandidat(Long codeCan);

    boolean verifCandidat(Users user);
    
}
