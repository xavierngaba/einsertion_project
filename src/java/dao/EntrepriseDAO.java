/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Entreprise;
import model.Users;

/**
 *
 * @author XAVIER
 */
public interface EntrepriseDAO {

    void ajoutEntreprise(Entreprise entreprise);

    List<Entreprise> getAllEntreprise();

    Entreprise getEntreprise(Users user);

    void modifEntreprise(Entreprise entreprise);

    boolean verifEntreprise(Users user);

    Entreprise getEntreprise(Long codeEnt);
    
}
