/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur;

import dao.EntrepriseDAO;
import exception.FormValidationException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import metier.EntrepriseForm;
import model.Entreprise;

/**
 *
 * @author xavier_ng
 */
public class ProfilEntrepriseServlet extends HttpServlet {

    @EJB
    EntrepriseDAO entrepriseDAO;
    
     public static final String SESSION_ENTREPRISE = "sessionUtilisateur";
     public static final String VUE_PROFIL = "/profilentreprise.jsp";
    public static final String TYPE ="type";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action.equals("affich")){
            Long codeEnt = Long.parseLong(request.getParameter("id"));
            Entreprise entreprise = entrepriseDAO.getEntreprise(codeEnt);
            HttpSession session = request.getSession();
            session.setAttribute(SESSION_ENTREPRISE, entreprise);
        }else{
            
        }
        request.setAttribute(TYPE, "Entreprise");
        request.getRequestDispatcher(VUE_PROFIL).forward(request, response);
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
       String action = request.getParameter("action");
       Long codeEnt = Long.parseLong(request.getParameter("codeEnt"));
       Entreprise entreprise = new Entreprise();
       if(action.equals("modifprofil")){
           entreprise = entrepriseDAO.getEntreprise(codeEnt);
           try {
               EntrepriseForm form = new EntrepriseForm(entrepriseDAO);
               form.modifEntreprise(request,entreprise.getCode(), codeEnt);
           } catch (FormValidationException ex) {
               Logger.getLogger(ProfilEntrepriseServlet.class.getName()).log(Level.SEVERE, null, ex);
           }
           HttpSession session = request.getSession();
           session.setAttribute(SESSION_ENTREPRISE, entreprise);
           request.getRequestDispatcher(VUE_PROFIL).forward(request, response);
       }
    }
}
