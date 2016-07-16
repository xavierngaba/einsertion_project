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
 * @author xavier_ng
 */
public class AffichageServlet extends HttpServlet {
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
    public static final String ATT_SESSION_USER ="sessionUtilisateur";
    public static final String VUE_CANDIDATURE = "/accueilcandidat.jsp";
    public static final String VUE_ENTREPRISE = "/accueilentreprise.jsp";
    public static final String VUE_INSTITUT = "/accueilinstitut.jsp";
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
       String affich = request.getParameter("affich");
       List<OffreFormation> listForm = offreFormDAO.getAllFormation();
       List<OffreEmploi> listEmp = offreEmpDAO.getAllOffreEmploi();
       List<Candidat> listCan = candidatDAO.getAllCandidat();
       if(affich.equals("candidat")){
           Long codeCan = Long.parseLong(request.getParameter("id"));
           Candidat candidat = candidatDAO.getCandidatById(codeCan);
           HttpSession session = request.getSession();
           session.setAttribute(ATT_SESSION_USER,candidat);
           List<Entreprise> listEntreprise = entrepriseDAO.getAllEntreprise();
           List<Institut> listInstitut = institutDAO.getAllInstitut();
            for(int i = 1; i < listEntreprise.size();i++){
                if(!offreEmpDAO.getOffreEmploiByEnt(listEntreprise.get(i).getCodeEnt()).isEmpty()){
                  listEntreprise.get(i).setOffreEmploiList(offreEmpDAO.getOffreEmploiByEnt(listEntreprise.get(i).getCodeEnt()));  
                }   
            }
            request.setAttribute("listEntreprise", listEntreprise);
            request.setAttribute("listOffreEmploi", offreEmpDAO.getAllOffreEmploi());
            for(int i = 1; i < listInstitut.size();i++){
                if(!offreFormDAO.getOffreFormationByIns(listInstitut.get(i).getCodeIns()).isEmpty()){
                    listInstitut.get(i).setOffreFormationList(offreFormDAO.getOffreFormationByIns(listInstitut.get(i).getCodeIns()));
                }
            }
            request.setAttribute("listInstitut", listInstitut);
            request.setAttribute("listOffreFormation", offreFormDAO.getAllFormation());
            request.setAttribute(TYPE, "Candidat");
           this.getServletContext().getRequestDispatcher(VUE_CANDIDATURE).forward(request, response);
       }else if(affich.equals("candidatinconnu")){
          List<Entreprise> listEntreprise = entrepriseDAO.getAllEntreprise();
            List<Institut> listInstitut = institutDAO.getAllInstitut();
            for(int i = 1; i < listEntreprise.size();i++){
                if(!offreEmpDAO.getOffreEmploiByEnt(listEntreprise.get(i).getCodeEnt()).isEmpty()){
                  listEntreprise.get(i).setOffreEmploiList(offreEmpDAO.getOffreEmploiByEnt(listEntreprise.get(i).getCodeEnt()));  
                }   
            }
            request.setAttribute("listEntreprise", listEntreprise);
            request.setAttribute("listOffreEmploi", offreEmpDAO.getAllOffreEmploi());
            for(int i = 1; i < listInstitut.size();i++){
                if(!offreFormDAO.getOffreFormationByIns(listInstitut.get(i).getCodeIns()).isEmpty()){
                    listInstitut.get(i).setOffreFormationList(offreFormDAO.getOffreFormationByIns(listInstitut.get(i).getCodeIns()));
                }
            }
            request.setAttribute("listInstitut", listInstitut);
            request.setAttribute("listOffreFormation", offreFormDAO.getAllFormation());
           this.getServletContext().getRequestDispatcher("/espacecandidat.jsp").forward(request, response); 
       }else if(affich.equals("entreprise")){
           request.setAttribute(TYPE, "Entreprise");
           request.setAttribute("listCan", listCan);
           request.setAttribute("listForm", listForm);
           this.getServletContext().getRequestDispatcher(VUE_ENTREPRISE).forward(request, response);
       }else if(affich.equals("institut")){
           request.setAttribute(TYPE, "Institut");
           request.setAttribute("listForm", listForm);
           request.setAttribute("listEmp", listEmp);
           this.getServletContext().getRequestDispatcher(VUE_INSTITUT).forward(request, response);
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
