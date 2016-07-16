/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;

import dao.UserDAO;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;
import model.Users;

/**
 *
 * @author XAVIER
 */
public final class ConnexionForm {
    @EJB
    private UserDAO userDAO;
    private static final String CHAMP_LOGIN = "login";
    private static final String CHAMP_PASSWORD = "password";
    private String resultat;
    public String getResultat() {
		return resultat;
	}
    private final Map<String, String> erreurs = new HashMap<String, String>();
    public Map<String, String> getErreurs() {
		return erreurs;
	}
    
    public ConnexionForm(UserDAO userDAO){
        this.userDAO = userDAO;
    }
    public Users connexionUser(HttpServletRequest request)throws Exception{
        String login = getValeurChamp(request, CHAMP_LOGIN);
        String pwd = getValeurChamp(request, CHAMP_PASSWORD);
        Users user = new Users();
        user.setLogin(login);
        user.setPass(pwd);
        try {
            boolean flags = verifUser(user);
            if(flags == true){
                user = userDAO.getUser(user);
                resultat = "succes";
            } else {
                resultat = "echec";
            }    
        } catch (Exception e) {
                    setErreur("user", e.getMessage());
        }
        
        return user;
    }
    private boolean verifUser(Users user) throws Exception {
        boolean flags = false;
        if ( userDAO.verifUser(user) == true ) {
            flags = true;
        } else {
            throw new Exception( "Merci d'entrer des données valides...Sinon bien vouloir vous inscrire" );
        }
        return flags;
    }
    /*
    * Ajoute un message correspondant au champ spÃ©cifiÃ© Ã  la map des erreurs.
    */
   private void setErreur(String champ, String message) {
           erreurs.put(champ, message);
   }
    /*
    * MÃ©thode utilitaire qui retourne null si un champ est vide, et son contenu
    * sinon.
    */
   private static String getValeurChamp(HttpServletRequest request,String nomChamp) {
           String valeur = request.getParameter(nomChamp);
           if (valeur == null || valeur.trim().length() == 0) {
                   return null;
           } else {
                   return valeur;
           }
   }
}
