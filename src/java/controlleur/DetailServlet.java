/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur;

import dao.CandidatDAO;
import dao.CompetenceDAO;
import dao.CvDAO;
import dao.EntrepriseDAO;
import dao.ExperienceDAO;
import dao.FormationDAO;
import dao.InstitutDAO;
import dao.OffreEmploiDAO;
import dao.OffreFormationDAO;
import dao.UserDAO;
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
import model.Entreprise;
import model.Institut;
import model.OffreEmploi;
import model.OffreFormation;
import model.Users;

/**
 *
 * @author xavier_ng
 */
public class DetailServlet extends HttpServlet {
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
    public static final String SESSION_USER = "sessionUtilisateur";
    public static final String VUE_AFFICH_OFFREEMPLOI_ENT = "/affichoffreemploi.jsp";
    public static final String VUE_AFFICH_OFFREFORMATION_INS = "/affichoffreformation.jsp";
    public static final String VUE_DETAIL_OFFREEMPLOI_ENT = "/detailoffreemploi.jsp";
    public static final String VUE_DETAIL_OFFREFORMATION_INS = "/detailoffreformation.jsp";
    public static final String VUE_DETAIL_CV_CANDIDAT = "/detailcv.jsp";
    public static final String TYPE ="type";
    public static final String AGE ="age";
    public static final String MESSAGE_FORMATION = "formation";
    public static final String MESSAGE_EXPERIENCE = "experience";
    public static final String MESSAGE_COMPETENCE = "competence";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       String action = request.getParameter("action");
       Long code = Long.parseLong(request.getParameter("id"));
       Users utilisateur = userDAO.getUserById(code);
       if(candidatDAO.verifCandidat(utilisateur) == true){
           if(action.equals("affichoffreemploient")){
                request.setAttribute(TYPE, "Candidat");
                Long codeEnt = Long.parseLong(request.getParameter("codeEnt"));
                Candidat candidat = candidatDAO.getCandidat(utilisateur);
                Entreprise entreprise = entrepriseDAO.getEntreprise(codeEnt);
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_USER,candidat);
                entreprise.setOffreEmploiList(offreEmpDAO.getOffreEmploiByEnt(entreprise.getCodeEnt()));
                request.setAttribute("Entreprise", entreprise);
                request.getRequestDispatcher(VUE_AFFICH_OFFREEMPLOI_ENT).forward(request, response);
              }else if(action.equals("detailoffreemploi")){
                request.setAttribute(TYPE, "Candidat");
                Long codeEnt = Long.parseLong(request.getParameter("codeEnt"));
                Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
                Candidat candidat = candidatDAO.getCandidat(utilisateur);
                Entreprise entreprise = entrepriseDAO.getEntreprise(codeEnt);
                OffreEmploi offreEmploi = offreEmpDAO.getOffreEmploi(codeOffreEmp);
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_USER,candidat);
                request.setAttribute("Entreprise", entreprise);
                request.setAttribute("OffreEmploi", offreEmploi);
                request.getRequestDispatcher(VUE_DETAIL_OFFREEMPLOI_ENT).forward(request, response);
              }else if(action.equals("affichoffreformationins")){
                 request.setAttribute(TYPE, "Candidat");
                Long codeIns = Long.parseLong(request.getParameter("codeIns"));
                Candidat candidat = candidatDAO.getCandidat(utilisateur);
                Institut institut = institutDAO.getInstitut(codeIns);
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_USER,candidat);
                institut.setOffreFormationList(offreFormDAO.getOffreFormationByIns(institut.getCodeIns()));
                request.setAttribute("Institut", institut);
                request.getRequestDispatcher(VUE_AFFICH_OFFREFORMATION_INS).forward(request, response); 
              }else if(action.equals("detailoffreformation")){
                request.setAttribute(TYPE, "Candidat");
                Long codeIns = Long.parseLong(request.getParameter("codeIns"));
                Long codeOffreForm = Long.parseLong(request.getParameter("codeOffreForm"));
                Candidat candidat = candidatDAO.getCandidat(utilisateur);
                Institut institut = institutDAO.getInstitut(codeIns);
                OffreFormation offreformation = offreFormDAO.getOffreFormation(codeOffreForm);
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_USER,candidat);
                request.setAttribute("Institut", institut);
                request.setAttribute("OffreFormation", offreformation);
                request.getRequestDispatcher(VUE_DETAIL_OFFREFORMATION_INS).forward(request, response);
              }
       }else if (entrepriseDAO.verifEntreprise(utilisateur) == true){
          if(action.equals("detailcv")){
                Long codeCan = Long.parseLong(request.getParameter("codeCan"));
                Candidat candidat = candidatDAO.getCandidatById(codeCan);
                Entreprise entreprise = entrepriseDAO.getEntreprise(utilisateur);
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_USER,entreprise);

                CalculAge calculAge = new CalculAge();
                request.setAttribute(AGE, calculAge.getAge(candidat.getDateNaiss().toString()));

                Cv cv = new Cv();
                cv = cvDAO.getCvCandidat(candidat.getCodeCan());
                cv.setObjectif(candidat.getDomaine());
                cv.setFormationList(formDAO.getFormationCandidat(candidat));
                cv.setExperienceProList(expDAO.getExperienceCandidat(candidat));
                cv.setCompetenceList(compDAO.getCompetenceCandidat(candidat));
                /*
                 * envoie d'un mail au candidat pour lui informer que son Cv à été vu par l'entreprise
                 */
                //code...
                request.setAttribute("cv", cv);
                request.setAttribute("Candidat", candidat);
                request.setAttribute(TYPE, "Entreprise");
                request.getRequestDispatcher(VUE_DETAIL_CV_CANDIDAT).forward(request, response);
           }else if(action.equals("detailoffreformation")){
                request.setAttribute(TYPE, "Entreprise");
                Long codeIns = Long.parseLong(request.getParameter("codeIns"));
                Long codeOffreForm = Long.parseLong(request.getParameter("codeOffreForm"));
                Entreprise entreprise = entrepriseDAO.getEntreprise(utilisateur);
                Institut institut = institutDAO.getInstitut(codeIns);
                OffreFormation offreformation = offreFormDAO.getOffreFormation(codeOffreForm);
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_USER,entreprise);
                request.setAttribute("Institut", institut);
                request.setAttribute("OffreFormation", offreformation);
                request.getRequestDispatcher(VUE_DETAIL_OFFREFORMATION_INS).forward(request, response);
              } 
       }else if(institutDAO.verifInstitut(utilisateur) == true){
           if(action.equals("detailoffreemploi")){
                request.setAttribute(TYPE, "Institut");
                Long codeEnt = Long.parseLong(request.getParameter("codeEnt"));
                Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
                Institut institut = institutDAO.getInstitut(utilisateur);
                Entreprise entreprise = entrepriseDAO.getEntreprise(codeEnt);
                OffreEmploi offreEmploi = offreEmpDAO.getOffreEmploi(codeOffreEmp);
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_USER,institut);
                request.setAttribute("Entreprise", entreprise);
                request.setAttribute("OffreEmploi", offreEmploi);
                request.getRequestDispatcher(VUE_DETAIL_OFFREEMPLOI_ENT).forward(request, response);
            }else if(action.equals("detailoffreformation")){
                request.setAttribute(TYPE, "Institut");
                Long codeOffreForm = Long.parseLong(request.getParameter("codeOffreForm"));
                Institut institut = institutDAO.getInstitut(utilisateur);
                OffreFormation offreformation = offreFormDAO.getOffreFormation(codeOffreForm);
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_USER,institut);
                request.setAttribute("Institut", institut);
                request.setAttribute("OffreFormation", offreformation);
                request.getRequestDispatcher(VUE_DETAIL_OFFREFORMATION_INS).forward(request, response);
            }else if(action.equals("affichoffreformationins")){
                request.setAttribute(TYPE, "Institut");
                Institut institut = institutDAO.getInstitut(utilisateur);
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_USER,institut);
                institut.setOffreFormationList(offreFormDAO.getOffreFormationByIns(institut.getCodeIns()));
                request.setAttribute("Institut", institut);
                request.getRequestDispatcher(VUE_AFFICH_OFFREFORMATION_INS).forward(request, response);
            }else if(action.equals("affichoffreemploient")){
                request.setAttribute(TYPE, "Institut");
                Long codeEnt = Long.parseLong(request.getParameter("codeEnt"));
                Institut institut = institutDAO.getInstitut(utilisateur);
                Entreprise entreprise = entrepriseDAO.getEntreprise(codeEnt);
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_USER,institut);
                entreprise.setOffreEmploiList(offreEmpDAO.getOffreEmploiByEnt(entreprise.getCodeEnt()));
                request.setAttribute("Entreprise", entreprise);
                request.getRequestDispatcher(VUE_AFFICH_OFFREEMPLOI_ENT).forward(request, response);
              }
       }
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
    }   
}
