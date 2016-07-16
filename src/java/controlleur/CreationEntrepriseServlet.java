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
public class CreationEntrepriseServlet extends HttpServlet {
    @EJB
    private EntrepriseDAO entrepriseDAO;
    public static final String ATT_ENTREPRISE = "entreprise";
    public static final String ATT_FORM = "form";
    public static final String TYPE ="type";
    public static final String ERREUR ="erreur";
    public static final String SESSION_ENTREPRISE = "sessionUtilisateur";
    public static final String VUE_ENTREPRISE = "/accueilentreprise.jsp";
    public static final String VUE_FORM = "/inscription.jsp";
    
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
        try {
            EntrepriseForm form = new EntrepriseForm(entrepriseDAO);
            Entreprise entreprise = form.creerEntreprise(request);
            request.setAttribute(ATT_ENTREPRISE, entreprise);
            request.setAttribute(ATT_FORM, form);
            if(form.getErreurs().isEmpty()){
                HttpSession session = request.getSession();
                session.setAttribute(SESSION_ENTREPRISE, entreprise);
                request.setAttribute(TYPE, "Entreprise");
                this.getServletContext().getRequestDispatcher(VUE_ENTREPRISE).forward(request, response);
            }else{
                request.setAttribute(ERREUR, "ErreurEntreprise");
                this.getServletContext().getRequestDispatcher(VUE_FORM).forward(request, response);
            }
        } catch (FormValidationException ex) {
            Logger.getLogger(CreationEntrepriseServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
