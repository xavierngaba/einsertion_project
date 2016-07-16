/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;

import exception.FormValidationException;
import dao.CandidatDAO;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;
import model.Candidat;
import model.Cv;
import model.Users;

/**
 *
 * @author XAVIER
 */
public final class CandidatForm {
    @EJB
    private CandidatDAO candidatDAO;
    private static final String CHAMP_NOM = "nomCandidat";
    private static final String CHAMP_PRENOM = "prenomCandidat";
    private static final String CHAMP_ADRESSE = "adresseCandidat";
    private static final String CHAMP_VILLE = "villeCandidat";
    private static final String CHAMP_TEL = "telCandidat";
    private static final String CHAMP_LOGIN = "loginCandidat";
    private static final String CHAMP_EMAIL = "emailCandidat";
    private static final String CHAMP_PASSWORD = "password";
    private static final String CHAMP_PASSWORD2 = "password2";
    private static final String CHAMP_DOMAINE = "domaine";
    private static final String CHAMP_DATE = "date_naiss";
    private String resultat;
    public String getResultat() {
		return resultat;
	}
    private final Map<String, String> erreurs = new HashMap<String, String>();
    public Map<String, String> getErreurs() {
		return erreurs;
	}

    public CandidatForm(CandidatDAO candidatDAO) {
        this.candidatDAO = candidatDAO;
    }
    public Candidat creerCandidat(HttpServletRequest request)throws FormValidationException{
        String nom = getValeurChamp(request, CHAMP_NOM);
        String prenom = getValeurChamp(request, CHAMP_PRENOM);
        String adresse = getValeurChamp(request, CHAMP_ADRESSE);
        String ville = getValeurChamp(request, CHAMP_VILLE);
        String tel = getValeurChamp(request, CHAMP_TEL);
        String email = getValeurChamp(request, CHAMP_EMAIL);
        String login = getValeurChamp(request, CHAMP_LOGIN);
        String pwd = getValeurChamp(request, CHAMP_PASSWORD);
        String pwd2 = getValeurChamp(request, CHAMP_PASSWORD2);
        String date_nais = getValeurChamp(request, CHAMP_DATE);
        String domaine = getValeurChamp(request, CHAMP_DOMAINE);
        Candidat candidat = new Candidat();
        Users user = new Users();
        Cv cv = new Cv();
        try {
                    validationNom(nom);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_NOM, e.getMessage());
            }
        candidat.setNomCan(nom.toUpperCase());
        try {
                    validationPrenom(prenom);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_NOM, e.getMessage());
            }
        candidat.setPrenomCan(prenom);
        candidat.setAdresse(adresse);
        candidat.setVilleCan(ville);
        try {
                    validationTelephone(tel);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_TEL, e.getMessage());
            }
        candidat.setTel1Can(tel);
        try {
                    validationEmail(email);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_EMAIL, e.getMessage());
            }
        candidat.setEmailCan(email);
        candidat.setDomaine(domaine);
        try {
                    validationLogin(login);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_LOGIN, e.getMessage());
            }
        user.setLogin(login);
        try {
                    validationPassword(pwd,pwd2);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_PASSWORD, e.getMessage());
                    setErreur(CHAMP_PASSWORD2, e.getMessage());
            }
        user.setPass(pwd);
        try {
                    validationdate(date_nais);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_DATE, e.getMessage());
            }
        candidat.setDateNaiss(getDate(date_nais));
        candidat.setDomaine(domaine);
        candidat.setCode(user);
        try {
                  if (erreurs.isEmpty()) {
                            candidatDAO.ajoutCandidat(candidat);
                            resultat = "succes";
                    } else {
                            resultat = "echec";
                    }
		} catch (Exception e) {
			setErreur("imprévu", "Erreur imprévue lors de la création.");
			resultat = "Echec de la création du candidat : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
		}
        return candidat;  
    }
    public void modifCandidat(HttpServletRequest request,Users user,Long codeCan)throws FormValidationException{
        String nom = getValeurChamp(request, CHAMP_NOM);
        String prenom = getValeurChamp(request, CHAMP_PRENOM);
        String adresse = getValeurChamp(request, CHAMP_ADRESSE);
        String ville = getValeurChamp(request, CHAMP_VILLE);
        String tel = getValeurChamp(request, CHAMP_TEL);
        String email = getValeurChamp(request, CHAMP_EMAIL);
        String date_nais = getValeurChamp(request, CHAMP_DATE);
        String domaine = getValeurChamp(request, CHAMP_DOMAINE);
        Candidat candidat = new Candidat();
        candidat.setCodeCan(codeCan);
        try {
                    validationNom(nom);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_NOM, e.getMessage());
            }
        candidat.setNomCan(nom.toUpperCase());
        try {
                    validationPrenom(prenom);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_NOM, e.getMessage());
            }
        candidat.setPrenomCan(prenom);
        candidat.setAdresse(adresse);
        candidat.setVilleCan(ville);
        try {
                    validationTelephone(tel);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_TEL, e.getMessage());
            }
        candidat.setTel1Can(tel);
        try {
                    validationEmail(email);
            } catch (FormValidationException e) {
                    setErreur(CHAMP_EMAIL, e.getMessage());
            }
        candidat.setEmailCan(email);
        candidat.setDateNaiss(getDate(date_nais));
        candidat.setDomaine(domaine);
        candidat.setCode(user);
        try {
                  if (erreurs.isEmpty()) {
                            candidatDAO.modifCandidat(candidat);
                            resultat = "succes";
                    } else {
                            resultat = "echec";
                    }
		} catch (Exception e) {
			setErreur("imprévu", "Erreur imprévue lors de la création.");
			resultat = "Echec de la modification du candidat : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
		}  
    }
    private void validationNom( String nom ) throws FormValidationException {
        if ( nom != null ) {
            if ( nom.length() < 3 ) {
                throw new FormValidationException( "Votre nom doit contenir au moins 3 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer votre nom " );
        }
    }
    
    private void validationPrenom( String prenom ) throws FormValidationException {
        if ( prenom != null ) {
            if ( prenom.length() < 3 ) {
                throw new FormValidationException( "Votre prénom doit contenir au moins 3 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer votre prénom " );
        }
    }
    private void validationLogin(String login) throws FormValidationException {
		if (login != null) {
			if (login.length() < 8) {
				throw new FormValidationException("Le nom d'utilisateur doit contenir au moins 8 caractÃ¨res.");
			}
		} else {
			throw new FormValidationException("Merci d'entrer un nom d'utilisateur.");
		}
	}
    private void validationdate(String date) throws FormValidationException {
		if (date != null ) {
			
		} else {
			throw new FormValidationException("Merci de renseigner votre date de naissance");
		}
	}
    private void validationPassword(String password,String password2) throws FormValidationException {
            if(password != null && password2 != null){
                if ((4 < password.length() && password.length() < 10) && (4 < password2.length() && password2.length() < 10)) {
                    if(!password.equals(password2)){
                        throw new FormValidationException("Les mots de passes doivent être les mêmes!!!");  
                    }	
		}else{
                    throw new FormValidationException("Le mot de passe doit être compris entre 4 et 8 caractères.");
                }
            }else {
                throw new FormValidationException("Merci de saisir le mot de passe.");
            }	
	}
        
    private void validationTelephone(String telephone)throws FormValidationException {
		if (telephone != null) {
			if (!telephone.matches("^\\d+$")) {
				throw new FormValidationException("Le numéro de téléphone doit uniquement contenir des chiffres.");
			} else if (telephone.length() < 9) {
				throw new FormValidationException("Le numéro de téléphone doit contenir au moins 8 chiffres.");
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
    public Date getDate(String dateStr){
            Date date = Date.valueOf(dateStr);
            return date;  
        }
    /*
    * Ajoute un message correspondant au champ spÃƒÂ©cifiÃƒÂ© ÃƒÂ  la map des erreurs.
    */
   private void setErreur(String champ, String message) {
           erreurs.put(champ, message);
   }
    /*
    * MÃƒÂ©thode utilitaire qui retourne null si un champ est vide, et son contenu
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
