/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Inscription;

/**
 *
 * @author xavier_ng
 */
public interface InscriptionDAO {

    void ajoutInscription(Inscription inscription);

    List<Inscription> getInscriptionByCandidat(Long codeCan);

    List<Inscription> getInscriptionByOffreFormation(Long codeForm);
    
    public List<Inscription> getAllInscriptionByCandidat(Long codeCan);
    
    public List<Inscription> getInscription(long codeCan, long codeOffreForm);
    
    public void suprInscription(Long codeCan, Long codeOffreForm);
    
}
