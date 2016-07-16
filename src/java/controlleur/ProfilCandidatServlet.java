/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur;

import dao.CandidatDAO;
import dao.CompetenceDAO;
import dao.CvDAO;
import dao.ExperienceDAO;
import dao.FormationDAO;
import dao.UserDAO;
import exception.FormValidationException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import metier.CalculAge;
import metier.CalculExp;
import metier.CandidatForm;
import metier.CompetenceForm;
import metier.ExperienceForm;
import metier.FormationForm;
import model.Candidat;
import model.Competence;
import model.Cv;
import model.Formation;


/**
 *
 * @author XAVIER
 */
public class ProfilCandidatServlet extends HttpServlet {
    @EJB
    private CandidatDAO candidatDAO;
    @EJB
    private CvDAO cvDAO;
    @EJB
    private FormationDAO formDAO;
    @EJB
    private ExperienceDAO expDAO;
    @EJB
    private CompetenceDAO compDAO;
    @EJB
    private UserDAO userDAO;
    public static final String SESSION_CANDIDAT = "sessionUtilisateur";
    public static final String VUE_PROFIL = "/profilcandidat.jsp";
    public static final String TYPE ="type";
    public static final String AGE ="age";
    public static final String FORMAT_DATE = "yyyy/MM/dd";
    public static final String MESSAGE_FORMATION = "formation";
    public static final String MESSAGE_EXPERIENCE = "experience";
    public static final String MESSAGE_COMPETENCE = "competence";
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String action = request.getParameter("action");
        Long codeCan = Long.parseLong(request.getParameter("id"));
        Candidat candidat = candidatDAO.getCandidatById(codeCan);
        
        CalculAge calculAge = new CalculAge();
        CalculExp calculExp = new CalculExp();
        request.setAttribute(AGE, calculAge.getAge(candidat.getDateNaiss().toString()));
        
