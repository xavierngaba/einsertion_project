/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlleur;

import dao.InstitutDAO;
import exception.FormValidationException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import metier.InstitutForm;
import model.Institut;

/**
 *
 * @author Dry Bass
 */
@WebServlet(name = "ProfilInstitutServlet", urlPatterns = {"/ProfilInstitutServlet"})
public class ProfilInstitutServlet extends HttpServlet {

    @EJB
    InstitutDAO institutDAO;
    
    public static final String SESSION_INSTITUT = "sessionUtilisateur";
    public static final String VUE_PROFIL = "/profilinstitut.jsp";
    public static final String TYPE = "type";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action.equals("affich")){
            Long codeIns = Long.parseLong(request.getParameter("id"));
            Institut institut = institutDAO.getInstitut(codeIns);
            HttpSession session = request.getSession();
            session.setAttribute(SESSION_INSTITUT, institut);
        }
        request.setAttribute(TYPE, "Institut");
        this.getServletContext().getRequestDispatcher(VUE_PROFIL).forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       request.setAttribute(TYPE, "Institut");
       String action = request.getParameter("action");
       Long codeIns = Long.parseLong(request.getParameter("codeIns"));
       Institut institut = new Institut();
       if(action.equals("modifprofil")){
           institut = institutDAO.getInstitut(codeIns);
           try {
               InstitutForm form = new InstitutForm(institutDAO);
               form.modifInstitut(request,institut.getCode(), codeIns);
           } catch (FormValidationException ex) {
               Logger.getLogger(ProfilInstitutServlet.class.getName()).log(Level.SEVERE, null, ex);
           }
           HttpSession session = request.getSession();
           session.setAttribute(SESSION_INSTITUT, institut);
           request.getRequestDispatcher(VUE_PROFIL).forward(request, response);
       }
    }
}
