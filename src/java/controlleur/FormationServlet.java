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
import metier.FormationForm;
import model.Candidat;
import model.Cv;
import model.Formation;

/**
 *
 * @author xavier_ng
 */
public class FormationServlet extends HttpServlet {
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
    public static final String VUE_PROFIL_FORM = "/modifformation.jsp";
    public static final String VUE_PROFIL = "/profilcandidat.jsp";
    public static final String MESSAGE_FORMATION = "formation";
    public static final String TYPE ="type";
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
        Long codeForm = Long.parseLong(request.getParameter("codeform"));
        Long codeCan = Long.parseLong(request.getParameter("id"));
        Candidat candidat = candidatDAO.getCandidatById(codeCan);
        Cv cv = new Cv();
        cv = cvDAO.getCvCandidat(candidat.getCodeCan());
        HttpSession session = request.getSession();
        session.setAttribute(SESSION_CANDIDAT,candidat);
        
        if(action.equals("modifform")){
                Formation formation = formDAO.getFormation(codeForm);
                request.setAttribute("formation", formation);
                this.getServletContext().getRequestDispatcher(VUE_PROFIL_FORM).forward(request, response);
         }else if(action.equals("suprform")){
                formDAO.suprFormation(codeForm);
                cv.setFormationList(formDAO.getFormationCandidat(candidat));
                cv.setExperienceProList(expDAO.getExperienceCandidat(candidat));
                cv.setCompetenceList(compDAO.getCompetenceCandidat(candidat));
                request.setAttribute("cv", cv);
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
        Candidat candidat = candidatDAO.getCandidatById(codeCan);
        Cv cv = new Cv();
        cv = cvDAO.getCvCandidat(candidat.getCodeCan());
        HttpSession session = request.getSession();
        session.setAttribute(SESSION_CANDIDAT,candidat);
        
        if(action.equals("modifform")){
            try {
                FormationForm form = new FormationForm(formDAO);
                form.modifFormation(request, cv);
                cv.setFormationList(formDAO.getFormationCandidat(candidat));
                cv.setExperienceProList(expDAO.getExperienceCandidat(candidat));
                cv.setCompetenceList(compDAO.getCompetenceCandidat(candidat));
                request.setAttribute("cv", cv);
                this.getServletContext().getRequestDispatcher(VUE_PROFIL).forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(FormationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
         }
    }
}
