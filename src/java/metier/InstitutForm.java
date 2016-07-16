/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package metier;

import dao.InstitutDAO;
import exception.FormValidationException;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;
import model.Institut;
import model.Users;
/**
 *
 * @author Dry Bass
 */
public final class InstitutForm {
    @EJB
    private InstitutDAO institutDAO;
    private static final String CHAMP_NOM_INST = "nom_ins";
    private static final String CHAMP_EMAIL_INST = "email_ins";
    private static final String CHAMP_TEL_INST = "tel_ins";
    private static final String CHAMP_SITE_INST = "site_ins";
    private static final String CHAMP_NOM_RESP_INST = "nom_resp_ins";
    private static final String CHAMP_PRENOM_RESP_INST = "prenom_resp_ins";
    private static final String CHAMP_LOGIN = "login";
    private static final String CHAMP_PASSWORD = "pass1";
    private static final String CHAMP_PASSWORD2 = "pass2";
    private static final String CHAMP_DESCR_INST = "descr_ins";
    private String resultat;
    public String getResultat() {
        return resultat;
   }
    
    /*private String getResultat(){
        return resultat;
    }*/
    
    private final Map<String, String> erreurs = new HashMap<String, String>();
    public Map<String, String> getErreurs(){
        return erreurs;
    }
    
    public InstitutForm (InstitutDAO institutDAO) {
        this.institutDAO = institutDAO;
    }
    
