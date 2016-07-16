/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Institut;
import model.Users;

/**
 *
 * @author XAVIER
 */
public interface InstitutDAO {

    void ajoutInstitut(Institut institut);

    List<Institut> getAllInstitut();

    Institut getInstitut(Users user);

    void modifInstitut(Institut institut);

    boolean verifInstitut(Users user);

    Institut getInstitut(Long codeIns);
    
}
