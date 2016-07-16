/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import dao.CandidatDAO;
import dao.CompetenceDAO;
import dao.CvDAO;
import dao.ExperienceDAO;
import dao.FormationDAO;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import metier.CalculAge;
import model.Candidat;
import model.Cv;

/**
 *
 * @author xavier_ng
 */
public class PdfServlet extends HttpServlet {
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
    public static final String VUE_CV = "/cv.jsp";
    public static final String TYPE ="type";
    public static final String AGE ="age";
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
        Long codeCan = Long.parseLong(request.getParameter("id"));
        Candidat candidat = candidatDAO.getCandidatById(codeCan);
        
        CalculAge calculAge = new CalculAge();
        request.setAttribute(AGE, calculAge.getAge(candidat.getDateNaiss().toString()));
        
        Cv cv = new Cv();
        cv = cvDAO.getCvCandidat(candidat.getCodeCan());
        HttpSession session = request.getSession();
        session.setAttribute(SESSION_CANDIDAT,candidat);
        cv.setObjectif(candidat.getDomaine());
        cv.setFormationList(formDAO.getFormationCandidat(candidat));
        cv.setExperienceProList(expDAO.getExperienceCandidat(candidat));
        cv.setCompetenceList(compDAO.getCompetenceCandidat(candidat));
        Pdf pdf = new Pdf();
        pdf.genererPDF(candidat, cv, response);
        request.setAttribute("cv", cv);
        request.setAttribute(TYPE, "Candidat");
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
        
    }
}
