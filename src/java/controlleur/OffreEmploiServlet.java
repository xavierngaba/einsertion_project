/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur;

import dao.EntrepriseDAO;
import dao.OffreEmploiDAO;
import dao.PostulationDAO;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Entreprise;
import model.OffreEmploi;
import model.Postulat;
import offres.CreationOffreEmploi;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 *
 * @author xavier_ng
 */
public class OffreEmploiServlet extends HttpServlet {
    @EJB
    private EntrepriseDAO entrepriseDAO;
    @EJB
    private OffreEmploiDAO offreEmpDAO;
    @EJB
    private PostulationDAO postDAO;
    
    public static final String SESSION_ENTREPRISE = "sessionUtilisateur";
    public static final String VUE = "/offreemploi.jsp";
    public static final String VUE_MODIF_OFFREEMPLOI = "/modifoffreemploi.jsp";
    public static final String TYPE ="type";
    public static final String MESSAGE_EMPLOI = "emploi";
    private static final String FORMAT_DATE = "dd MMMM yyyy HH:mm:ss";
    
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
       request.setAttribute(TYPE, "Entreprise");
       String action = request.getParameter("action");
       Long codeEnt = Long.parseLong(request.getParameter("id"));
       Entreprise entreprise = entrepriseDAO.getEntreprise(codeEnt);
       HttpSession session = request.getSession();
       session.setAttribute(SESSION_ENTREPRISE,entreprise);
       if(action.equals("affich")){
        List<OffreEmploi> listOffreEmp = offreEmpDAO.getOffreEmploiByEnt(codeEnt);
        List<Postulat> postulats = null;
        int[] nbPostulat = new int[listOffreEmp.size()]; 
        if(listOffreEmp.isEmpty()){
             request.setAttribute(MESSAGE_EMPLOI, "vide");
        }else{
             for(int i = 0; i < listOffreEmp.size(); i++){
                 postulats = postDAO.getAllPostulationByOffreEmploi(listOffreEmp.get(i).getCodeOffreEmp());
                 nbPostulat[i] = postulats.size();
             }
             request.setAttribute("listOffreEmp", listOffreEmp);
             request.setAttribute("nbPostulat", nbPostulat);
         }
        request.getRequestDispatcher(VUE).forward(request, response);
       }else if(action.equals("modifoffreemp")){
           Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
           OffreEmploi offreEmploi = offreEmpDAO.getOffreEmploi(codeOffreEmp);
           request.setAttribute("OffreEmploi", offreEmploi);
           request.getRequestDispatcher(VUE_MODIF_OFFREEMPLOI).forward(request, response);
       }else if(action.equals("suproffreemp")){
           Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
           OffreEmploi offreEmploi = offreEmpDAO.getOffreEmploi(codeOffreEmp);
           offreEmpDAO.suprOffreEmploi(offreEmploi.getCodeOffreEmp());
           request.getRequestDispatcher("/OffreEmploiServlet?action=affich&id="+entreprise.getCodeEnt()+"&codeOffreEmp=null").forward(request, response);
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
       request.setAttribute(TYPE, "Entreprise");
       Long codeEnt = Long.parseLong(request.getParameter("codeEnt"));
       String action = request.getParameter("action");
       HttpSession session = request.getSession();
       Entreprise entreprise = entrepriseDAO.getEntreprise(codeEnt);
       DateTime dt = new DateTime();
       DateTimeFormatter formatter = DateTimeFormat.forPattern( FORMAT_DATE );
       String date = dt.toString( formatter );
       CreationOffreEmploi form =new CreationOffreEmploi(offreEmpDAO);
       
       if(action.equals("ajoutoffreEmp")){
           if (form.getErreurs().isEmpty()) {
               form.creerOffreEmploi(request, entreprise, date);
               session.setAttribute(SESSION_ENTREPRISE,entreprise);
               List<OffreEmploi> listOffreEmp = offreEmpDAO.getOffreEmploiByEnt(codeEnt);
               if(listOffreEmp.isEmpty()){
                   request.setAttribute(MESSAGE_EMPLOI, "vide");
               }else{
                   request.setAttribute("listOffreEmp", listOffreEmp);
               }
               request.getRequestDispatcher(VUE).forward(request, response);
           }
         }else if(action.equals("modifoffreemp")){
                    Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
                    if (form.getErreurs().isEmpty()) {
                        form.modifOffreEmploi(request, entreprise, date,codeOffreEmp);
                        session.setAttribute(SESSION_ENTREPRISE,entreprise);
                        List<OffreEmploi> listOffreEmp = offreEmpDAO.getOffreEmploiByEnt(codeEnt);
                        if(listOffreEmp.isEmpty()){
                            request.setAttribute(MESSAGE_EMPLOI, "vide");
                        }else{
                            request.setAttribute("listOffreEmp", listOffreEmp);
                        }
                        request.getRequestDispatcher(VUE).forward(request, response);
                    }
                    
                }
           }
       }

