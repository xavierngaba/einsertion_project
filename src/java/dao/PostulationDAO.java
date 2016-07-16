/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Postulat;

/**
 *
 * @author xavier_ng
 */
public interface PostulationDAO {

    void ajoutPostulation(Postulat postulat);

    List<Postulat> getAllPostulationByCandidat(Long codeCan);

    List<Postulat> getAllPostulationByOffreEmploi(Long codeOffreEmp);

    Boolean verifPostulation(Long codeCan, Long codeOffreEmp);

    Postulat getPostulatByCandidatOffreEmp(Long codeCan, Long codeOffreEmp);

    void suprPostulation(Long codeCan, Long codeOffreEmp);

    List<Postulat> getAllPostulationByCodeEnt(long codeEnt);
    
}
