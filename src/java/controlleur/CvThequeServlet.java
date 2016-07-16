/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlleur;

import dao.CandidatDAO;
import dao.CompetenceDAO;
import dao.CvDAO;
import dao.EntrepriseDAO;
import dao.ExperienceDAO;
import dao.FormationDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Candidat;
import model.Cv;
import model.Entreprise;

/**
 *
 * @author Dry Bass
 */
public class CvThequeServlet extends HttpServlet {
    @EJB
    private CandidatDAO candidatDAO;
    @EJB
    private EntrepriseDAO entrepriseDAO;
    @EJB
    private CvDAO cvDAO;
    @EJB
    private FormationDAO formDAO;
    @EJB
    private ExperienceDAO expDAO;
    @EJB
    private CompetenceDAO compDAO; 
    public static final String SESSION_ENTREPRISE = "sessionUtilisateur";
    public static final String VUE = "/cvtheque.jsp";
    public static final String TYPE = "type";
    public static final String MESSAGE_FORMATION = "formation";
    public static final String MESSAGE_EXPERIENCE = "experience";
    public static final String MESSAGE_COMPETENCE = "competence";
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long codeEnt = Long.parseLong(request.getParameter("id"));
        Entreprise entreprise = entrepriseDAO.getEntreprise(codeEnt);
        List<Candidat> listCandidat = candidatDAO.getAllCandidat();
        HttpSession session = request.getSession();
        session.setAttribute(SESSION_ENTREPRISE, entreprise);
        List<Cv> listCv = new ArrayList<Cv>();
        for(int i = 0; i < listCandidat.size();i++){
            if(cvDAO.verifCV(listCandidat.get(i)) == true){
                listCv.add(cvDAO.getCvCandidat(listCandidat.get(i).getCodeCan()));
                listCv.get(i).setFormationList(formDAO.getFormationCandidat(listCandidat.get(i)));
                listCv.get(i).setExperienceProList(expDAO.getExperienceCandidat(listCandidat.get(i)));
                listCv.get(i).setCompetenceList(compDAO.getCompetenceCandidat(listCandidat.get(i)));  
            }
        }
        request.setAttribute(TYPE, "Entreprise");
        request.setAttribute("listCv", listCv);
        request.setAttribute("listCandidat", listCandidat);
        this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
