/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur;

import static controlleur.ConnexionServlet.ATT_SESSION_USER;
import static controlleur.ProfilCandidatServlet.SESSION_CANDIDAT;
import dao.CandidatDAO;
import dao.CvDAO;
import dao.EntrepriseDAO;
import dao.LettreMotivationDAO;
import dao.OffreEmploiDAO;
import dao.PostulationDAO;
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
import metier.LettreMotivationForm;
import model.Candidat;
import model.Cv;
import model.Entreprise;
import model.Formation;
import model.OffreEmploi;
import model.Postulat;
import model.Users;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 *
 * @author xavier_ng
 */
public class PostulationServlet extends HttpServlet {
    @EJB
    private CandidatDAO candidatDAO;
    @EJB
    private CvDAO cvDAO;
    @EJB
    private EntrepriseDAO entrepriseDAO;
    @EJB
    private OffreEmploiDAO offreEmpDAO;
    @EJB
    private PostulationDAO postulDAO;
    @EJB
    private UserDAO userDAO;
    @EJB
    private LettreMotivationDAO lettreMotivationDAO;
    public static final String VUE_LETTRE_MOTIVATION = "/creerlettremotivation.jsp";
    public static final String VUE_POSTUL_OFFREEMPLOI = "/postulats.jsp";
    public static final String VUE_AFFICH_OFFREEMPLOI = "/affichoffreemploi.jsp";
    public static final String VUE_MES_POSTULATION = "/mespostulations.jsp";
    public static final String VUE_MES_CANDIDATURES = "/mescandidatures.jsp";
    public static final String VUE_TOUTES_MES_CANDIDATURES = "/toutesmescandidatures.jsp";
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
            Long codeCan = Long.parseLong(request.getParameter("id"));
            Long codeEnt = Long.parseLong(request.getParameter("codeEnt"));
            Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
            Candidat candidat = candidatDAO.getCandidatById(codeCan);
            Cv cv = new Cv();
            cv = cvDAO.getCvCandidat(candidat.getCodeCan());
            Formation formation = new Formation();
            formation = cv.getFormationList().get(0);
            int nbEx = cv.getExperienceProList().size();
            Entreprise entreprise = entrepriseDAO.getEntreprise(codeEnt);
            OffreEmploi offreEmploi = offreEmpDAO.getOffreEmploi(codeOffreEmp);
            HttpSession session = request.getSession();
            session.setAttribute(SESSION_CANDIDAT,candidat);
            DateTime dt = new DateTime();
            request.setAttribute("date", dt);
            request.setAttribute("formation", formation);
            request.setAttribute("nbEx", nbEx);
            request.setAttribute("Entreprise", entreprise);
            request.setAttribute("OffreEmploi", offreEmploi);
            request.getRequestDispatcher(VUE_LETTRE_MOTIVATION).forward(request, response);
        }else if(action.equals("valider")){
            request.setAttribute(TYPE, "Candidat");
            Long codeCan = Long.parseLong(request.getParameter("id"));
            Long codeEnt = Long.parseLong(request.getParameter("codeEnt"));
            Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
            Candidat candidat = candidatDAO.getCandidatById(codeCan);
            Entreprise entreprise = entrepriseDAO.getEntreprise(codeEnt);
            OffreEmploi offreEmploi = offreEmpDAO.getOffreEmploi(codeOffreEmp);
            request.setAttribute("Entreprise", entreprise);
            request.setAttribute("OffreEmploi", offreEmploi);
            DateTime dt = new DateTime();
            DateTimeFormatter formatter = DateTimeFormat.forPattern( FORMAT_DATE );
            String date = dt.toString( formatter );
            Postulat postulation = new Postulat(candidat.getCodeCan(),offreEmploi.getCodeOffreEmp(),date);
            LettreMotivationForm lettreMotivationForm = new LettreMotivationForm(lettreMotivationDAO);
            try{
                lettreMotivationForm.creerLettreMotivation(request, candidat, offreEmploi);
                postulDAO.ajoutPostulation(postulation);
                request.setAttribute(MESSAGE, "reussi");
                request.getRequestDispatcher(VUE_POSTUL_OFFREEMPLOI).forward(request, response);
            }catch(EJBException e){
                request.setAttribute(MESSAGE, "echec");
                request.getRequestDispatcher(VUE_POSTUL_OFFREEMPLOI).forward(request, response);
            } catch (Exception ex) {
                request.setAttribute(MESSAGE, "echec");
                request.getRequestDispatcher(VUE_POSTUL_OFFREEMPLOI).forward(request, response);
            }
        }else if(action.equals("affichpostulation")){
            Long codeUser = Long.parseLong(request.getParameter("codeUser"));
            Users utilisateur = userDAO.getUserById(codeUser);
            if(candidatDAO.verifCandidat(utilisateur) == true){
               Candidat candidat = candidatDAO.getCandidat(utilisateur);
               HttpSession session = request.getSession();
               session.setAttribute( ATT_SESSION_USER, candidat);
               request.setAttribute(TYPE, "Candidat");
               candidat.setPostulatList(postulDAO.getAllPostulationByCandidat(candidat.getCodeCan()));
               
               if(!postulDAO.getAllPostulationByCandidat(candidat.getCodeCan()).isEmpty()){
                   List<OffreEmploi> listOffreEmploi = new ArrayList<OffreEmploi>();
                   for(int i = 0; i < candidat.getPostulatList().size();i++){
                      listOffreEmploi.add(offreEmpDAO.getOffreEmploi(candidat.getPostulatList().get(i).getOffreEmploi().getCodeOffreEmp()));
                   }
                   request.setAttribute("offreEmploiList", listOffreEmploi);
               }else{
                    request.setAttribute(MESSAGE, "vide");
                }
               request.getRequestDispatcher(VUE_MES_POSTULATION).forward(request, response);
            }else if(entrepriseDAO.verifEntreprise(utilisateur) == true){
                Entreprise entreprise = entrepriseDAO.getEntreprise(utilisateur);
                HttpSession session = request.getSession();
                session.setAttribute( ATT_SESSION_USER, entreprise);
                request.setAttribute(TYPE, "Entreprise");
                Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
                if (codeOffreEmp == 0){
                    List<Postulat> listPost = postulDAO.getAllPostulationByCodeEnt(entreprise.getCodeEnt()); 
                    if (!listPost.isEmpty()){
                        request.setAttribute("listPost", listPost);
                    }else{
                        request.setAttribute(MESSAGE, "vide");
                    }
                    request.getRequestDispatcher(VUE_TOUTES_MES_CANDIDATURES).forward(request, response);
                }else {
                    OffreEmploi offreEmploi = offreEmpDAO.getOffreEmploi(codeOffreEmp);
                    for(int i = 0; i < postulDAO.getAllPostulationByOffreEmploi(offreEmploi.getCodeOffreEmp()).size(); i++){
                        offreEmploi.setPostulatList(postulDAO.getAllPostulationByOffreEmploi(offreEmploi.getCodeOffreEmp())); 
                    }

                    if(!postulDAO.getAllPostulationByOffreEmploi(offreEmploi.getCodeOffreEmp()).isEmpty()){
                        request.setAttribute("OffreEmploi", offreEmploi);
                        List<Candidat> listCandidat = new ArrayList<Candidat>();
                        for(int i = 0; i < offreEmploi.getPostulatList().size(); i++){
                            listCandidat.add(candidatDAO.getCandidat(offreEmploi.getPostulatList().get(i).getCandidat().getCode()));
                        }
                        request.setAttribute("CandidatList", listCandidat);
                    }else{
                        request.setAttribute(MESSAGE, "vide");
                    }
                request.getRequestDispatcher(VUE_MES_CANDIDATURES).forward(request, response);
                }
            }
        }else if (action.equals("effacerpostulation")){
            request.setAttribute(TYPE, "Candidat");
            Long codeUser = Long.parseLong(request.getParameter("codeUser"));
            Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
            Users utilisateur = userDAO.getUserById(codeUser);
            Candidat candidat = candidatDAO.getCandidat(utilisateur);
            HttpSession session = request.getSession();
            session.setAttribute( ATT_SESSION_USER, candidat);
            postulDAO.suprPostulation(candidat.getCodeCan(), codeOffreEmp);
            lettreMotivationDAO.suprLettreMotivation(candidat.getCodeCan(), codeOffreEmp);
            candidat.setPostulatList(postulDAO.getAllPostulationByCandidat(candidat.getCodeCan()));
            if(!postulDAO.getAllPostulationByCandidat(candidat.getCodeCan()).isEmpty()){
                List<OffreEmploi> listOffreEmploi = new ArrayList<OffreEmploi>();
                for(int i = 0; i < candidat.getPostulatList().size();i++){
                   listOffreEmploi.add(offreEmpDAO.getOffreEmploi(candidat.getPostulatList().get(i).getOffreEmploi().getCodeOffreEmp()));
                }
                request.setAttribute("offreEmploiList", listOffreEmploi);
            }else{
                 request.setAttribute(MESSAGE, "vide");
             }
            request.getRequestDispatcher(VUE_MES_POSTULATION).forward(request, response);
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
        String action = request.getParameter("action");
        if(action.equals("valider")){
            request.setAttribute(TYPE, "Candidat");
            Long codeCan = Long.parseLong(request.getParameter("codeCan"));
            Long codeEnt = Long.parseLong(request.getParameter("codeEnt"));
            Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
            Candidat candidat = candidatDAO.getCandidatById(codeCan);
            HttpSession session = request.getSession();
            session.setAttribute( ATT_SESSION_USER, candidat);
            Entreprise entreprise = entrepriseDAO.getEntreprise(codeEnt);
            OffreEmploi offreEmploi = offreEmpDAO.getOffreEmploi(codeOffreEmp);
            request.setAttribute("Entreprise", entreprise);
            request.setAttribute("OffreEmploi", offreEmploi);
            List<OffreEmploi> listOffreEmploi = new ArrayList<OffreEmploi>();
            DateTime dt = new DateTime();
            DateTimeFormatter formatter = DateTimeFormat.forPattern( FORMAT_DATE );
            String date = dt.toString( formatter );
            Postulat postulation = new Postulat(candidat.getCodeCan(),offreEmploi.getCodeOffreEmp(),date);
            LettreMotivationForm lettreMotivationForm = new LettreMotivationForm(lettreMotivationDAO);
            for(int i = 0; i < postulDAO.getAllPostulationByCandidat(candidat.getCodeCan()).size(); i++){
                   candidat.setPostulatList(postulDAO.getAllPostulationByCandidat(candidat.getCodeCan()));
               }
            if(!postulDAO.getAllPostulationByCandidat(candidat.getCodeCan()).isEmpty()){
                for(int i = 0; i < candidat.getPostulatList().size();i++){
                   listOffreEmploi.add(offreEmpDAO.getOffreEmploi(candidat.getPostulatList().get(i).getOffreEmploi().getCodeOffreEmp()));
                }
            }else{
                 request.setAttribute(MESSAGE, "vide");
             }
            try{
                if(postulDAO.verifPostulation(candidat.getCodeCan(), offreEmploi.getCodeOffreEmp()).booleanValue() == false){
                   lettreMotivationForm.creerLettreMotivation(request, candidat, offreEmploi);
                   postulDAO.ajoutPostulation(postulation);
                   request.setAttribute(MESSAGE, "reussi");  
                }else{
                  request.setAttribute(MESSAGE, "deja");  
                }
               request.setAttribute("offreEmploiList", listOffreEmploi);
               request.getRequestDispatcher(VUE_MES_POSTULATION).forward(request, response);
            }catch(EJBException e){
                request.setAttribute("offreEmploiList", listOffreEmploi);
                request.setAttribute(MESSAGE, "echec");
                request.getRequestDispatcher(VUE_MES_POSTULATION).forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("offreEmploiList", listOffreEmploi);
                request.setAttribute(MESSAGE, "echec");
                request.getRequestDispatcher(VUE_MES_POSTULATION).forward(request, response);
            }
        }
    }
}
