/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlleur;

import dao.EntrepriseDAO;
import dao.InstitutDAO;
import dao.OffreEmploiDAO;
import dao.OffreFormationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.OffreEmploi;
import model.OffreFormation;

/**
 *
 * @author Dry Bass
 */
@WebServlet(name = "AfficheOffreEmploiServlet", urlPatterns = {"/AfficheOffreEmploiServlet"})
public class AfficheListeOffreServlet extends HttpServlet {
    
     @EJB
    private EntrepriseDAO entrepriseDAO;
    @EJB
    private InstitutDAO institutDAO;
    @EJB
    private OffreEmploiDAO offreEmpDAO;
    @EJB
    private OffreFormationDAO offreFormDAO;
    
    public static final String ATT_SESSION_USER ="sessionUtilisateur";
    public static final String VUE_EMPLOI = "/listeoffreemploi.jsp";
    public static final String VUE_FORMATION = "/listeoffreformation.jsp";
    public static final String TYPE ="type"; 
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<OffreFormation> listForm = offreFormDAO.getAllFormation();
        List<OffreEmploi> listEmp = offreEmpDAO.getAllOffreEmploi();
        String affich = request.getParameter("affich");
        String offre = request.getParameter("offre");
        if(offre.equalsIgnoreCase("emploi")){
            request.setAttribute("listEmp", listEmp);
            if(affich.equalsIgnoreCase("candidat")){
                
                request.setAttribute(TYPE, "Candidat");
            } else if (affich.equalsIgnoreCase("entreprise")){
                request.setAttribute(TYPE, "Entreprise");
            } else if (affich.equalsIgnoreCase("institut")){
                request.setAttribute(TYPE, "Institut");
            }
            this.getServletContext().getRequestDispatcher(VUE_EMPLOI).forward(request, response);
        } else if (offre.equalsIgnoreCase("formation")){
            request.setAttribute("listForm", listForm);
            if(affich.equalsIgnoreCase("candidat")){
                request.setAttribute(TYPE, "Candidat");
            } else if (affich.equalsIgnoreCase("entreprise")){
                request.setAttribute(TYPE, "Entreprise");
            } else if (affich.equalsIgnoreCase("institut")){
                request.setAttribute(TYPE, "Institut");
            }
            this.getServletContext().getRequestDispatcher(VUE_FORMATION).forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
