/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package offres;

import dao.OffreFormationDAO;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;
import model.Institut;
import model.OffreFormation;

/**
 *
 * @author Dry Bass
 */
public class CreationOffreFormation {
    @EJB
    private OffreFormationDAO offreFormDAO;
    
    private static final String CHAMP_DOMAINE = "domaine";
    private static final String CHAMP_ADRESSE_FORM = "adresse_form";
    private static final String CHAMP_DESCRIPTION = "descr_ent";
    private static final String CHAMP_VILLE_FORM = "ville_form";
    private String resultat;
    public String getResultat() {
		return resultat;
	}
    private final Map<String, String> erreurs = new HashMap<String, String>();
    public Map<String, String> getErreurs() {
		return erreurs;
	}

    public CreationOffreFormation(OffreFormationDAO offreFormDAO) {
        this.offreFormDAO = offreFormDAO;
    }
    public void creerOffreFormation(HttpServletRequest request,Institut institut,String date){
        String domaine = getValeurChamp(request, CHAMP_DOMAINE);
        String adresse_form = getValeurChamp(request, CHAMP_ADRESSE_FORM);
        String ville_form = getValeurChamp(request, CHAMP_VILLE_FORM);
        String descr_ent = getValeurChamp(request, CHAMP_DESCRIPTION);
        
        OffreFormation offreFormation = new OffreFormation();
        offreFormation.setDomaine(domaine);
        offreFormation.setAdressForm(adresse_form);
        offreFormation.setVilleForm(ville_form);
        offreFormation.setDateOffreForm(date);
        offreFormation.setDescripForm(descr_ent);
        offreFormation.setCodeIns(institut);
        try {
                  offreFormDAO.ajoutOffreFormation(offreFormation);
            } catch (Exception e) {
                    setErreur("Erreur", e.getMessage());
            }
    }
    public void modifOffreFormation(HttpServletRequest request,Institut institut,String date,Long codeOffreForm){
        String domaine = getValeurChamp(request, CHAMP_DOMAINE);
        String adresse_form = getValeurChamp(request, CHAMP_ADRESSE_FORM);
        String ville_form = getValeurChamp(request, CHAMP_VILLE_FORM);
        String descr_ent = getValeurChamp(request, CHAMP_DESCRIPTION);
        
        OffreFormation offreFormation = new OffreFormation();
        offreFormation.setCodeOffreForm(codeOffreForm);
        offreFormation.setDomaine(domaine);
        offreFormation.setAdressForm(adresse_form);
        offreFormation.setVilleForm(ville_form);
        offreFormation.setDateOffreForm(date);
        offreFormation.setDescripForm(descr_ent);
        offreFormation.setCodeIns(institut);
        try {
                  offreFormDAO.modifOffreFormation(offreFormation);
            } catch (Exception e) {
                    setErreur("Erreur", e.getMessage());
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