    public Institut creerInstitut (HttpServletRequest request)throws FormValidationException{
        String nom_inst = getValeurChamp(request, CHAMP_NOM_INST);
        String email_inst = getValeurChamp(request, CHAMP_EMAIL_INST);
        String tel_inst = getValeurChamp(request, CHAMP_TEL_INST);
        String site_inst = getValeurChamp(request, CHAMP_SITE_INST);
        String nom_resp_ins = getValeurChamp(request, CHAMP_NOM_RESP_INST);
        String prenom_resp_ins = getValeurChamp(request, CHAMP_PRENOM_RESP_INST);
        String login = getValeurChamp(request, CHAMP_LOGIN);
        String pwd = getValeurChamp(request, CHAMP_PASSWORD);
        String pwd2 = getValeurChamp(request, CHAMP_PASSWORD2);
        String descr_inst = getValeurChamp(request, CHAMP_DESCR_INST);
        Institut institut = new Institut();
        Users user = new Users();
        try {
            validationNom(nom_inst);
        }catch (FormValidationException e) {
            setErreur(CHAMP_NOM_INST, e.getMessage());
        }
        institut.setNomIns(nom_inst);
        
        try {
            validationEmail(email_inst);
        }catch (FormValidationException e) {
            setErreur(CHAMP_EMAIL_INST, e.getMessage());
        }
        institut.setEmailIns(email_inst);
        
        try {
            validationTelephone(tel_inst);
        }catch (FormValidationException e) {
            setErreur(CHAMP_TEL_INST, e.getMessage());
        }
        institut.setTelIns(tel_inst);
        institut.setSiteIns(site_inst);
        
        try {
            validationNom(nom_resp_ins);
        }catch (FormValidationException e) {
            setErreur(CHAMP_NOM_RESP_INST, e.getMessage());
        }
        institut.setNomRespIns(nom_resp_ins);
        
        try {
            validationPrenom(prenom_resp_ins);
        }catch (FormValidationException e) {
            setErreur(CHAMP_PRENOM_RESP_INST, e.getMessage());
        }
        institut.setPrenomRespIns(prenom_resp_ins);
        institut.setDescripIns(descr_inst);
        try {
            validationLogin(login);
        }catch (FormValidationException e) {
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
        
        institut.setCode(user);
        
        try {
            if (erreurs.isEmpty()) {
                institutDAO.ajoutInstitut(institut);
                resultat = "succes";
            } else {
                resultat = "echec";
            }
        } catch (Exception e) {
            setErreur("imprévu", "Erreur imprévue lors de la création.");
        }
        return institut; 
    }
    
    public void modifInstitut (HttpServletRequest request,Users user,Long codeIns)throws FormValidationException{
        String nom_inst = getValeurChamp(request, CHAMP_NOM_INST);
        String email_inst = getValeurChamp(request, CHAMP_EMAIL_INST);
        String tel_inst = getValeurChamp(request, CHAMP_TEL_INST);
        String site_inst = getValeurChamp(request, CHAMP_SITE_INST);
        String nom_resp_ins = getValeurChamp(request, CHAMP_NOM_RESP_INST);
        String prenom_resp_ins = getValeurChamp(request, CHAMP_PRENOM_RESP_INST);
        String login = getValeurChamp(request, CHAMP_LOGIN);
        String pwd = getValeurChamp(request, CHAMP_PASSWORD);
        String pwd2 = getValeurChamp(request, CHAMP_PASSWORD2);
        String descr_inst = getValeurChamp(request, CHAMP_DESCR_INST);
        Institut institut = new Institut();
        institut.setCodeIns(codeIns);
        try {
            validationNom(nom_inst);
        }catch (FormValidationException e) {
            setErreur(CHAMP_NOM_INST, e.getMessage());
        }
        institut.setNomIns(nom_inst);
        
        try {
            validationEmail(email_inst);
        }catch (FormValidationException e) {
            setErreur(CHAMP_EMAIL_INST, e.getMessage());
        }
        institut.setEmailIns(email_inst);
        
        try {
            validationTelephone(tel_inst);
        }catch (FormValidationException e) {
            setErreur(CHAMP_TEL_INST, e.getMessage());
        }
        institut.setTelIns(tel_inst);
        institut.setSiteIns(site_inst);
        
        try {
            validationNom(nom_resp_ins);
        }catch (FormValidationException e) {
            setErreur(CHAMP_NOM_RESP_INST, e.getMessage());
        }
        institut.setNomRespIns(nom_resp_ins);
        
        try {
            validationPrenom(prenom_resp_ins);
        }catch (FormValidationException e) {
            setErreur(CHAMP_PRENOM_RESP_INST, e.getMessage());
        }
        institut.setPrenomRespIns(prenom_resp_ins);
        institut.setDescripIns(descr_inst);
        try {
            validationLogin(login);
        }catch (FormValidationException e) {
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
        
        institut.setCode(user);
        
        try {
            if (erreurs.isEmpty()) {
                institutDAO.modifInstitut(institut);
                resultat = "succes";
            } else {
                resultat = "echec";
            }
        } catch (Exception e) {
            setErreur("imprévu", "Erreur imprévue lors de la création.");
        } 
    }
    
    private void validationNom( String nom ) throws FormValidationException {
        if ( nom != null ) {
            if ( nom.length() < 3 ) {
                throw new FormValidationException( "le nom doit contenir au moins 3 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer un nom valide! " );
        }
    }
    
    private void validationPrenom( String prenom ) throws FormValidationException {
        if ( prenom != null ) {
            if ( prenom.length() < 3 ) {
                throw new FormValidationException( "le prénom doit contenir au moins 3 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer un prénom valide!" );
        }
    }
    
    private void validationLogin(String login) throws FormValidationException {
        if (login != null) {
                if (login.length() < 8) {
                        throw new FormValidationException("Le login d'utilisateur doit contenir au moins 8 caractères.");
                }
        } else {
                throw new FormValidationException("Merci d'entrer un login valide!");
        }
    }
    private void validationPassword(String password,String password2) throws FormValidationException {
        if(password != null && password2 != null){
            if ((4 < password.length() && password.length() < 20) && (4 < password2.length() && password2.length() < 20)) {
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
    
    private void setErreur(String champ, String message) {
           erreurs.put(champ, message);
    }
    
    private static String getValeurChamp(HttpServletRequest request,String nomChamp) {
           String valeur = request.getParameter(nomChamp);
           if (valeur == null || valeur.trim().length() == 0) {
                   return null;
           } else {
                   return valeur;
           }
   }
}
