/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;

import dao.FormationDAO;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.http.HttpServletRequest;
import model.Cv;
import model.Formation;

/**
 *
 * @author XAVIER
 */
public final class FormationForm {
    @EJB
    private FormationDAO formDAO;
    private static final String CHAMP_IDFORMATION = "codeForm";
    private static final String CHAMP_ETABLISSEMENT = "etablissement";
    private static final String CHAMP_ANNEEACADEMIQUE = "anneeAca";
    private static final String CHAMP_DIPLOME = "diplome";
    private static final String CHAMP_OPTIONS = "options";

    public FormationForm(FormationDAO formDAO) {
        this.formDAO = formDAO;
    }
    
    public Formation creerFormation(HttpServletRequest request, Cv cv)throws Exception{
        String etablissement = getValeurChamp(request, CHAMP_ETABLISSEMENT);
        String anneeAca = getValeurChamp(request, CHAMP_ANNEEACADEMIQUE);
        String diplome = getValeurChamp(request, CHAMP_DIPLOME);
        String options = getValeurChamp(request, CHAMP_OPTIONS);
        Formation formation = new Formation();
        formation.setEtablissement(etablissement);
        formation.setAnneeAca(anneeAca);
        formation.setDiplome(diplome);
        formation.setOption(options);
        formation.setCodeCv(cv);
        try{
           formDAO.creerFormation(formation);
        }catch(EJBException e){
           System.out.println("Erreur lors de la création d'une formation");
        }
        return formation;   
    }
    public void modifFormation(HttpServletRequest request, Cv cv)throws Exception{
        Long idformation = Long.parseLong(getValeurChamp(request, CHAMP_IDFORMATION));
        String etablissement = getValeurChamp(request, CHAMP_ETABLISSEMENT);
        String anneeAca = getValeurChamp(request, CHAMP_ANNEEACADEMIQUE);
        String diplome = getValeurChamp(request, CHAMP_DIPLOME);
        Formation formation = new Formation();
        formation.setCodeForm(idformation);
        formation.setEtablissement(etablissement);
        formation.setAnneeAca(anneeAca);
        formation.setDiplome(diplome);
        formation.setCodeCv(cv);
        try{
           formDAO.modifFormation(formation);
        }catch(EJBException e){
           System.out.println("Erreur lors de la modification d'une formation");
        } 
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
