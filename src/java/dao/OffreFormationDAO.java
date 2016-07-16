/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.OffreFormation;

/**
 *
 * @author xavier_ng
 */
public interface OffreFormationDAO {

    void ajoutOffreFormation(OffreFormation offreFormation);

    OffreFormation getOffreFormation(Long codeOffreForm);

    OffreFormation getOffreFormationByCode(OffreFormation offreFormation);

    List<OffreFormation> getOffreFormationByDomaine(String domaine);

    List<OffreFormation> getOffreFormationByIns(Long codeIns);

    List<OffreFormation> getOffreFormationByVille(String ville);

    void modifOffreFormation(OffreFormation offreFormation);

    void suprOffreFormation(Long codeOffreForm);

    List<OffreFormation> getAllFormation();
    
}
