/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Users;

/**
 *
 * @author XAVIER
 */
public interface UserDAO {

    void ajoutUser(Users user);

    List<Users> getAllUser();

    Users getUser(Users user);

    boolean verifUser(Users user);

    void modifUser(Users user);

    void suprUser(long idUser);

    Users getUserById(Long code);

    boolean trouver(String login);
    
}
