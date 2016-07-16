/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Users;

/**
 *
 * @author XAVIER
 */
@Stateless
public class UserImplDAO implements UserDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void ajoutUser(Users user) {
        em.persist(user);
    }

    @Override
    public void modifUser(Users user) {
        em.merge(user);
    }

    @Override
    public void suprUser(long idUser) {
        em.remove(idUser);
    }

    @Override
    public Users getUser(Users user) {
        Query query = em.createNamedQuery("Users.findByLogPass");
        query.setParameter("login", user.getLogin());
        query.setParameter("pass", user.getPass());
        return (Users) query.getSingleResult();
    }

    @Override
    public List<Users> getAllUser() {
        return em.createNamedQuery("User.findAll").getResultList();
    }

    @Override
    public boolean verifUser(Users user) {
        Query query = em.createNamedQuery("Users.verif");
        query.setParameter("login", user.getLogin());
        query.setParameter("pass", user.getPass());
        Long result = (Long) query.getSingleResult();
        return result==1 ;
    }

    @Override
    public Users getUserById(Long code) {
        return em.find(Users.class, code);
    }

    @Override
    public boolean trouver(String login) {
        Query query = em.createNamedQuery("Users.findByLogin");
        query.setParameter("login", login);
        Long result = (Long) query.getSingleResult();
        return result==1 ;
    }
}
