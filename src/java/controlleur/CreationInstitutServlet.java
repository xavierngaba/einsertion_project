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
public class CreationInstitutServlet extends HttpServlet {
    @EJB
    private InstitutDAO institutDAO;
    public static final String ATT_INSTITUT = "institut";
    public static final String ATT_FORM = "form";
    public static final String TYPE ="type";
    public static final String ERREUR ="erreur";
    public static final String SESSION_INSTITUT = "sessionUtilisateur";
    public static final String VUE_INSTITUT = "/accueilinstitut.jsp";
    public static final String VUE_FORM = "/inscription.jsp";
    /**
     * Handles the HTTP 
     *<code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
            
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
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
    try {
        InstitutForm form = new InstitutForm(institutDAO);
        Institut institut = form.creerInstitut(request);
        request.setAttribute(ATT_INSTITUT, institut);
        request.setAttribute(ATT_FORM, form);
        if (form.getErreurs().isEmpty()) {
            HttpSession session = request.getSession();
            session.setAttribute(SESSION_INSTITUT, institut);
            request.setAttribute(TYPE, "Institut");
            this.getServletContext().getRequestDispatcher(VUE_INSTITUT).forward(request, response);
        }else{
            request.setAttribute(ERREUR, "ErreurInstitut");
            this.getServletContext().getRequestDispatcher(VUE_FORM).forward(request, response);
        }
    } catch (FormValidationException ex) {
        Logger.getLogger(CreationInstitutServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
        
    }
}
