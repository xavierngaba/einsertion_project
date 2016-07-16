/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;

import dao.CompetenceDAO;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.http.HttpServletRequest;
import model.Competence;
import model.Cv;

/**
 *
 * @author XAVIER
 */
public final class CompetenceForm {
    @EJB
    private CompetenceDAO compDAO;
    private static final String CHAMP_IDCOMPETENCE= "codeComp";
    private static final String CHAMP_DOMAINE = "domaine";
    private static final String CHAMP_SPECIALITE = "specialite";
    private static final String CHAMP_LIBELLE = "description";

    public CompetenceForm(CompetenceDAO compDAO) {
        this.compDAO = compDAO;
    }
    public Competence creerCompetence(HttpServletRequest request,Cv cv)throws Exception{
        String domaine = getValeurChamp(request, CHAMP_DOMAINE);
        String specialite = getValeurChamp(request, CHAMP_SPECIALITE);
        String description = getValeurChamp(request, CHAMP_LIBELLE);
        Competence competence = new Competence();
        competence.setDomaine(domaine);
        competence.setSpecialite(specialite);
        competence.setLibelleComp(description);
        competence.setCodeCv(cv);
        try{
            compDAO.creerCompetence(competence);
        }catch(EJBException e){
            System.out.println("Erreur lors de la création d'une compétence");
        }
        return competence;  
    }
    public void modifCompetence(HttpServletRequest request,Cv cv)throws Exception{
        Long idcomptence = Long.parseLong(getValeurChamp(request, CHAMP_IDCOMPETENCE));
        String domaine = getValeurChamp(request, CHAMP_DOMAINE);
        String specialite = getValeurChamp(request, CHAMP_SPECIALITE);
        String description = getValeurChamp(request, CHAMP_LIBELLE);
        Competence competence = new Competence();
        competence.setCodeComp(idcomptence);
        competence.setDomaine(domaine);
        competence.setSpecialite(specialite);
        competence.setLibelleComp(description);
        competence.setCodeCv(cv);
        try{
            compDAO.ModifCompetence(competence);
        }catch(EJBException e){
            System.out.println("Erreur lors de la modification d'une compétence");
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
