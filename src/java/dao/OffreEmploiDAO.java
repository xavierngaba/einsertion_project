/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.OffreEmploi;
import model.Users;

/**
 *
 * @author xavier_ng
 */
public interface OffreEmploiDAO {

    void ajoutOffreEmploie(OffreEmploi offreEmploi);

    List<OffreEmploi> getOffreEmpByVille(String ville);

    OffreEmploi getOffreEmploi(Long codeOffreEmploi);

    OffreEmploi getOffreEmploiByCode(OffreEmploi offreEmploi);

    List<OffreEmploi> getOffreEmploiByDomaine(String domaine);

    List<OffreEmploi> getOffreEmploiByEnt(Long codeEnt);

    List<OffreEmploi> getOffreEmploiByEntByUser(Users codeUser);

    void modifOffreEmploie(OffreEmploi offreEmploi);

    void suprOffreEmploi(Long codeOffreEmp);

    List<OffreEmploi> getAllOffreEmploi();
    
}
