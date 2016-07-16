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
import dao.UserDAO;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import metier.ConnexionForm;
import model.Candidat;
import model.Entreprise;
import model.Institut;
import model.OffreEmploi;
import model.OffreFormation;
import model.Users;

/**
 *
 * @author Dry Bass
 */
public class ConnexionServlet extends HttpServlet {
    @EJB
    private CandidatDAO candidatDAO;
    @EJB
    private EntrepriseDAO entrepriseDAO;
    @EJB
    private InstitutDAO institutDAO;
    @EJB
    private UserDAO userDAO;
    @EJB
    private OffreEmploiDAO offreEmpDAO;
    @EJB
    private OffreFormationDAO offreFormDAO;
    public static final String ATT_SESSION_USER ="sessionUtilisateur";
    public static final String TYPE ="type";
    public static final String MESSAGE_OFFREEMPLOI = "offreemploi";
    public static final String MESSAGE_OFFREFORMATION = "offreformation";
    public static final String MESSAGE = "message";
    public static final String SESSION_USER_CANDIDAT = "/accueilcandidat.jsp";
    public static final String SESSION_USER_ENTREPRISE = "/accueilentreprise.jsp";
    public static final String SESSION_USER_INSTITUT = "/accueilinstitut.jsp";
    public static final String INDEX = "/index.jsp";
    public static final String URL_REDIRECTION = "/einsertion/index.jsp";
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
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect( URL_REDIRECTION );
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
            ConnexionForm form = new ConnexionForm(userDAO);
             
            Users utilisateur = form.connexionUser(request);
            List<OffreFormation> listForm = offreFormDAO.getAllFormation();
            List<OffreEmploi> listEmp = offreEmpDAO.getAllOffreEmploi();
            List<Candidat> listCan = candidatDAO.getAllCandidat();
            if (form.getErreurs().isEmpty()) {
               if(candidatDAO.verifCandidat(utilisateur) == true){
                   Candidat candidat = candidatDAO.getCandidat(utilisateur);
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
                   session.setAttribute( ATT_SESSION_USER, candidat);
                   request.setAttribute(TYPE, "Candidat");
                   request.getRequestDispatcher( SESSION_USER_CANDIDAT ).forward( request, response );
               }else if(entrepriseDAO.verifEntreprise(utilisateur) == true){
                   Entreprise entreprise = entrepriseDAO.getEntreprise(utilisateur);
                   HttpSession session = request.getSession();
                   session.setAttribute( ATT_SESSION_USER, entreprise);
                   request.setAttribute(TYPE, "Entreprise");
                   request.setAttribute("listCan", listCan);
                   request.setAttribute("listForm", listForm);
                   request.getRequestDispatcher( SESSION_USER_ENTREPRISE ).forward( request, response );
               }else if(institutDAO.verifInstitut(utilisateur) == true){
                   Institut institut = institutDAO.getInstitut(utilisateur);
                   HttpSession session = request.getSession();
                   session.setAttribute( ATT_SESSION_USER, institut);
                   request.setAttribute(TYPE, "Institut");
                   request.setAttribute("listForm", listForm);
                   request.setAttribute("listEmp", listEmp);
                   request.getRequestDispatcher( SESSION_USER_INSTITUT ).forward( request, response );
               }
            }else{
                request.setAttribute(MESSAGE, "error");
                request.getRequestDispatcher(INDEX).forward(request, response);
            }
            
        } catch (Exception ex) {
            Logger.getLogger(ConnexionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
