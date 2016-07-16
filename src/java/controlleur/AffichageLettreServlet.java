/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlleur;

import dao.CandidatDAO;
import dao.EntrepriseDAO;
import dao.LettreMotivationDAO;
import dao.OffreEmploiDAO;
import dao.UserDAO;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Candidat;
import model.Entreprise;
import model.LettreMotivation;
import model.OffreEmploi;
import model.Users;

/**
 *
 * @author Dry Bass
 */
public class AffichageLettreServlet extends HttpServlet {

    @EJB
    private LettreMotivationDAO lmDAO;
    @EJB
    private CandidatDAO candidatDAO;
    @EJB
    private UserDAO userDAO;
    @EJB
    private EntrepriseDAO entrepriseDAO;
    @EJB
    private OffreEmploiDAO ofDAO;
    public static final String SESSION_ENTREPRISE = "sessionUtilisateur";
    public static final String VUE_LETTRE_MOTIVATION = "/affichelettremotiv.jsp";
    public static final String TYPE ="type";
    private static final String MESSAGE = "message";
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        Long code = Long.parseLong(request.getParameter("codeEnt"));
        Long codeCan = Long.parseLong(request.getParameter("codeCan"));
        Long codeOffreEmp = Long.parseLong(request.getParameter("codeOffreEmp"));
        Users utilisateur = userDAO.getUserById(code);
        Entreprise entreprise = entrepriseDAO.getEntreprise(utilisateur);
        Candidat candidat = candidatDAO.getCandidatById(codeCan);
        OffreEmploi offreEmploi = ofDAO.getOffreEmploi(codeOffreEmp);
        HttpSession session = request.getSession();
        session.setAttribute(SESSION_ENTREPRISE, entreprise);
        request.setAttribute(TYPE, "Entreprise");
        request.setAttribute("candidat", candidat);
        request.setAttribute("offreEmploi", offreEmploi);
        LettreMotivation lettre = lmDAO.getLettreCandidatOffre(codeCan, codeOffreEmp);
        if(lettre == null){
            request.setAttribute(MESSAGE, "vide");
        }else {
            request.setAttribute(MESSAGE, "ok");
            request.setAttribute("lettre", lettre);
        }
        request.getRequestDispatcher(VUE_LETTRE_MOTIVATION).forward(request, response);
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