        HttpSession session = request.getSession();
        session.setAttribute(SESSION_CANDIDAT,candidat);
        Cv cv = new Cv();
        if(action.equals("affiche")){
          if(cvDAO.verifCV(candidat) == true){
            cv = cvDAO.getCvCandidat(candidat.getCodeCan());
            cv.setObjectif(candidat.getDomaine());
            cv.setFormationList(formDAO.getFormationCandidat(candidat));
            if(cv.getFormationList().isEmpty()){
                request.setAttribute(MESSAGE_FORMATION, "vide");
            }
            cv.setExperienceProList(expDAO.getExperienceCandidat(candidat));
            if(cv.getExperienceProList().isEmpty()){
                request.setAttribute(MESSAGE_EXPERIENCE, "vide");
            }else{
                int[] duree = new int[cv.getExperienceProList().size()];
                for(int i = 0;i < cv.getExperienceProList().size();i++){
                    duree[i] = calculExp.getMois(cv.getExperienceProList().get(i).getDateDebut().toString(),cv.getExperienceProList().get(i).getDateFin().toString());
                }
                request.setAttribute("duree", duree);
            }
            cv.setCompetenceList(compDAO.getCompetenceCandidat(candidat));
            if(cv.getCompetenceList().isEmpty()){
                request.setAttribute(MESSAGE_COMPETENCE, "vide");
            }
            request.setAttribute(TYPE, "Candidat");
            request.setAttribute("cv", cv);  
          }else{
              cv.setCodeCan(candidat);
              cv.setObjectif(candidat.getDomaine());
              cvDAO.creerCV(cv);
              request.setAttribute(MESSAGE_FORMATION, "vide");
              request.setAttribute(MESSAGE_EXPERIENCE, "vide");
              request.setAttribute(MESSAGE_COMPETENCE, "vide");
              request.setAttribute(TYPE, "Candidat");
          }
          this.getServletContext().getRequestDispatcher(VUE_PROFIL).forward(request, response);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
      request.setAttribute(TYPE, "Candidat");
      String action = request.getParameter("action");
      Long codeCan = Long.parseLong(request.getParameter("codeCan"));
      Candidat candidat = new Candidat();
      CalculExp calculExp = new CalculExp();
      Cv cv = new Cv();
      if(action.equals("ajoutform")){
          try {
              candidat = candidatDAO.getCandidatById(codeCan);
              cv = cvDAO.getCvCandidat(candidat.getCodeCan());
              FormationForm form = new FormationForm(formDAO);
              Formation formation = form.creerFormation(request, cv);
              request.setAttribute("formation", formation);
          } catch (Exception ex) {
              Logger.getLogger(ProfilCandidatServlet.class.getName()).log(Level.SEVERE, null, ex);
          }
           cv.setFormationList(formDAO.getFormationCandidat(candidat));
           cv.setExperienceProList(expDAO.getExperienceCandidat(candidat));
           cv.setCompetenceList(compDAO.getCompetenceCandidat(candidat));
           request.setAttribute("cv", cv);
           HttpSession session = request.getSession();
           session.setAttribute(SESSION_CANDIDAT,candidat);
           request.getRequestDispatcher(VUE_PROFIL).forward(request, response);
      }else if(action.equals("ajoutexp")){
          try {
                candidat = candidatDAO.getCandidatById(codeCan);
                cv = cvDAO.getCvCandidat(candidat.getCodeCan());
                ExperienceForm form = new ExperienceForm(expDAO);
                form.creerExperience(request, cv);
            } catch (Exception ex) {
                Logger.getLogger(ProfilCandidatServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
             cv.setFormationList(formDAO.getFormationCandidat(candidat));
             cv.setExperienceProList(expDAO.getExperienceCandidat(candidat));
             cv.setCompetenceList(compDAO.getCompetenceCandidat(candidat));
             request.setAttribute("cv", cv);
             HttpSession session = request.getSession();
             session.setAttribute(SESSION_CANDIDAT,candidat);
             request.getRequestDispatcher(VUE_PROFIL).forward(request, response);
        }else if(action.equals("ajoutcomp")){
            try {
                candidat = candidatDAO.getCandidatById(codeCan);
                cv = cvDAO.getCvCandidat(candidat.getCodeCan());
                CompetenceForm form = new CompetenceForm(compDAO);
                Competence competence = form.creerCompetence(request, cv);
                request.setAttribute("competence", competence);
            } catch (Exception ex) {
                Logger.getLogger(ProfilCandidatServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
             cv.setFormationList(formDAO.getFormationCandidat(candidat));
             cv.setExperienceProList(expDAO.getExperienceCandidat(candidat));
             cv.setCompetenceList(compDAO.getCompetenceCandidat(candidat));
             request.setAttribute("cv", cv);
             HttpSession session = request.getSession();
             session.setAttribute(SESSION_CANDIDAT,candidat);
             request.getRequestDispatcher(VUE_PROFIL).forward(request, response);
        }else if(action.equals("modifprofil")){
          try {
              candidat = candidatDAO.getCandidatById(codeCan);
              CandidatForm form = new CandidatForm(candidatDAO);
              form.modifCandidat(request, candidat.getCode(), codeCan);
              userDAO.modifUser(candidat.getCode());
          } catch (FormValidationException ex) {
              Logger.getLogger(ProfilCandidatServlet.class.getName()).log(Level.SEVERE, null, ex);
          }
             cv.setFormationList(formDAO.getFormationCandidat(candidat));
             cv.setExperienceProList(expDAO.getExperienceCandidat(candidat));
                if(cv.getExperienceProList().isEmpty()){
                    request.setAttribute(MESSAGE_EXPERIENCE, "vide");
                }else{
                    int[] duree = new int[cv.getExperienceProList().size()];
                    for(int i = 0;i < cv.getExperienceProList().size();i++){
                        duree[i] = calculExp.getMois(cv.getExperienceProList().get(i).getDateDebut().toString(),cv.getExperienceProList().get(i).getDateFin().toString());
                    }
                    request.setAttribute("duree", duree);
                }
             cv.setCompetenceList(compDAO.getCompetenceCandidat(candidat));
             request.setAttribute("cv", cv);
             HttpSession session = request.getSession();
             session.setAttribute(SESSION_CANDIDAT,candidat);
             request.getRequestDispatcher(VUE_PROFIL).forward(request, response);
        }
    }
}
