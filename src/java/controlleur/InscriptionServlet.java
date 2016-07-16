/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur;

import static controlleur.ConnexionServlet.ATT_SESSION_USER;
import static controlleur.ProfilCandidatServlet.SESSION_CANDIDAT;
import dao.CandidatDAO;
import dao.InscriptionDAO;
import dao.InstitutDAO;
import dao.OffreFormationDAO;
import dao.UserDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Candidat;
import model.Inscription;
import model.Institut;
import model.OffreFormation;
import model.Users;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 *
 * @author xavier_ng
 */
public class InscriptionServlet extends HttpServlet {
    @EJB
    private CandidatDAO candidatDAO;
    @EJB
    private InstitutDAO institutDAO;
    @EJB
    private OffreFormationDAO offreFormDAO;
    @EJB
    private InscriptionDAO inscriptionDAO;
    @EJB
    private UserDAO userDAO;
    public static final String VUE_INSCRIP_OFFREFORMATION = "/inscriptionformation.jsp";
    public static final String VUE_MES_FORMATIONS = "/mesformations.jsp";
    public static final String TYPE ="type";
    private static final String FORMAT_DATE = "dd MMMM yyyy HH:mm:ss";
    private static final String MESSAGE = "message";
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
        if(action.equals("effectuer")){
            request.setAttribute(TYPE, "Candidat");
            Long code = Long.parseLong(request.getParameter("id"));
            Long codeIns = Long.parseLong(request.getParameter("codeIns"));
            Long codeOffreForm = Long.parseLong(request.getParameter("codeOffreForm"));
            Users utilisateur = userDAO.getUserById(code);
            Candidat candidat = candidatDAO.getCandidat(utilisateur);
            Institut institut = institutDAO.getInstitut(codeIns);
            OffreFormation offreformation = offreFormDAO.getOffreFormation(codeOffreForm);
            HttpSession session = request.getSession();
            session.setAttribute(SESSION_CANDIDAT,candidat);
            request.setAttribute("Institut", institut);
            request.setAttribute("OffreFormation", offreformation);
            request.getRequestDispatcher(VUE_INSCRIP_OFFREFORMATION).forward(request, response);
        }else if(action.equals("valider")){
            request.setAttribute(TYPE, "Candidat");
            Long codeCan = Long.parseLong(request.getParameter("id"));
            Long codeIns = Long.parseLong(request.getParameter("codeIns"));
            Long codeOffreForm = Long.parseLong(request.getParameter("codeOffreForm"));
            Candidat candidat = candidatDAO.getCandidatById(codeCan);
            Institut institut = institutDAO.getInstitut(codeIns);
            OffreFormation offreformation = offreFormDAO.getOffreFormation(codeOffreForm);
            request.setAttribute("Institut", institut);
            request.setAttribute("OffreFormation", offreformation);
            DateTime dt = new DateTime();
            DateTimeFormatter formatter = DateTimeFormat.forPattern( FORMAT_DATE );
            String date = dt.toString( formatter );
            Inscription inscription = new Inscription(candidat.getCodeCan(), offreformation.getCodeOffreForm(), date);
            try{
                inscriptionDAO.ajoutInscription(inscription);
                request.setAttribute(MESSAGE, "reussi");
                request.getRequestDispatcher(VUE_INSCRIP_OFFREFORMATION).forward(request, response);
            }catch(EJBException e){
                request.setAttribute(MESSAGE, "echec");
                request.getRequestDispatcher(VUE_INSCRIP_OFFREFORMATION).forward(request, response);
            }
        }else if(action.equals("afficher")){
            Long codeUser = Long.parseLong(request.getParameter("codeUser"));
            Users utilisateur = userDAO.getUserById(codeUser);
            if(candidatDAO.verifCandidat(utilisateur)== true){
               Candidat candidat = candidatDAO.getCandidat(utilisateur);
               HttpSession session = request.getSession();
               session.setAttribute( ATT_SESSION_USER, candidat);
               request.setAttribute(TYPE, "Candidat");
               candidat.setInscriptionList(inscriptionDAO.getAllInscriptionByCandidat(candidat.getCodeCan()));
               if(!inscriptionDAO.getAllInscriptionByCandidat(candidat.getCodeCan()).isEmpty()){
                   List<OffreFormation> listOffreFormation = new ArrayList<OffreFormation>();
                   for(int i = 0; i < candidat.getInscriptionList().size(); i++){
                       listOffreFormation.add(offreFormDAO.getOffreFormation(candidat.getInscriptionList().get(i).getOffreFormation().getCodeOffreForm()));
                   }
                   request.setAttribute("offreFormList", listOffreFormation);
               }else{
                    request.setAttribute(MESSAGE, "vide");
                }
               request.getRequestDispatcher(VUE_MES_FORMATIONS).forward(request, response);
            }
        }else if(action.equals("effacer")){
            request.setAttribute(TYPE, "Candidat");
            Long codeUser = Long.parseLong(request.getParameter("codeUser"));
            Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
            Users utilisateur = userDAO.getUserById(codeUser);
            Candidat candidat = candidatDAO.getCandidat(utilisateur);
            HttpSession session = request.getSession();
            session.setAttribute( ATT_SESSION_USER, candidat);
            inscriptionDAO.suprInscription(candidat.getCodeCan(), codeOffreEmp);
            candidat.setInscriptionList(inscriptionDAO.getAllInscriptionByCandidat(candidat.getCodeCan()));
               if(!inscriptionDAO.getAllInscriptionByCandidat(candidat.getCodeCan()).isEmpty()){
                   List<OffreFormation> listOffreFormation = new ArrayList<OffreFormation>();
                   for(int i = 0; i < candidat.getInscriptionList().size(); i++){
                       listOffreFormation.add(offreFormDAO.getOffreFormation(candidat.getInscriptionList().get(i).getOffreFormation().getCodeOffreForm()));
                   }
                   request.setAttribute("offreFormList", listOffreFormation);
               }else{
                    request.setAttribute(MESSAGE, "vide");
               }
            request.getRequestDispatcher(VUE_MES_FORMATIONS).forward(request, response);
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
        
    }
}
