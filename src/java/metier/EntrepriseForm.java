/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;

import dao.EntrepriseDAO;
import exception.FormValidationException;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;
import model.Entreprise;
import model.Users;

/**
 *
 * @author xavier_ng
 */
public class EntrepriseForm {
   @EJB
   private EntrepriseDAO entrepriseDAO;
   private static final String CHAMP_NOM_ENT = "nom_ent";
   private static final String CHAMP_NOM_RESP_ENT = "nom_resp_ent";
   private static final String CHAMP_PRENOM_RESP_ENT = "prenom_resp_ent";
   private static final String CHAMP_SECTEUR = "sect_act";
   private static final String CHAMP_TEL = "tel_ent";
   private static final String CHAMP_LOGIN = "login";
   private static final String CHAMP_SITE = "site_ent";
   private static final String CHAMP_EMAIL_ENT = "email_ent";
   private static final String CHAMP_PASSWORD = "password";
   private static final String CHAMP_PASSWORD2 = "password2";
   private static final String CHAMP_DESCRIPTION = "descr_ent";
   private String resultat;
   public String getResultat() {
        return resultat;
   }
    private final Map<String, String> erreurs = new HashMap<String, String>();
    public Map<String, String> getErreurs() {
		return erreurs;
	}

    public EntrepriseForm(EntrepriseDAO entrepriseDAO) {
        this.entrepriseDAO = entrepriseDAO;
    }
    public Entreprise creerEntreprise(HttpServletRequest request)throws FormValidationException{
       String nom_ent = getValeurChamp(request, CHAMP_NOM_ENT);
       String sect_act = getValeurChamp(request, CHAMP_SECTEUR);
       String tel_ent = getValeurChamp(request, CHAMP_TEL);
       String site_ent = getValeurChamp(request, CHAMP_SITE);
       String descr_ent = getValeurChamp(request, CHAMP_DESCRIPTION);
       String nom_resp_ent = getValeurChamp(request, CHAMP_NOM_RESP_ENT);
       String prenom_resp_ent = getValeurChamp(request, CHAMP_PRENOM_RESP_ENT);
       String email_ent = getValeurChamp(request, CHAMP_EMAIL_ENT);
       String login = getValeurChamp(request, CHAMP_LOGIN);
       String password = getValeurChamp(request, CHAMP_PASSWORD);
       String password2 = getValeurChamp(request, CHAMP_PASSWORD2);
       Entreprise entreprise = new Entreprise();
       Users user = new Users();
       try {
                    validationNomEnt(nom_ent);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_NOM_ENT, e.getMessage());
            }
       entreprise.setNomEnt(nom_ent);
       entreprise.setSectAct(sect_act);
       try {
                    validationTelephone(tel_ent);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_TEL, e.getMessage());
            }
       entreprise.setTelEnt(tel_ent);
       entreprise.setSiteEnt(site_ent);
       try {
                    validationNom(nom_resp_ent);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_NOM_RESP_ENT, e.getMessage());
            }
       entreprise.setNomRespEnt(nom_resp_ent);
       try {
                    validationPrenom(prenom_resp_ent);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_PRENOM_RESP_ENT, e.getMessage());
            }
       entreprise.setPrenomRespEnt(prenom_resp_ent);
       try {
                    validationEmail(email_ent);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_EMAIL_ENT, e.getMessage());
            }
       entreprise.setEmailEnt(email_ent);
       try {
                    validationLogin(login);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_LOGIN, e.getMessage());
            }
       user.setLogin(login);
       try {
                    validationPassword(password,password2);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_PASSWORD, e.getMessage());
                    setErreur(CHAMP_PASSWORD2, e.getMessage());
            }
       user.setPass(password);
       entreprise.setDescrEnt(descr_ent);
       entreprise.setCode(user);
       try{
           if(erreurs.isEmpty()){
               entrepriseDAO.ajoutEntreprise(entreprise);
               resultat = "succes";
            } else {
                    resultat = "echec";
            }
       }catch (Exception e) {
                setErreur("imprévu", "Erreur imprévue lors de la création.");
                resultat = "Echec de la création de l'entreprise : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
        }
        return entreprise;  
    }
    public void modifEntreprise(HttpServletRequest request,Users user,Long codeEnt)throws FormValidationException{
       String nom_ent = getValeurChamp(request, CHAMP_NOM_ENT);
       String sect_act = getValeurChamp(request, CHAMP_SECTEUR);
       String tel_ent = getValeurChamp(request, CHAMP_TEL);
       String site_ent = getValeurChamp(request, CHAMP_SITE);
       String descr_ent = getValeurChamp(request, CHAMP_DESCRIPTION);
       String nom_resp_ent = getValeurChamp(request, CHAMP_NOM_RESP_ENT);
       String prenom_resp_ent = getValeurChamp(request, CHAMP_PRENOM_RESP_ENT);
       String email_ent = getValeurChamp(request, CHAMP_EMAIL_ENT);
       String login = getValeurChamp(request, CHAMP_LOGIN);
       String password = getValeurChamp(request, CHAMP_PASSWORD);
       String password2 = getValeurChamp(request, CHAMP_PASSWORD2);
       Entreprise entreprise = new Entreprise();
       entreprise.setCodeEnt(codeEnt);
       try {
                    validationNomEnt(nom_ent);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_NOM_ENT, e.getMessage());
            }
       entreprise.setNomEnt(nom_ent);
       entreprise.setSectAct(sect_act);
       try {
                    validationTelephone(tel_ent);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_TEL, e.getMessage());
            }
       entreprise.setTelEnt(tel_ent);
       entreprise.setSiteEnt(site_ent);
       try {
                    validationNom(nom_resp_ent);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_NOM_RESP_ENT, e.getMessage());
            }
       entreprise.setNomRespEnt(nom_resp_ent);
       try {
                    validationPrenom(prenom_resp_ent);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_PRENOM_RESP_ENT, e.getMessage());
            }
       entreprise.setPrenomRespEnt(prenom_resp_ent);
       try {
                    validationEmail(email_ent);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_EMAIL_ENT, e.getMessage());
            }
       entreprise.setEmailEnt(email_ent);
       try {
                    validationLogin(login);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_LOGIN, e.getMessage());
            }
       user.setLogin(login);
       try {
                    validationPassword(password,password2);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_PASSWORD, e.getMessage());
                    setErreur(CHAMP_PASSWORD2, e.getMessage());
            }
       user.setPass(password);
       entreprise.setDescrEnt(descr_ent);
       entreprise.setCode(user);
       try{
           if(erreurs.isEmpty()){
               entrepriseDAO.modifEntreprise(entreprise);
               resultat = "succes";
            } else {
                    resultat = "echec";
            }
       }catch (Exception e) {
                setErreur("imprévu", "Erreur imprévue lors de la création.");
                resultat = "Echec de la création de l'entreprise : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
        }  
    }
    private void validationNomEnt( String nom ) throws FormValidationException {
        if ( nom != null ) {
            if ( nom.length() < 3 ) {
                throw new FormValidationException( "Votre nom doit contenir au moins 3 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer le nom de l'entreprise " );
        }
    }
    private void validationNom( String nom ) throws FormValidationException {
        if ( nom != null ) {
            if ( nom.length() < 3 ) {
                throw new FormValidationException( "Votre nom doit contenir au moins 3 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer le nom d'un responsable " );
        }
    }
    
    private void validationPrenom( String prenom ) throws FormValidationException {
        if ( prenom != null ) {
            if ( prenom.length() < 3 ) {
                throw new FormValidationException( "Votre prénom doit contenir au moins 3 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer le prénom d'un responsable " );
        }
    }
    private void validationLogin(String login) throws FormValidationException {
		if (login != null) {
			if (login.length() < 10) {
				throw new FormValidationException("Le nom d'utilisateur doit contenir au moins 10 caractères.");
			}
		} else {
			throw new FormValidationException("Merci d'entrer un nom d'utilisateur.");
		}
	}
	private void validationPassword(String password,String password2) throws FormValidationException {
            if(password != null && password2 != null){
                if ((4 < password.length() && password.length() < 20) && (4 < password2.length() && password2.length() < 10)) {
                    if(!password.equals(password2)){
                        throw new FormValidationException("Les mots de passes doivent être les mêmes!!!");  
                    }	
		}else{
                    throw new FormValidationException("Le mot de passe doit être compris entre 4 et 20 caractères.");
                }
            }else {
                throw new FormValidationException("Merci de saisir le mot de passe.");
            }	
	}
        
	private void validationTelephone(String telephone)throws FormValidationException {
		if (telephone != null) {
			if (!telephone.matches("^\\d+$")) {
				throw new FormValidationException("Le numèro de téléphone doit uniquement contenir des chiffres.");
			} else if (telephone.length() < 8) {
				throw new FormValidationException("Le numèro de téléphone doit contenir au moins 8 chiffres.");
			}
		} else {
			throw new FormValidationException("Merci d'entrer un numéro de téléphone.");
		}
	}

	private void validationEmail(String email) throws FormValidationException {
		if (email != null ) {
                    if(!email.matches("([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)")){
                      throw new FormValidationException("Merci de saisir une adresse mail valide.");  
                    }	
		}else{
                    throw new FormValidationException("Merci de saisir une adresse mail .");
                }
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
