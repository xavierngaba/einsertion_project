/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur;

import dao.CandidatDAO;
import dao.EntrepriseDAO;
import dao.InstitutDAO;
import dao.OffreEmploiDAO;
import dao.OffreFormationDAO;
import exception.FormValidationException;
import metier.CandidatForm;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Candidat;
import model.Entreprise;
import model.Institut;
import model.OffreEmploi;
import model.OffreFormation;

/**
 *
 * @author XAVIER
 */
public class CreationCandidatServlet extends HttpServlet {
    @EJB
    private CandidatDAO candidatDAO;
    @EJB
    private EntrepriseDAO entrepriseDAO;
    @EJB
    private InstitutDAO institutDAO;
    @EJB
    private OffreEmploiDAO offreEmpDAO;
    @EJB
    private OffreFormationDAO offreFormDAO;
    public static final String ATT_CANDIDAT = "candidat";
    public static final String ATT_FORM = "form";
    public static final String TYPE ="type";
    public static final String ERREUR ="erreur";
    public static final String SESSION_CANDIDAT = "sessionUtilisateur";
    public static final String VUE_CANDIDAT = "/accueilcandidat.jsp";
    public static final String VUE_FORM = "/inscription.jsp";
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
        try {
            CandidatForm form = new CandidatForm(candidatDAO);
            
            Candidat candidat = form.creerCandidat(request);
            List<OffreFormation> listForm = offreFormDAO.getAllFormation();
            List<OffreEmploi> listEmp = offreEmpDAO.getAllOffreEmploi();
            request.setAttribute(ATT_CANDIDAT, candidat);
            request.setAttribute(ATT_FORM, form);
            if (form.getErreurs().isEmpty()) {
                List<Entreprise> listEntreprise = entrepriseDAO.getAllEntreprise();
                List<Institut> listInstitut = institutDAO.getAllInstitut();
                for(int i = 1; i < listEntreprise.size();i++){
                       if(!offreEmpDAO.getOffreEmploiByEnt(listEntreprise.get(i).getCodeEnt()).isEmpty()){
                         listEntreprise.get(i).setOffreEmploiList(offreEmpDAO.getOffreEmploiByEnt(listEntreprise.get(i).getCodeEnt()));  
                       }   
                   }
                request.setAttribute("listEntreprise", listEntreprise);
                request.setAttribute("listOffreEmploi", listEmp);
                for(int i = 1; i < listInstitut.size();i++){
                       if(!offreFormDAO.getOffreFormationByIns(listInstitut.get(i).getCodeIns()).isEmpty()){
                           listInstitut.get(i).setOffreFormationList(offreFormDAO.getOffreFormationByIns(listInstitut.get(i).getCodeIns()));
                       }
                   }
                request.setAttribute("listInstitut", listInstitut);
                request.setAttribute("listOffreFormation", listForm);
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_CANDIDAT, candidat);
                request.setAttribute(TYPE, "Candidat");
                this.getServletContext().getRequestDispatcher(VUE_CANDIDAT).forward(request, response);
            }else{
                request.setAttribute(ERREUR, "ErreurCandidat");
                request.getRequestDispatcher(VUE_FORM).forward(request, response);
            }
        } catch (FormValidationException ex) {
            request.setAttribute(ERREUR, "ErreurCandidat");
            request.getRequestDispatcher(VUE_FORM).forward(request, response);
        }
    }
}
