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
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import metier.CalculExp;
import metier.ExperienceForm;
import model.Candidat;
import model.Cv;
import model.ExperiencePro;

/**
 *
 * @author xavier_ng
 */
public class ExperienceServlet extends HttpServlet {
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
    public static final String SESSION_CANDIDAT = "sessionUtilisateur";
    public static final String VUE_PROFIL_FORM = "/modifexppro.jsp";
    public static final String TYPE ="type";
    public static final String VUE_PROFIL = "/profilcandidat.jsp";
    public static final String MESSAGE_EXPERIENCE = "experience";
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
        request.setAttribute(TYPE, "Candidat");
        String action = request.getParameter("action");
        Long codeExp = Long.parseLong(request.getParameter("codeExp"));
        Long codeCan = Long.parseLong(request.getParameter("id"));
        Candidat candidat = candidatDAO.getCandidatById(codeCan);
        Cv cv = new Cv();
        cv = cvDAO.getCvCandidat(candidat.getCodeCan());
        HttpSession session = request.getSession();
        session.setAttribute(SESSION_CANDIDAT,candidat);
        if(action.equals("modifexp")){
            ExperiencePro experience = expDAO.getExperience(codeExp);
            request.setAttribute("experience", experience);
            request.getRequestDispatcher(VUE_PROFIL_FORM).forward(request, response);
        }else if(action.equals("suprexp")){
            expDAO.suprExpPro(codeExp);
            cv.setFormationList(formDAO.getFormationCandidat(candidat));
            cv.setExperienceProList(expDAO.getExperienceCandidat(candidat));
            cv.setCompetenceList(compDAO.getCompetenceCandidat(candidat));
            request.setAttribute("cv", cv);
            request.getRequestDispatcher(VUE_PROFIL).forward(request, response);
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
        Candidat candidat = candidatDAO.getCandidatById(codeCan);
        Cv cv = new Cv();
        CalculExp calculExp = new CalculExp();
        cv = cvDAO.getCvCandidat(candidat.getCodeCan());
        HttpSession session = request.getSession();
        session.setAttribute(SESSION_CANDIDAT,candidat);
        if(action.equals("modifexp")){
            try {
                ExperienceForm form = new ExperienceForm(expDAO);
                form.modifExperience(request, cv);
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
                request.getRequestDispatcher(VUE_PROFIL).forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(ExperienceServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
