/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlleur;

import dao.CandidatDAO;
import dao.InscriptionDAO;
import dao.InstitutDAO;
import dao.OffreFormationDAO;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Inscription;
import model.Institut;
import model.OffreFormation;
import offres.CreationOffreFormation;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 *
 * @author Dry Bass
 */
public class OffreFormationServlet extends HttpServlet {
    @EJB
    private InstitutDAO institutDAO;
    @EJB
    private CandidatDAO candidatDAO;
    @EJB
    private OffreFormationDAO ofDAO;
    @EJB
    private InscriptionDAO inscDAO;
    
    public static final String SESSION_INSTITUT = "sessionUtilisateur";
    public static final String VUE = "/offreformation.jsp";
    public static final String VUE_MODIF_OFFREFORM = "/modifoffreform.jsp";
    public static final String TYPE ="type";
    public static final String MESSAGE_FORMATION = "formation";
    private static final String FORMAT_DATE = "dd MMMM yyyy HH:mm:ss";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Long codeIns = Long.parseLong(request.getParameter("id"));
        Institut institut = institutDAO.getInstitut(codeIns);
        HttpSession session = request.getSession();
        session.setAttribute(SESSION_INSTITUT,institut);
        request.setAttribute(TYPE, "Institut");
        if(action.equals("affich")){
            List<OffreFormation> listForm = ofDAO.getOffreFormationByIns(codeIns);
            List<Inscription> inscription = null;
            int[] nbInscrits = new int[listForm.size()];
            if (listForm.isEmpty()){
                request.setAttribute(MESSAGE_FORMATION, "vide");
            }else {
                for(int i = 0; i < listForm.size(); i++){
                    inscription = inscDAO.getInscriptionByOffreFormation(listForm.get(i).getCodeOffreForm());
                    nbInscrits[i] = inscription.size();
                }
                request.setAttribute("listForm", listForm);
                request.setAttribute("nbInscrits", nbInscrits);
            }
            this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
        }else if(action.equals("modifoffreform")){
            Long codeOfrreForm = Long.parseLong(request.getParameter("codeOfrreForm"));
            OffreFormation offreFormation = ofDAO.getOffreFormation(codeOfrreForm);
            request.setAttribute("offreFormation", offreFormation);
            request.getRequestDispatcher(VUE_MODIF_OFFREFORM).forward(request, response);
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        request.setAttribute(TYPE, "Institut");
        Long codeIns = Long.parseLong(request.getParameter("codeIns"));
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Institut institut = institutDAO.getInstitut(codeIns);
        DateTime dt = new DateTime();
        DateTimeFormatter formatter = DateTimeFormat.forPattern( FORMAT_DATE );
        String date = dt.toString( formatter );
        CreationOffreFormation form = new CreationOffreFormation(ofDAO);
        if(action.equals("ajoutoffreform")){
            if (form.getErreurs().isEmpty()) {
                form.creerOffreFormation(request, institut,date);
                session.setAttribute(SESSION_INSTITUT,institut);
                List<OffreFormation> listForm = ofDAO.getOffreFormationByIns(codeIns);
                if (listForm.isEmpty()){
                    request.setAttribute(MESSAGE_FORMATION, "vide");
                }else {
                    request.setAttribute("listForm", listForm);
                }
                request.getRequestDispatcher(VUE).forward(request, response);
            }else{
                request.getRequestDispatcher(VUE).forward(request, response);
            }
        }else if(action.equals("modifoffreform")){
            if (form.getErreurs().isEmpty()) {
                form.creerOffreFormation(request, institut,date);
                session.setAttribute(SESSION_INSTITUT,institut);
                List<OffreFormation> listForm = ofDAO.getOffreFormationByIns(codeIns);
                if (listForm.isEmpty()){
                    request.setAttribute(MESSAGE_FORMATION, "vide");
                }else {
                    request.setAttribute("listForm", listForm);
                }
                request.getRequestDispatcher(VUE).forward(request, response);
            }else{
                request.getRequestDispatcher(VUE).forward(request, response);
            }
        }
    }
}
