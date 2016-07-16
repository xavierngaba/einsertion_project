/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package offres;

import dao.OffreEmploiDAO;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;
import model.Entreprise;
import model.OffreEmploi;

/**
 *
 * @author xavier_ng
 */
public class CreationOffreEmploi {
    @EJB
    private OffreEmploiDAO offreEmplDAO;
    private static final String CHAMP_DOMAINE = "domaine";
    private static final String CHAMP_POSTE = "poste";
    private static final String CHAMP_ADRESSE_EMP = "adresse_poste";
    private static final String CHAMP_DESCRIPTION_EMP = "descrip_poste";
    private static final String CHAMP_QUALITE_EMP = "qualite_req";
    private static final String CHAMP_VILLE_EMP = "ville_poste";
    private String resultat;
    public String getResultat() {
		return resultat;
	}
    private final Map<String, String> erreurs = new HashMap<String, String>();
    public Map<String, String> getErreurs() {
		return erreurs;
	}
    public CreationOffreEmploi(OffreEmploiDAO offreEmplDAO) {
        this.offreEmplDAO = offreEmplDAO;
    }
    public void creerOffreEmploi(HttpServletRequest request,Entreprise entreprise,String date){
        String domaine = getValeurChamp(request, CHAMP_DOMAINE);
        String poste = getValeurChamp(request, CHAMP_POSTE);
        String adresse_poste = getValeurChamp(request, CHAMP_ADRESSE_EMP);
        String descrip_poste = getValeurChamp(request, CHAMP_DESCRIPTION_EMP);
        String qualite_req = getValeurChamp(request, CHAMP_QUALITE_EMP);
        String ville_poste = getValeurChamp(request, CHAMP_VILLE_EMP);
        
        OffreEmploi offreEmploi = new OffreEmploi();
        offreEmploi.setDomaine(domaine);
        offreEmploi.setPoste(poste);
        offreEmploi.setDescripPoste(descrip_poste);
        offreEmploi.setQualiteReq(qualite_req);
        offreEmploi.setAdressePost(adresse_poste);
        offreEmploi.setVillePoste(ville_poste);
        offreEmploi.setDateOffreEmp(date);
        offreEmploi.setCodeEnt(entreprise);
        
        try {
            offreEmplDAO.ajoutOffreEmploie(offreEmploi);
        } catch (Exception e) {
                    setErreur("Erreur", e.getMessage());
            }
    }
    public void modifOffreEmploi(HttpServletRequest request,Entreprise entreprise,String date,Long codeOffreEmploi){
        String domaine = getValeurChamp(request, CHAMP_DOMAINE);
        String poste = getValeurChamp(request, CHAMP_POSTE);
        String adresse_poste = getValeurChamp(request, CHAMP_ADRESSE_EMP);
        String descrip_poste = getValeurChamp(request, CHAMP_DESCRIPTION_EMP);
        String qualite_req = getValeurChamp(request, CHAMP_QUALITE_EMP);
        String ville_poste = getValeurChamp(request, CHAMP_VILLE_EMP);
        
        OffreEmploi offreEmploi = new OffreEmploi();
        offreEmploi.setCodeOffreEmp(codeOffreEmploi);
        offreEmploi.setDomaine(domaine);
        offreEmploi.setPoste(poste);
        offreEmploi.setDescripPoste(descrip_poste);
        offreEmploi.setQualiteReq(qualite_req);
        offreEmploi.setAdressePost(adresse_poste);
        offreEmploi.setVillePoste(ville_poste);
        offreEmploi.setDateOffreEmp(date);
        offreEmploi.setCodeEnt(entreprise);
        
        try {
            offreEmplDAO.modifOffreEmploie(offreEmploi);
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
