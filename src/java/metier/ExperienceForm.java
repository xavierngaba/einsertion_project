/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;

import dao.ExperienceDAO;
import java.sql.Date;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.http.HttpServletRequest;
import model.Cv;
import model.ExperiencePro;

/**
 *
 * @author XAVIER
 */
public final class ExperienceForm {
    @EJB
    private ExperienceDAO expDAO;
    private static final String CHAMP_IDEXPERIENCE= "codeExp";
    private static final String CHAMP_NOM_STRUCTURE = "nomStructure";
    private static final String CHAMP_ACTIVITE_STRUCTURE = "activiteStructure";
    private static final String CHAMP_POSTE = "poste";
    private static final String CHAMP_DATE_DEBUT = "date_debut";
    private static final String CHAMP_DATE_FIN = "date_fin";
    private static final String CHAMP_TACHES = "tachesEffectuees";

    public ExperienceForm(ExperienceDAO expDAO) {
        this.expDAO = expDAO;
    } 
    public void creerExperience(HttpServletRequest request, Cv cv)throws Exception{
        String nomStructure = getValeurChamp(request, CHAMP_NOM_STRUCTURE);
        String activiteStructure = getValeurChamp(request, CHAMP_ACTIVITE_STRUCTURE);
        String poste = getValeurChamp(request, CHAMP_POSTE);
        String date_debut = getValeurChamp(request, CHAMP_DATE_DEBUT);
        String date_fin = getValeurChamp(request, CHAMP_DATE_FIN);
        String tachesEffectuees = getValeurChamp(request, CHAMP_TACHES);
        ExperiencePro experience = new ExperiencePro();
        experience.setNomStructure(nomStructure);
        experience.setActiviteStructure(activiteStructure);
        experience.setPoste(poste);
        experience.setDateDebut(getDate(date_debut));
        experience.setDateFin(getDate(date_fin));
        experience.setTachesEffectuees(tachesEffectuees);
        experience.setCodeCv(cv);
        try{
            expDAO.creerExpPro(experience);
        }catch(EJBException e){
            System.err.println("Erreur lors de la création d'une expérience professionelle");
        }        
    }
    public void modifExperience(HttpServletRequest request, Cv cv)throws Exception{
        Long idexperience = Long.parseLong(getValeurChamp(request, CHAMP_IDEXPERIENCE));
        String nomStructure = getValeurChamp(request, CHAMP_NOM_STRUCTURE);
        String activiteStructure = getValeurChamp(request, CHAMP_ACTIVITE_STRUCTURE);
        String poste = getValeurChamp(request, CHAMP_POSTE);
        String date_debut = getValeurChamp(request, CHAMP_DATE_DEBUT);
        String date_fin = getValeurChamp(request, CHAMP_DATE_FIN);
        String tachesEffectuees = getValeurChamp(request, CHAMP_TACHES);
        ExperiencePro experience = new ExperiencePro();
        experience.setCodeExp(idexperience);
        experience.setNomStructure(nomStructure);
        experience.setActiviteStructure(activiteStructure);
        experience.setPoste(poste);
        experience.setDateDebut(getDate(date_debut));
        experience.setDateFin(getDate(date_fin));
        experience.setTachesEffectuees(tachesEffectuees);
        experience.setCodeCv(cv);
        try{
            expDAO.modifExpPro(experience);
        }catch(EJBException e){
            System.err.println("Erreur lors de la création d'une expérience professionelle");
        }        
    }
    public Date getDate(String dateStr){
            Date date = Date.valueOf(dateStr);
            return date;  
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
