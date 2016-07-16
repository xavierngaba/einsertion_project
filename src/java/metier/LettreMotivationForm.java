/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package metier;

import dao.LettreMotivationDAO;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.http.HttpServletRequest;
import model.Candidat;
import model.LettreMotivation;
import model.OffreEmploi;

/**
 *
 * @author Dry Bass
 */
public class LettreMotivationForm {
  @EJB
  private LettreMotivationDAO lettreMotivationDAO;
  private static final String CHAMP_LIBELLE = "libelle";
  
  public LettreMotivationForm (LettreMotivationDAO lettreMotivationDAO){
      this.lettreMotivationDAO = lettreMotivationDAO;
  }
  
  public void creerLettreMotivation(HttpServletRequest request, Candidat candidat, OffreEmploi offreEmploi) throws Exception{
      String lettre = getValeurChamp(request, CHAMP_LIBELLE);
      LettreMotivation lettreMotivation = new LettreMotivation();
      lettreMotivation.setLibelle(lettre);
      lettreMotivation.setCodeCan(candidat);
      lettreMotivation.setCode_offre_emp(offreEmploi);
      try{
          lettreMotivationDAO.ajoutLettreMotivation(lettreMotivation);
      }catch(EJBException e){
          System.err.println("Erreur lors de l'envoi de la lettre de motivation");
      }
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
